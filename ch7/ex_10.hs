altMap _ _ [] = []
altMap f g (x:xs) = f x : altMap g f xs

-- new
luhn :: [Int] -> Bool
luhn xs = summy `mod` 10 == 0
    where summy = sum $ altMap id (\n -> if 2*n > 10 then (2*n)-9 else 2*n) (reverse xs)
