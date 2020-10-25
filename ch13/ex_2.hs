{-
2+3+4

        expr
        /  | \
     expr  +  expr
     / |  \       \     
   expr + expr   factor 
   |       |        |    
   term   term     nat  
   |       |        |
   2       3        4 
             
or
expr -> (expr + expr)
-> expr + (expr + expr)
-> term + (term + term)
-> 2 + (3 + 4)
             
             

-}
