third1 :: [a] -> a
third1 = head . tail . tail

third2 :: [a] -> a
third2 xs = xs !! 2

third3 :: [a] -> a
third3 (x1:(x2:(x3:xs))) = x3
