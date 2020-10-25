{-# LANGUAGE InstanceSigs #-}

{-
Grammar for natural number with left-associating subtraction operator:
expr ::= (expr - nat) | nat
nat ::= 0 | 1 | ...
-}

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
-- 8.a
{-
Grammar for natural number with left-associating subtraction operator:
expr ::= (expr - nat) | nat
nat ::= 0 | 1 | ...
-}

-- 8.b
expr :: Parser Int
expr = leftExpr <|> natural

leftExpr :: Parser Int
leftExpr = do e <- expr
              symbol "-"
              n <- natural
              return (e - n)

-- 8.c
-- yeah, this doesn't terminate because left recursion :)
-- try again...
--
-- 1 - 2 - 3
-- ~>
-- (1 - 2) - 3
-- = foldl1 (-) [1,2,3]

-- 8.d the task suggests foldl, but foldl1 seemed more intuitive to me:
expr' :: Parser Int
expr' = do most <- many leftExpr'
           last <- natural
           return (foldl1 (-) (most ++ [last]))

leftExpr' :: Parser Int
leftExpr' = do n <- natural
               symbol "-"
               return n

-- 8.d and now once more with foldl:
expr'' :: Parser Int
expr'' = do first <- natural
            rest <- many (symbol "-" >> natural)
            return (foldl (-) first rest)
-- okay, that is in fact tidier than my first attempt, and probably a bit more efficient.

eval :: String -> Int
eval xs = case (parse expr xs) of
            [(n,[])]    -> n
            [(_,out)]   -> error ("Unused input " ++ out)
            []          -> error "Invalid input"
