import Control.Monad
import Control.Applicative ((<$>))
import Data.Sequence as Seq

attack :: (Int,Int) -> (Int,Int) -> Bool
attack (xa,ya) (xb,yb)
  | ((abs (xa-xb) <= 2) && (abs (ya-yb) <= 2)) = True
  | (abs (xa-xb)) == (abs (ya-yb)) = True
  | otherwise = False

putQueen :: Int -> [(Int,Int)] -> Seq Bool -> Int -> Int
putQueen n prevqueens columns row = if n == row then 1 else sum $ do
  c <- [0..(n-1)]
  guard $ not $ index columns c
  guard $ not $ any (attack (row,c)) prevqueens
  return $ putQueen n ((row,c):prevqueens) (update c True columns) (succ row)

queens :: Int -> Int
queens n = putQueen n [] (Seq.replicate n False) 0

main :: IO ()
main = queens <$> readLn >>= print
