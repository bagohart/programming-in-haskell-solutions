{-
Show:
add n m = add m n

IB:
add Zero m = m

add m Zero = m

IS:
add (Succ n) m # def. add
= Succ (add n m)

add m (Succ n) # statement 1
= Succ (add n m)
-}
