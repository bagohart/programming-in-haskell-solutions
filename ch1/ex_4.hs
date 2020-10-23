-- sorts in reverse order
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort larger ++ [x] ++ qsort smaller
    where 
        smaller = [a | a <- xs, a <= x]
        larger  = [b | b <- xs, b > x]
