import Data.Map
import Data.List
import Control.Monad

-- Counter
type Counter = Map Int Int

toCounter :: [Int] -> Counter
toCounter = Prelude.foldl add empty

add :: Counter -> Int -> Counter
add l x = insertWith (+) x 1 l


-- Filter
filterk :: [Int] -> Int -> [Int]
filterk l k = Data.List.nub $ Data.List.filter ((flip elem) (keys $ Data.Map.filter (>=k) (toCounter l))) l

showFilter :: [Int] -> String
showFilter [] = "-1"
showFilter xs = intercalate " " $ Data.List.map show xs

main = do
  cases <- readLn
  replicateM_ cases (
    do
      (n,k) <- fmap (\[a,b] -> (a,b)) $ fmap ((Data.List.map read) . words) getLine
      list <- fmap ((Data.List.map read) . words) getLine
      let filteredlist = filterk list k
      putStrLn $ showFilter filteredlist
    )

