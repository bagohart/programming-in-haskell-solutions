data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Eq, Show)

halve :: [a] -> ([a],[a])
halve xs = (take (length xs `div` 2) xs, drop (length xs `div` 2) xs)

balance :: [a] -> Tree a
balance [x] = Leaf x
balance xs = Node (balance ln) (balance rn)
    where (ln,rn) = halve xs
