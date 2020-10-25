{-# LANGUAGE InstanceSigs #-}

import Control.Applicative
import Data.Char

newtype Parser a = P (String -> [(a,String)])

parse :: Parser a -> String -> [(a,String)]
parse (P p) inp = p inp

item :: Parser Char
item = P (\inp -> case inp of
                    [] -> []
                    (x:xs) -> [(x,xs)])

three :: Parser (Char,Char)
three = g <$> item <*> item <*> item
    where g x y z = (x,z)

three' :: Parser (Char,Char)
three' = do
    x <- item
    _ <- item
    z <- item
    return (x,z)

sat :: (Char -> Bool) -> Parser Char
sat p = do x <- item
           if p x then return x else empty

digit :: Parser Char
digit = sat isDigit

lower :: Parser Char
lower = sat isLower

upper :: Parser Char
upper = sat isUpper

letter :: Parser Char
letter = sat isAlpha

alphanum :: Parser Char
alphanum = sat isAlphaNum

char :: Char -> Parser Char
char x = sat (== x)

string :: String -> Parser String
string [] = return []
string (x:xs) = do char x -- in both lines we can throw away the value because we already know what it will be
                   string xs
                   return (x:xs)

-- or in applicative style
string' :: String -> Parser String
string' [] = pure []
string' (x:xs) = (:) <$> char x <*> string xs
                
ident :: Parser String
ident = do x <- lower
           xs <- many alphanum
           return (x:xs)

nat :: Parser Int
nat = do xs <- some digit
         return (read xs)

space :: Parser ()
space = many (sat isSpace) >> return ()

int :: Parser Int
int = nat <|> (char '-' >> nat >>= (\n -> return (-n)) )

token :: Parser a -> Parser a
token p = do space
             v <- p
             space
             return v

identifier :: Parser String
identifier = token ident

natural :: Parser Int
natural = token nat

integer :: Parser Int
integer = token int

symbol :: String -> Parser String
symbol xs = token (string xs)

nats :: Parser [Int]
nats = do symbol "["
          n <- natural
          ns <- many (symbol "," >> natural)
          symbol "]"
          return (n:ns)

instance Functor Parser where 
    fmap :: (a -> b) -> Parser a -> Parser b
    fmap g p = P (\inp -> case parse p inp of
                            [] -> []
                            [(v,out)] -> [(g v, out)])

instance Applicative Parser where 
    pure :: a -> Parser a
    pure x = P (\inp -> [(x,inp)])

    (<*>) :: Parser (a -> b) -> Parser a -> Parser b
    (<*>) pg px = P (\inp -> case parse pg inp of
                               [] -> []
                               [(g,out)] -> parse (g <$> px) out)

instance Alternative Parser where 
    empty :: Parser a
    empty = P (\inp -> [])

    (<|>) :: Parser a -> Parser a -> Parser a
    (<|>) p q = P $ \inp -> case parse p inp of
                              [] -> parse q inp
                              [(v,out)] -> [(v,out)]

instance Monad Parser where 
    (>>=) :: Parser a -> (a -> Parser b) -> Parser b
    (>>=) p f = P (\inp -> case parse p inp of
                             [] -> []
                             [(v,out)] -> parse (f v) out)

--- new stuff below

expr :: Parser Int
expr = do t <- term
          (do symbol "+"
              e <- expr
              return (t + e))
            <|>
            return t

term :: Parser Int
term = do f <- factor
          (do symbol "*"
              t <- term
              return (f * t))
              <|>
            return f

factor :: Parser Int
factor = do symbol "("
            e <- expr
            symbol ")"
            return e
        <|>
            natural

eval :: String -> Int
eval xs = case (parse expr xs) of
            [(n,[])]    -> n
            [(_,out)]   -> error ("Unused input " ++ out)
            []          -> error "Invalid input"

--- here the exercise
data Expr = Plus Term Expr | T Term deriving (Eq, Show)
data Term = Mult Factor Term | F Factor deriving (Eq, Show)
data Factor = Par Expr | N Nat deriving (Eq, Show)
data Nat = Nat Int deriving (Eq, Show)

expr' :: Parser Expr
expr' = do t <- term'
           do symbol "+"
              e <- expr'
              return (Plus t e)
            <|> return (T t)

term' :: Parser Term
-- term' = undefined
term' = do f <- factor'
           do symbol "*"
              t <- term'
              return (Mult f t)
              <|>
            return (F f)

factor' :: Parser Factor
factor' = do symbol "("
             e <- expr'
             symbol ")"
             return (Par e)
        <|>
            N <$> natural'

natural' :: Parser Nat
natural' = Nat <$> token nat

eval' :: String -> Expr
eval' xs = case (parse expr' xs) of
            [(n,[])]    -> n
            [(_,out)]   -> error ("Unused input " ++ out)
            []          -> error "Invalid input"