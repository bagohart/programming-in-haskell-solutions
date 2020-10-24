data FT a b = FT (a -> b)

instance (Semigroup b) => Semigroup (FT a b) where 
    (<>) (FT f) (FT g) = FT $ \a -> f a <> g a

instance (Monoid b) => Monoid (FT a b) where 
    mempty = FT (const mempty)


