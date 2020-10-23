unfold p h t x  | p x = []
                | otherwise  = h x : unfold p h t (t x)

iterate' f = unfold (const False) id f

map' f = unfold null (f . head) tail

chop8 :: [Int] -> [[Int]]
chop8 = unfold null (take 8) (drop 8)
