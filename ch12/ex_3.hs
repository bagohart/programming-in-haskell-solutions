{-# LANGUAGE InstanceSigs #-}

data F a b = F (a -> b)

instance Functor (F a) where 
    fmap f (F g) = F $ f . g

instance Applicative (F c) where 
    pure :: a -> F c a
    -- this is F $ const g
    pure g = F $ \x -> g
    (<*>) :: F c (a -> b) -> F c a -> F c b
    -- (<*>) = undefined
    (<*>) (F fab) (F fa) = F $ \x -> fab x (fa x)
