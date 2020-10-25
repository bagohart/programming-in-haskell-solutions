{-
2
if you try to parse this with the unoptimized grammar, you get:
    expr
->  term + expr <|> term
-> (term * term <|> factor) + expr <|> term
so the parser tries many things which cannot succeed.
In fact, I'm not sure if that even terminates, since the
    term -> term * term
rule has so much in-built recursion and naively translating that into an ambiguous parser
seems not to hit the terminating condition o_O
-}
