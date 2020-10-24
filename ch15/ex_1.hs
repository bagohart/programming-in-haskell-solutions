{-
1 + (2*3)
      ^ innermost
^
outermost

(1+2) * (2+3)
      ^
      outermost
^        ^
innermost

fst (1+2, 2+3)
      ^    ^
          innermost
^
outermost

(\x -> 1 + x) (2*3)
         ^
        not reduceable because part of a function
                ^
                innermost
^
outermost (function application)
-}
