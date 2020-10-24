import Data.Foldable

data Maaaybe a = Juust a | Noothing deriving (Eq, Show)

instance Functor Maaaybe where 
    fmap _ Noothing = Noothing
    fmap f (Juust x) = Juust $ f x

instance Foldable Maaaybe where 
    foldMap _ Noothing = mempty
    foldMap f (Juust x) = f x

    fold Noothing = mempty
    fold (Juust x) = x

    foldr _ e Noothing = e
    foldr f e (Juust x) = f x e

    foldl _ e Noothing = e
    foldl f e (Juust x) = f e x

instance Traversable Maaaybe where 
    traverse _ Noothing = pure Noothing
    traverse f (Juust x) = pure Juust <*> f x

    sequenceA Noothing = pure Noothing
    sequenceA (Juust x) = pure Juust <*> x

