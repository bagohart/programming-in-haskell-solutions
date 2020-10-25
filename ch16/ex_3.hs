{-
IB:
    all (==x) (replicate 0 x) # replicate.1
=   all (==x) [] # all.1
=   True

IS:
    all (==x) (replicate (n+1) x) # replicate.2
=   all (==x) (x : replicate ((n+1)-1) x) # all.2
=   (==x) x && all (==x) replicate ((n+1)-1) x # def. ==
=   True && replicate ((n+1)-1) x # ...
=   True && replicate n x # IH
=   True && True
-}
