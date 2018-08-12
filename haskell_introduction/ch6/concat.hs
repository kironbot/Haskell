module Main where

import Control.Exception (bracket, finally)
import Control.Monad (forM_)
import System.IO (stdout, Handle, FilePath, IOMode(..), openFile, hClose, hIsEOF, hGetLine, hPutStrLn)
import System.Environment (getArgs)
import Data.Char (toUpper)

-- Write out to stdout
main :: IO ()
main = do
  filePaths <- getArgs
  handleMultiFiles filePaths $ \hdl -> do
    foreachLine hdl $ \line -> do
      hPutStrLn stdout (map toUpper line)

-- Output files to each places
concatMultiFiles :: [FilePath] -> Handle -> IO ()
concatMultiFiles filePaths dst =
  handleMultiFiles filePaths (\hdl -> copyFile hdl dst)

handleMultiFiles :: [FilePath] -> (Handle -> IO ()) -> IO ()
handleMultiFiles filePaths fileHandler =
  forM_ filePaths $ \filePath ->
    bracket
      (openFile filePath ReadMode)
      (\hdl -> hClose hdl)
      (\hdl -> fileHandler hdl)

-- Output one file to an output place
copyFile :: Handle -> Handle -> IO ()
copyFile src dst = copyFileWithConvert src dst id

copyFileWithConvert :: Handle -> Handle -> (String -> String) -> IO ()
copyFileWithConvert src dst convert = loop
  where
    loop = do
      isEOF <- hIsEOF src
      if isEOF
        then return ()
        else do
          line <- hGetLine src
          hPutStrLn dst $ convert line
          loop

foreachLineAndAppend :: Handle -> Handle -> (String -> IO String) -> IO ()
foreachLineAndAppend src dst ioAction =
  foreachLine src $ \line -> do
    output <- ioAction line
    hPutStrLn dst output

foreachLine :: Handle -> (String -> IO ()) -> IO ()
foreachLine src ioAction = loop
  where
    loop = do
      isEOF <- hIsEOF src
      if isEOF
        then return ()
        else do
          line <- hGetLine src
          ioAction line
          loop