data Tree = Leaf Int | Node Tree Tree

numLeaves :: Tree -> Int
numLeaves (Leaf _) = 1
numLeaves (Node l r) = numLeaves l + numLeaves r

numNodes :: Tree -> Int
numNodes (Leaf _) = 0
numNodes (Node l r) = 1 + numNodes l + numNodes r

{-
Show: numLeaves t = numNodes t + 1

IB:
    numLeaves (Leaf i) # numLeaves.1
=   1
=   0 + 1

    numNodes (Leaf i) # numNodes.1
=   0

IS:
    numLeaves (Node l r) # numLeaves.2
=   numLeaves l + numLeaves r # IH
=   (numNodes l + 1) + (numNodes r + 1) # + associative and commutative
=   1 + (1 + numNodes l + numNodes r)

    numNodes (Node l r) # numNodes.2
=   1 + (numNodes l + numNodes r)
-}
