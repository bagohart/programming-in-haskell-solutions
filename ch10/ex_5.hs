adder :: IO ()
adder = do putStr "How many numbers? "
           count <- (read :: String -> Int) <$> getLine
           -- if a non-number is entered, this fails only later. I guess this is because of lazy evaluation o_O
           numbers <- sequence $ replicate count ((read :: String -> Int) <$> getLine)
           putStrLn ("The total is " ++ show (sum numbers))
