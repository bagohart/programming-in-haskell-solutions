{-
Show: functor laws for Maybe, i.e.
fmap id = id
fmap (g . h) = fmap g . fmap h

Case Nothing:
    fmap id Nothing
=   Nothing

    id Nothing
=   Nothing

    fmap (g . h) Nothing
=   Nothing

    (fmap g . fmap h) Nothing
=   (fmap g) Nothing
=   Nothing

Case Just x:
    fmap id (Just x)
=   Just (id x)
=   Just x

    id (Just x)
=   Just x

    fmap (g . h) (Just x)
=   Just ((g . h) x)
=   Just (g (h (x)))

    (fmap g . fmap h) (Just x)
=   (fmap g) (fmap h (Just x))
=   (fmap g) (Just (h x))
=   Just (g (h (x)))
-}
