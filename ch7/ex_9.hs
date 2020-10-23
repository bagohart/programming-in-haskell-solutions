altMap _ _ [] = []
altMap f g (x:xs) = f x : altMap g f xs
