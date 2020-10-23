scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum $ zipWith (*) xs ys
