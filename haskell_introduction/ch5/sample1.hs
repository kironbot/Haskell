f :: Maybe Int
f = do
    x <- Just 10
    Nothing
    return $ x * 2