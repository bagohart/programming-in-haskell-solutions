data Tree a = Leaf | Node (Tree a) a (Tree a) deriving (Eq, Show)

-- constructs a tree with infinitely many nodes everywhere
repeat' :: a -> Tree a
repeat' x = Node (repeat' x) x (repeat' x)

-- takes the first n levels of the tree, and fills the rest with leafs
take' :: Int -> Tree a -> Tree a
take' 0 _            = Leaf
take' _ Leaf         = Leaf
take' n (Node l x r) = Node (take' (n-1) l) x (take' (n-1) r)

-- creates a tree with exactly n levels full of the same value
replicate' :: Int -> a -> Tree a
replicate' 0 _ = Leaf
replicate' n x = Node subtree x subtree
    where subtree = (replicate' (n-1) x)
