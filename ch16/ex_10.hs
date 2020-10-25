{-
Prove monad laws for the list type:
1. return x >>= f = f x
2. mx >>= return = mx
3. (mx >>= f) >>= g = mx >>= (\x -> (f x >>= g))

1.
    return x >>= f
=   [x] >>= f
=   [y | y <- f x]
=   f x

2.
    mx >>= return
=   [y | x <- mx, y <- return x]
=   [y | x <- mx, y <- [x]]
=   [x | x <- mx]
=   mx

    (mx >>= f) >>= g
=   [y | x <- mx, y <- f x] >>= g
=   [z | w <- [y | x <- mx, y <- f x], z <- g w]

    mx >>= (\x -> (f x >>= g))
=   [y | x <- mx, y <- (\z -> (f z >>= g)) x]
=   [y | x <- mx, y <- (f x >>= g)]
=   [y | x <- mx, y <- [z | x' <- f x, z <- g x']]

... so these are supposedly equivalent. hm.
not sure which 'simple properties of list comprehensions' are helpful here though and this looks a bit boring ._.

-}
