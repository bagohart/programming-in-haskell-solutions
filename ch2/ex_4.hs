last1 :: [a] -> a
last1 xs = xs !! (length xs - 1)

last2 :: [a] -> a
last2 = head . reverse

last3 :: [a] -> a
last3 xs = head $ drop (length xs - 1) xs

