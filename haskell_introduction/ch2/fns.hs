incr n = n + 1 :: Int

add m n = m + n :: Int

square x = x ^ 2

incrsquare = square . incr

percentage k n 
    | n ==0 = Nothing
    | otherwise = Just (100.0 * k / n)
