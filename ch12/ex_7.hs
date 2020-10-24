{-# LANGUAGE InstanceSigs #-}

data Expr a = Var a | Val Int | Add (Expr a) (Expr a) deriving Show

instance Functor Expr where 
    fmap _ (Val i) = Val i
    fmap f (Var x) = Var $ f x
    fmap f (Add e1 e2) = Add (f <$> e1) (f <$> e2)

instance Applicative Expr where 
    pure x = Var x
    (<*>) :: Expr (a -> b) -> Expr a -> Expr b
    (<*>) (Val i) e = Val i
    (<*>) (Var f) (Val i) = Val i
    (<*>) (Var f) (Var x) = Var $ f x
    (<*>) fab (Add e1 e2) = Add (fab <*> e1) (fab <*> e2)

instance Monad Expr where 
    return = pure
    (>>=) :: Expr a -> (a -> Expr b) -> Expr b
    (>>=) (Val i) _ = Val i
    (>>=) (Var x) f = f x
    (>>=) (Add e1 e2) f = Add (e1 >>= f) (e2 >>= f)

e = Add (Var "lol") (Val 5)
eBound = e >>= \c -> Val $ length c
-- -> eBound e = Add (Val 3) (Val 5)
-- The >>= operator for this instance replaces a variable with a new expression.
-- This new expression depends on the variable.
