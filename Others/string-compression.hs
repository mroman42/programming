compress :: String -> String
compress = compressacc (0,'0')
  where
    compressacc :: (Int,Char) -> String -> String
    compressacc (n,x) []
      | n == 0    = []
      | n == 1    = [x]
      | otherwise = x : show n
    compressacc (n,x) (y:ys)
      | x == y    = compressacc (succ n,x) ys
      | otherwise = compressacc (n,x) [] ++ compressacc (1,y) ys
  
main :: IO ()
main = do
  string <- getLine
  putStrLn $ compress string
