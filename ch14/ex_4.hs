data Tree a = Leaf | Node (Tree a) a (Tree a) deriving (Eq, Show)

instance Functor Tree where 
    fmap _ Leaf = Leaf
    fmap f (Node l x r) = Node (fmap f l) (f x) (fmap f r)

-- copied so far from ex 12.1

instance Foldable Tree where 
    foldMap f Leaf = mempty
    foldMap f (Node l x r) = foldMap f l <> f x <> foldMap f r

instance Traversable Tree where 
    traverse f Leaf = pure Leaf
    traverse f (Node l x r) = pure Node <*> traverse f l <*> f x <*> traverse f r
