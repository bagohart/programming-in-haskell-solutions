sumdown :: Int -> Int
sumdown 0 = 0
sumdown n | n < 0 = error "nope"
          | otherwise = n + (sumdown (n-1))
