
sqroot :: Double -> Double
sqroot n = snd $ head $ dropWhile (\(n,m) -> abs (n-m) > distance) (approximations n `zip` tail (approximations n))
    where distance = 0.00001

approximations :: Double -> [Double]
approximations n = iterate next initial
    where initial = 1.0
          next a = (a + n/a) / 2
