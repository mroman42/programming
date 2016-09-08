firstdiff :: String -> String -> Int
firstdiff [] ys = 0
firstdiff xs [] = 0
firstdiff (x:xs) (y:ys)
  | x == y    = 1 + (firstdiff xs ys)
  | otherwise = 0  

diffstring :: String -> String -> (String,String,String)
diffstring a b = (take n a, drop n a, drop n b)
  where n = firstdiff a b


main :: IO ()
main = do
  stringa <- getLine
  stringb <- getLine
  let (p,a,b) = diffstring stringa stringb
  putStrLn (show (length p) ++ " " ++ p)
  putStrLn (show (length a) ++ " " ++ a)
  putStrLn (show (length b) ++ " " ++ b)
