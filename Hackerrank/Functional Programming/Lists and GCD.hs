-- Problem statement: https://www.hackerrank.com/challenges/lists-and-gcd

import Control.Monad
import Data.List (intercalate)

gcdlist :: [[(Int,Int)]] -> [(Int,Int)]
gcdlist xs = foldr gcdtwo (head xs) xs

gcdtwo :: [(Int,Int)] -> [(Int,Int)] -> [(Int,Int)]
gcdtwo [] _  = []
gcdtwo _  [] = []
gcdtwo ((x,n):xs) ((y,m):ys)
  | (x == y) = (x, min n m):(gcdtwo xs ys)
  | (x <  y) = gcdtwo xs ((y,m):ys)
  | (x >  y) = gcdtwo ((x,n):xs) ys

pairs :: [a] -> [(a,a)]
pairs []       = []
pairs (x:y:xs) = (x,y):(pairs xs)

showPair :: (Show a) => (a,a) -> String
showPair (x,y) = (show x) ++ " " ++ (show y) 

main :: IO ()
main = do
  cases <- readLn :: IO Int
  lists <- replicateM cases (fmap (pairs . (map read) . words) getLine)
  putStrLn $ intercalate " " $ map showPair $ gcdlist lists

