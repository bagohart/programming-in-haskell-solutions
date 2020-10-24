{-# LANGUAGE InstanceSigs #-}

type State = Int
newtype ST a = S (State -> (a,State))

app :: ST a -> State -> (a,State)
app (S st) x = st x

instance Monad ST where 
    (>>=) :: ST a -> (a -> ST b) -> ST b
    (>>=) st f = S (\s -> let (x,s') = app st s in app (f x) s')

instance Functor ST where 
    fmap :: (a -> b) -> ST a -> ST b
    fmap f sta = sta >>= \a -> return $ f a
    -- fmap f sta = do
    --     a <- sta
    --     return $ f a

instance Applicative ST where 
    pure = return 
    (<*>) :: ST (a -> b) -> ST a -> ST b
    (<*>) stab sta = stab >>= \ab -> sta >>= \a -> return (ab a)
    -- (<*>) stab sta = do
    --     ab <- stab
    --     a <- sta
    --     return $ ab a
