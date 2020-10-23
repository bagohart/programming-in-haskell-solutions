-- stop fac from not terminating
fac :: Int -> Int
fac 0 = 1
fac n   | n < 0 = fac (-n)
        | otherwise = n * fac (n-1)
