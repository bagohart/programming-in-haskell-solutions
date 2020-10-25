{-
Show by induction n n and xs: take n xs ++ drop n xs = xs

IB: n = 0 and xs = []
    take 0 [] ++ drop 0 [] # take.1 and drop.1
=   [] ++ []
=   []

IS: n+1 and (x:xs)
    take (n+1) (x:xs) ++ drop (n+1) (x:xs) # take.3
=   x : take n xs ++ drop (n+1) (x:xs) # drop.3
=   x : take n xs ++ drop n xs # IH
=   x : xs

The task states that there are three cases, but I didn't need them? o_O
-}
