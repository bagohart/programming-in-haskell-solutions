{-
2+3
    expr
-> term + expr
-> term + term
-> factor + factor
-> nat + nat
-> 2 + 3

2*3*4

    expr
-> term
-> factor * term
-> nat * term
-> 2 * term
-> 2 * factor * term
-> 2 * nat * term
-> 2 * 3 * term
-> 2 * 3 * factor
-> 2 * 3 * nat
-> 2 * 3 * 4

(2+3)+4
    expr
-> term + expr
-> factor + expr
-> (expr) + expr
-> (term + expr) + expr
-> (factor + expr) + expr
-> (nat + expr) + expr
-> (2 + expr) + expr
-> (2 + term) + term
-> (2 + factor) + factor
-> (2 + 3) + 4

-}
