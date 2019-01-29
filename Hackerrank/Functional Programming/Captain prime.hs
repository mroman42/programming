import Data.List

primes :: [Int]
primes = 2 : filter isPrime [3,5..]

isPrime :: Int -> Bool
isPrime x = (x>1) && (all (\n -> x `mod` n /= 0) $
            takeWhile (\n -> n * n <= x) primes)

leftReminders :: Int -> [Int]
leftReminders n = map read $ init $ tails (show n)

rightReminders :: Int -> [Int]
rightReminders 0 = []
rightReminders n = n : rightReminders (quot n 10)

haszero :: Int -> Bool
haszero n = elem '0' (show n)

fate :: Int -> String
fate n
  | haszero n     = "DEAD"
  | left && right = "CENTRAL"
  | left          = "LEFT"
  | right         = "RIGHT"
  | otherwise     = "DEAD"
  where
    left  = and (map isPrime $ leftReminders n)
    right = and (map isPrime $ rightReminders n)

main :: IO ()
main = do
  cases <- readLn
  numbers <- mapM (\i -> readLn) [1..cases]
  let strings = map fate numbers
  mapM_ putStrLn strings
