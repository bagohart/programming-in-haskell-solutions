data Tree a = Leaf a | Node (Tree a) (Tree a)

{-
Show: functor laws for Tree, i.e.
fmap id = id
fmap (g . h) = fmap g . fmap h

    fmap id (Leaf a)
=   Leaf (id a)
=   Leaf a

    id (Leaf a)
=   Leaf a

    fmap (g . h) (Leaf a)
=   Leaf ((g . h) a)
=   Leaf (g (h a))

    (fmap g . fmap h) (Leaf a)
=   fmap g (fmap h (Leaf a))
=   fmap g (Leaf (h a))
=   Leaf (g (h a))

    fmap id (Node l r)
=   Node (fmap id l) (fmap id r) # IH
=   Node (id l) (id r)
=   Node l r
=   id (Node l r)

    fmap (g . h) (Node l r)
=   Node (fmap (g . h) l) (fmap (g . h) r) # IH
=   Node ((fmap g . fmap h) l) ((fmap g . fmap h) r)
=   Node (fmap g (fmap h l)) (fmap g (fmap h r))

    (fmap g . fmap h) (Node l r) # fmap.2
=   (fmap g) (Node ((fmap h) l) ((fmap h) r)) # fmap.2
=   Node (fmap g (fmap h l)) (fmap g (fmap h r))


-}
