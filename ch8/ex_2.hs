data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Eq, Show)

-- this is a bit more efficient than the original version since the comparison is executed only once
occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf y) = x == y
occurs x (Node l y r)   | cmp == EQ = True
                        | cmp == LT = occurs x l
                        | cmp == GT = occurs x r
                            where cmp = compare x y  
