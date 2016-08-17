import Control.Monad
import Control.Applicative

data BinTree a = Empty
               | Node a (BinTree a) (BinTree a)

insert :: (Ord a) => BinTree a -> a -> BinTree a
insert Empty x = Node x Empty Empty
insert (Node n lt rt) x
       | x > n = Node n lt (insert rt x)
       | x < n = Node n (insert lt x) rt

preorder :: BinTree a -> [a]
preorder Empty = []
preorder (Node n lt rt) = [n] ++ preorder lt ++ preorder rt

main :: IO ()
main = do cases <- readLn :: IO Int
          replicateM_ cases handleCase

handleCase :: IO ()
handleCase = do n <- readLn :: IO Int
                s <- getLine
                -- Reads tree
                let list = map read $ (words s) :: [Int]
                let tree = foldl insert Empty list
                let nlist = preorder tree
                -- Compares
                case (list == nlist) of
                  True -> putStrLn "YES"
                  False -> putStrLn "NO"
