all' f = foldr ((&&) . f) True

any' f = foldr ((||) . f) False

takeWhile' p = foldr (\x ys -> if p x then x : ys else []) []

dropWhile' _ [] = []
dropWhile' p (x:xs) = if p x then dropWhile' p xs else xs
