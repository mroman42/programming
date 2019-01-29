-- https://www.hackerrank.com/challenges/fighting-armies
-- Uses fast IO and Binomial Trees.

import Data.Sequence as Seq
import Data.Foldable
import Data.Vector.Mutable as Vect (replicate,unsafeRead,unsafeWrite,modify,unsafeModify,MVector)
import Control.Monad
import Control.Monad.Primitive
import qualified Data.ByteString.Lazy.Char8 as DB

data BinomialTree a = Nil | Node a (Seq (BinomialTree a))
  deriving (Show)
type BinomialHeap a = [BinomialTree a]

singleton :: a -> BinomialTree a
singleton x = Node x empty

singleHeap :: a -> BinomialHeap a
singleHeap x = [Main.singleton x]

sumTree :: (Ord a) => BinomialTree a -> BinomialTree a -> (BinomialTree a, BinomialTree a)
sumTree x   Nil = (x,Nil)
sumTree Nil y   = (y,Nil)
sumTree (Node x xs) (Node y ys)
  | x >= y    = (Nil,Node x (xs |> Node y ys))
  | otherwise = (Nil,Node y (ys |> Node x xs))

sumTrees :: (Ord a) => BinomialTree a
         -> BinomialTree a
         -> BinomialTree a
         -> (BinomialTree a, BinomialTree a)
sumTrees t x Nil = sumTree t x
sumTrees t Nil y = sumTree t y
sumTrees Nil x y = sumTree x y
sumTrees t x y   = (txy,rr)
  where (xy,r)   = sumTree x y
        (txy,rt) = sumTree xy t
        (rr,_)   = sumTree r rt

sumHeaps :: (Ord a) => BinomialTree a -> BinomialHeap a -> BinomialHeap a -> BinomialHeap a
sumHeaps Nil [] []     = []
sumHeaps Nil [x] (Nil:ys) = x:ys
sumHeaps Nil (x:xs) [] = x:xs
sumHeaps Nil [] (y:ys) = y:ys
sumHeaps t []     []     = [t]
sumHeaps t (x:xs) []     = tx:sumHeaps r xs []
  where (tx, r) = sumTree t x
sumHeaps t []     (y:ys) = ty:sumHeaps r [] ys
  where (ty, r) = sumTree t y
sumHeaps t (x:xs) (y:ys) = txy:sumHeaps r xs ys
  where (txy, r) = sumTrees t x y




merge :: (Ord a) => BinomialHeap a -> BinomialHeap a -> BinomialHeap a
merge = sumHeaps Nil

insert :: (Ord a) => a -> BinomialHeap a -> BinomialHeap a
insert x = merge (singleHeap x)

findMin :: BinomialHeap Int -> Int
findMin h = Prelude.foldr max 0 $ fs h
  where
    fs []            = []
    fs (Nil:xs)      = fs xs
    fs (Node x _:xs) = x:fs xs

deleteMinTree :: (Ord a) => a -> BinomialHeap a -> (BinomialHeap a, BinomialHeap a)
deleteMinTree _ []               = ([],[])
deleteMinTree m (Nil:xs)         = (Nil:fst (deleteMinTree m xs),snd $ deleteMinTree m xs)
deleteMinTree m (Node x ts:xs)
  | x == m    = (Nil:fst (deleteMinTree m xs), toList ts)
  | otherwise = (Node x ts:fst (deleteMinTree m xs), snd $ deleteMinTree m xs)

deleteMin :: BinomialHeap Int -> BinomialHeap Int
deleteMin h = merge hm mint
  where (hm, mint) = deleteMinTree (findMin h) h


main :: IO ()
main = do
  [narmies, _] <- fmap (map read . words) getLine :: IO [Int]
  army <- Vect.replicate (succ narmies) []
  contents <- fmap DB.lines DB.getContents
  Control.Monad.forM_ contents (\line ->
    do
      let order = map readbs . DB.words $ line
      case order of
        [1,i] -> do
          arm <- Vect.unsafeRead army i
          print $ findMin arm
        [2,i] ->
          Vect.unsafeModify army deleteMin i
        [3,i,c] ->
          Vect.unsafeModify army (insert c) i
        [4,i,j] -> do
          armj <- Vect.unsafeRead army j
          Vect.unsafeModify army (merge armj) i
    )
  return ()

readbs :: DB.ByteString -> Int
readbs n = case DB.readInt n of
  Nothing -> undefined
  Just (m,_) -> m
