import Control.Monad
import Data.Char

allDifferent :: (Eq a) => [a] -> Bool
allDifferent [] = True
allDifferent (x:xs) = (notElem x xs) && (allDifferent xs)

isFunction :: (Eq a) => [(a,a)] -> Bool
isFunction l = allDifferent (map fst l)


main :: IO ()
main = do
  contents <- getContents
  let cases = parse contents
  let sols = map ((\x -> if x then "YES" else "NO") . isFunction) cases
  mapM_ putStrLn sols
  
parse :: String -> [[(Int,Int)]]
parse cnt = parseHead $ drop 1 (lines cnt)

parseHead :: [String] -> [[(Int,Int)]]
parseHead [] = []
parseHead (x:xs) = parseBody (take n xs) : parseHead (drop n xs)
  where n = read x

parseBody :: [String] -> [(Int,Int)]
parseBody = map ((\[a,b] -> (a,b)) . (map read) . words)
