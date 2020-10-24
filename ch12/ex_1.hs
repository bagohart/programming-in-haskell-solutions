data Tree a = Leaf | Node (Tree a) a (Tree a) deriving (Eq, Show)

instance Functor Tree where 
    fmap _ Leaf = Leaf
    fmap f (Node l x r) = Node (fmap f l) (f x) (fmap f r)
