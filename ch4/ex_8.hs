luhnDouble :: Int -> Int
luhnDouble x = if x > 9 then error "this is not a digit" else subIt (2*x)
    where subIt y = if y > 9 then y - 9 else y

luhn :: Int -> Int -> Int -> Int -> Bool
luhn x1 x2 x3 x4 = sum `mod` 10 == 0
    where sum = luhnDouble x1 + x2 + luhnDouble x3 + x4
