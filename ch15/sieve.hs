primes = sieve [2..]

sieve (p:xs) = p : sieve (filter (\n -> n `mod` p /= 0) xs)
