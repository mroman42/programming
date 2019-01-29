import Data.List
import Control.Monad
import Control.Arrow

factors :: Int -> [Int]
factors n = fact 2 n
  where
    fact d n
      | d > n          = []
      | (mod n d == 0) = d : fact d (quot n d)
      | otherwise      = fact (succ d) n

primefactors :: Int -> [(Int,Int)]
primefactors n = (map (head &&& length)) . group $ (factors n)

divisors :: Int -> Int
divisors n = product $ map ((+1) . snd) (primefactors n)

commondivisors :: Int -> Int -> Int
commondivisors x y = divisors $ gcd x y

main = do
  n <- readLn :: IO Int
  replicateM_ n (
    do
      (a,b) <- fmap ((\[x,y] -> (x,y)) . (map read) . words) getLine
      putStrLn . show $ commondivisors a b
    )
