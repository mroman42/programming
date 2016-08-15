import Prelude hiding (replicate, zipWith)
import Data.List hiding (replicate, zipWith)
import Data.Sequence

counter :: [Int] -> Seq Int
counter = foldr (adjust (+1)) (replicate 110 0) 

difference :: [Int] -> [Int] -> [Int]
difference as bs = map (+minb) $ findIndicesL (>0) $ zipWith (-) (counter bms) (counter ams)
  where
    minb = minimum bs
    ams  = map ((flip (-)) minb) as
    bms  = map ((flip (-)) minb) bs 

main :: IO ()
main = do
  na <- readLn :: IO Int
  anumbers <- fmap (map read . words) getLine
  nb <- readLn :: IO Int
  bnumbers <- fmap (map read . words) getLine
  putStrLn . (intercalate " ") . (map show) $ difference anumbers bnumbers
