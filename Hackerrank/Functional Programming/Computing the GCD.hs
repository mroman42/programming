module Main where

gcd' :: Integral a => a -> a -> a
gcd' a b
    | (b < a) = gcd'' a b
    | otherwise = gcd'' b a
    where
        gcd'' x 0 = x
        gcd'' x y = gcd'' y (rem x y)

main = do
  input <- getLine
  print . uncurry gcd' . listToTuple . convertToInt . words $ input
 where
  listToTuple (x:xs:_) = (x,xs)
  convertToInt = map (read :: String -> Int)
