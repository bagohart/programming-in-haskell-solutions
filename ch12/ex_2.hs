data F a b = F (a -> b)

instance Functor (F a) where 
    fmap f (F g) = F $ f . g
