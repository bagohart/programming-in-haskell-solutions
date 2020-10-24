filterF :: Foldable t => (a -> Bool) -> t a -> [a]
filterF p = foldMap (\a -> if p a then [a] else [])
