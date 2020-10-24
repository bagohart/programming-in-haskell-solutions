-- the code from readLine below cannot drop leading DEL characters x_X
rl :: IO String
rl = dropWhile (=='\DEL') <$> readLine

readLine :: IO String
readLine = do x <- getChar
              case x of
                '\n' -> return []
                '\DEL' -> do
                    -- this task is a bit weird and I don't think my terminal works as the task expects it to =/
                    -- but this seems to work for now o_O
                    putStr "\b\b\b   \b\b\b"
                    xs <- readLine
                    -- here we store the DEL character so we can remove some other character some other time
                    -- this is a bit convoluted, but at this position we don't have access to the previous character
                    -- an alternative would be to pass the state to the recursive call, see next attempt
                    return (x:xs)
                otherwise -> do
                    xs <- readLine
                    case xs of
                      [] -> return [x]
                      ('\DEL':ys) -> return ys -- drop x
                      otherwise -> return (x:xs)

-- the thing above (mostly) works, but let's try a different way because why not.
readMe :: String -> IO String
readMe [] = do x <- getChar
               case x of
                 '\n' -> return []
                 '\DEL' -> do
                     putStr "\b\b\b   \b\b\b"
                     readMe [] -- drop a leading DEL
                 otherwise -> readMe [x]
readMe xs = do x <- getChar
               case x of
                 '\n' -> return xs
                 '\DEL' -> do
                     putStr "\b\b\b   \b\b\b"
                     readMe (init xs)
                 otherwise -> readMe (xs ++ [x])
-- this... works. I wouldn't say that it is particularly elegant, though :)

readLine' :: IO String
readLine' = readMe []
