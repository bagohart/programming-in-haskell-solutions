{-
1. pure id <*> x = x
x :: f a

2. pure (g x) = pure g <*> pure x
g :: a -> b
x :: a

3. x <*> pure y = pure (\g -> g y) <*> x
x :: f (a -> b)
y :: a (weil pure y :: f a)
g :: a -> b

4. x <*> (y <*> z) = (pure (.) <*> x <*> y) <*> z
z :: f a
y :: f (a -> b)
x :: f (b -> c)
-}
