{-
Show:
xs ++ [] = xs

IB:
[] ++ [] = []

IS:
    (x:xs) ++ [] # ++.2
=   x : (xs ++ []) # IH
=   x:xs

Show:
xs ++ (ys ++ zs) = (xs ++ ys) ++ zs

IB:
    [] ++ (ys ++ zs) # ++.1
=   ys ++ zs

    (xs ++ ys) ++ zs
=   ([] ++ ys) ++ zs # ++.1
=   ys ++ zs

IS:
    (x:xs) ++ (ys ++ zs) # ++.2
=   x : (xs ++ (ys ++ zs)) # IH
=   x : ((xs ++ ys) ++ zs)

    ((x:xs) ++ ys) ++ zs # ++.2
=   (x : (xs ++ ys)) ++ zs # ++.2
=   x : ((xs ++ ys) ++ zs)
-}
