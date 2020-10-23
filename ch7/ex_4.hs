dec2int :: [Int] -> Int
dec2int = foldl (\b a -> 10*b + a) 0
