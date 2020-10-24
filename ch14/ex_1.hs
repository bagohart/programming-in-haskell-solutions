data MP a b = MP (a,b) deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (MP a b) where 
    (<>) (MP (x,y)) (MP (x',y')) = MP (x<>x', y<>y')

instance (Monoid a, Monoid b) => Monoid (MP a b) where 
    mempty = MP (mempty,mempty)
