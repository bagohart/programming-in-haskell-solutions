data Tree a = Leaf a | Node (Tree a) (Tree a)

numLeaves :: Tree a -> Int
numLeaves (Leaf _) = 1
numLeaves (Node l r) = numLeaves l + numLeaves r

balanced :: Tree a -> Bool
balanced (Leaf _) = True
balanced (Node l r) = abs (numLeaves l - numLeaves r) <= 1 && balanced l && balanced r
