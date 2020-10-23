data Maybe' a = Just' a | Nothing' deriving Show

instance Eq a => Eq (Maybe' a) where 
    (==) (Just' _) Nothing' = False
    (==) (Just' x) (Just' y) = x == y
    (==) Nothing' Nothing' = True

newtype TheList a = TL [a]

instance Eq a => Eq (TheList a) where 
    (==) (TL l) (TL r) = length l == length r && (and $ zipWith (==) l r)
