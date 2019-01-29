import Control.Monad

pentagonals = 0 : zipWith (+) pentagonals (map ((+1) . (*3)) [0..])
pentagonal n = quot (n*(3*n-1)) 2

main = do
  n <- readLn
  replicateM_ n (
    do
      m <- readLn
      print $ pentagonal m
    )
