disj1 :: Bool -> Bool -> Bool
disj1 True True = True
disj1 True False = True
disj1 False True = True
disj1 False False = False

disj2 :: Bool -> Bool -> Bool
disj2 False False = False
disj2 _ _ = True

disj3 :: Bool -> Bool -> Bool
disj3 True _ = True
disj3 _ True = True
disj3 _ _ = False

disj4 :: Bool -> Bool -> Bool
disj4 True _ = True
disj4 False b = b
