find :: Eq a => a -> [(a,b)] -> [b]
find k t = [v | (k',v) <- t, k == k']

positions1 :: Eq a => a -> [a] -> [Int]
positions1 x xs = [i | (x',i) <- zip xs [0..], x == x']

-- this is new
positions2 :: Eq a => a -> [a] -> [Int]
positions2 x xs = find x (zip xs [0..])
