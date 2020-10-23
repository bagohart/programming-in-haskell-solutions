map' f = foldr ((:) . f) []

filter' p = foldr (\x ys -> if p x then x : ys else ys) []
