{-
Show: applicative laws for Maybe, i.e.:
1. pure id <*> x = x
2. pure (g x) = pure g <*> pure x
3. x <*> pure y = pure (\g -> g y) <*> x
4. x <*> (y <*> z) = (pure (.) <*> x <*> y) <*> z

Case analysis, x = Nothing:
1.
    pure id <*> Nothing
=   Just id <*> Nothing
=   Nothing

2. (no choice about cases possible here!)
    pure (g x)
=   Just (g x)

    pure g <*> pure x
=   Just g <*> Just x
=   Just (g x)

3.
    Nothing <*> pure y
=   Nothing <*> (Just y)
=   Nothing

    pure (\g -> g y) <*> Nothing
=   Just (\g -> g y) <*> Nothing
=   Nothing

4.
    Nothing <*> (y <*> z)
=   Nothing

    (pure (.) <*> Nothing <*> y) <*> z
=   ((Just (.)) <*> Nothing <*> y) <*> z
=   (Nothing <*> y) <*> z
=   Nothing <*> z
=   Nothing
-}

{-
Case analysis, x = Just a:
1. pure id <*> x = x
2. pure (g x) = pure g <*> pure x
3. x <*> pure y = pure (\g -> g y) <*> x
4. x <*> (y <*> z) = (pure (.) <*> x <*> y) <*> z

1.
    pure id <*> (Just a)
=   Just id <*> Just a
=   Just a

(skip 2, done above)

3. x = Just f
    Just f <*> pure y
=   Just f <*> Just y
=   Just (f y)

    pure (\g -> g y) <*> x
=   Just (\g -> g y) <*> Just f
=   Just ((\g -> g y) f)
=   Just (f y)

4. x = Just f, y = Just g, z = Just m
    (Just f) <*> (Just g <*> Just m)
=   (Just f) <*> (Just (g m))
=   Just (f (g m))

    (pure (.) <*> (Just f) <*> y) <*> z
=   (Just (.) <*> (Just f) <*> y) <*> z
=   (Just (.) <*> (Just f) <*> Just g) <*> z
=   (Just f . g) <*> Just m
=   Just ((f . g) m)
=   Just (f (g m))

For x,y or z = Nothing, everything immediately becomes Nothing.
too many cases to check each one :)
-}
