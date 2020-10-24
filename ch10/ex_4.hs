aux :: (Int,Int) -> IO ()
aux (sum,0) = putStrLn ("The total is " ++ show sum)
aux (sum,n) = do num <- (read :: String -> Int) <$> getLine
                 aux (sum+num, n-1)

adder :: IO ()
adder = do putStr "How many numbers? "
           count <- (read :: String -> Int) <$> getLine
           aux (0,count)
