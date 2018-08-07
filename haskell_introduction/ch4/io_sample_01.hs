main :: IO ()
main = 
    getLine >>= \x ->
    getLine >>= \y ->
    putStrLn ("1st Input: " ++ x) >>
    putStrLn ("2nd Input: " ++ y)