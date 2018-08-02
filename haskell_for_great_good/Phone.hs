import Data.List
import Data.Char
import qualified Data.Map as Map


wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort. words

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

encode :: Int -> String -> String
encode offset msg = map (\c -> chr $ ord c + offset) msg

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]

phoneBook = 
    [("betty", "555-2938")
    ,("bonnie", "452-2928")
    ,("suguru", "123-4567")
    ]


findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey key [] = Nothing
findKey key ((k,v):xs)
    | key == k  = Just v
    | otherwise = findKey key xs


phoneBookMap :: Map.Map String String
phoneBookMap = Map.fromList $
    [("betty", "555-2938")
    ,("bonnie", "452-2928")
    ,("suguru", "123-4567")
    ]
