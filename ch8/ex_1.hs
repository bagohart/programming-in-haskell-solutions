data Nat = Zero | Succ Nat deriving (Show,Eq)

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)

-- (m+1) * n = m*n + n
mult :: Nat -> Nat -> Nat
mult Zero m = Zero
mult (Succ n) m = (mult n m) `add` m

