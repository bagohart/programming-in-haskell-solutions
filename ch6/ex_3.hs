-- use x^n = x^(n-1) * x
exp' :: Int -> Int -> Int
exp' x 0 = 1
exp' x n = x * exp' x (n-1)
