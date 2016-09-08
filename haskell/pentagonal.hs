import Control.Monad

-- Memoization does not pass the time barriers
pentagonals = 0 : zipWith (+) pentagonals (map ((+1) . (*3)) [0..])
-- The direct formula does
pentagonal n = quot (n*(3*n-1)) 2

main = do
  n <- readLn
  replicateM_ n (
    do
      m <- readLn
      print $ pentagonal m
    )
  
