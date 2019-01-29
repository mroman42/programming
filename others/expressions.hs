import Control.Monad
import Data.Sequence (Seq,singleton)
import Data.Foldable (toList)
import Data.Monoid

(+.) a b = mod (a+b) 101
(*.) a b = mod (a*b) 101
(-.) a b = mod (a-b) 101

operation :: (Int,Seq String) -> Int -> [(Int,Seq String)]
operation (n,s) x = [ (n *. x,mappend s $ singleton ("*"++show x)),
                      (n -. x,mappend s $ singleton ("-"++show x)),
                      (n +. x,mappend s $ singleton ("+"++show x))
                    ]

solution :: [Int] -> String
solution (x:xs) = concat . toList $
  snd . head $ filter ((==0) . fst) $ foldM operation (x,singleton (show x)) xs

main :: IO ()
main = do
  n <- readLn :: (IO Int)
  nms <- fmap ((fmap read) . words) getLine :: (IO [Int])
  putStrLn $ solution nms
