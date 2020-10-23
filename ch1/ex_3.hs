product' :: Num a => [a] -> a
product' [] = 1
product' (x:xs) = x * product' xs

-- product' [2,3,4]
-- = 2 * product' [3,4]
-- = 2 * (3 * product' [4])
-- = 2 * (3 * (4 * product' []))
-- = 2 * (3 * (4 * 1))
-- = 2 * (3 * 4)
-- = 2 * 12
-- = 24
