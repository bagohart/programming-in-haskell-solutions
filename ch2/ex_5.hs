init1 :: [a] -> [a]
init1 xs = take (length xs - 1) xs

init2 :: [a] -> [a]
init2 = reverse . tail . reverse
