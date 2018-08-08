f :: Maybe Int
f = do
    x <- Just 1
    Nothing
    return $ x * 2