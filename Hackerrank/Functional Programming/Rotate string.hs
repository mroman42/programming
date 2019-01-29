import Data.List

rotations :: String -> [String]
rotations s = tail $ zipWith (++) (tails s) (inits s)

main = do
  strings <- input
  let output = map ((intercalate " ") . rotations) strings
  mapM_ putStrLn output
  
input :: IO [String]
input = do
  n <- readLn :: IO Int
  sequence $ map (\i -> getLine) [1..n]
