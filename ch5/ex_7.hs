lcOri = [(x,y) | x <- [1,2], y <- [3,4]]

-- note that x and y appear in opposite order to preserve final tuple order
lcNew' = [[(x,y) | y <- [3,4]] | x <- [1,2]]
lcNew = concat lcNew'
