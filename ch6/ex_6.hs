and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = if x == True then and' xs else False

concat' :: [[a]] -> [a]
concat' [] = []
concat' (xs:xss) = xs ++ concat' xss

replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x = x : replicate' (n-1) x

-- this symbol starts to look a bit scary.
(!!!) :: [a] -> Int -> a
(!!!) (x:xs) 0 = x
(!!!) (_:xs) n = (!!!) xs (n-1)

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' y (x:xs) = if y == x then True else elem' y xs
