-- compute greatest common divisor
euclid :: Int -> Int -> Int
euclid n m  | n == m = n
            | n > m = euclid (n-m) m
            | m > n = euclid (m-n) n

