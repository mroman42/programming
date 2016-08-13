import Control.Monad
import Control.Monad.Writer

-- Logging using Writer and the ([],++) monoid is inefficient -> O(n)
-- It is more efficient to use a Sequence -> O(1)
import Data.Sequence (Seq, singleton)
import Data.Foldable (sequence_)

data Tree a = Node a [Tree a]
data Trail a = Trail (a, [Tree a], [Tree a])
type ZipTree a = (Tree a, [Trail a])

change :: a -> ZipTree a -> ZipTree a
change x (Node y xs, t) = (Node x xs, t)

get :: ZipTree a -> a
get (Node x xs, t) = x

visitLeft   (t, Trail (p, l:ls, rs) : ts) = (l, Trail (p, ls, t:rs) : ts)
visitRight  (t, Trail (p, ls, r:rs) : ts) = (r, Trail (p, t:ls, rs) : ts)
visitParent (t, Trail (p, ls, rs) : ts)   = (Node p ((reverse ls) ++ [t] ++ rs), ts)

visitChild :: Int -> ZipTree a -> ZipTree a
visitChild n (Node y (x:xs), p) = rightntimes (x, (Trail (y, [], xs)):p)
  where
    rightntimes = (foldr (.) id (replicate (n-1) visitRight))

insertLeft  l (t, Trail (p, ls, rs) : ts) = (t, Trail (p, (Node l []):ls, rs) : ts)
insertRight r (t, Trail (p, ls, rs) : ts) = (t, Trail (p, ls, (Node r []):rs) : ts)
insertChild c (Node x xs, ts) = (Node x ((Node c []):xs), ts)

delete :: ZipTree a -> ZipTree a
delete (_, Trail (p, ls, rs) : ts) = (Node p ((reverse ls) ++ rs), ts)

printTree :: (Show a) => ZipTree a -> Writer (Seq String) (ZipTree a)
printTree zt@(Node x _,_) = writer (zt, singleton (show x))

readOperation :: (Read a, Show a) => [String] -> (ZipTree a -> Writer (Seq String) (ZipTree a))
readOperation s = case s of
  ["change", x]         -> fmap return $ change (read x)
  ["print"]             -> printTree
  ["visit","left"]      -> fmap return $ visitLeft
  ["visit","right"]     -> fmap return $ visitRight
  ["visit","parent"]    -> fmap return $ visitParent
  ["visit","child", n]  -> fmap return $ visitChild (read n)
  ["insert","left", x]  -> fmap return $ insertLeft (read x)
  ["insert","right", x] -> fmap return $ insertRight (read x)
  ["insert","child", x] -> fmap return $ insertChild (read x)
  ["delete"]            -> fmap return $ delete
  _                     -> error "Invalid expression"

startTree :: ZipTree Int
startTree = (Node 0 [], [])


main = do
  n <- readLn :: IO Int
  operations <- replicateM n (fmap (readOperation . words) getLine)
  let (a,w) = runWriter $ foldl (>>=) (return startTree) operations
  Data.Foldable.sequence_ $ fmap putStrLn w
