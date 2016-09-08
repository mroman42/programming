import Control.Monad

jumps :: (Integral a) => [a] -> a
jumps = foldr lcm 1

main :: IO ()
main = do
  n <- readLn :: IO Int
  bunnies <- (fmap ((map read) . words) getLine) :: IO [Int]
  print $ jumps bunnies
