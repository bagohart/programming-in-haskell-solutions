curry' f = \a -> (\b -> f (a,b))

uncurry' f (a,b) = f a b
