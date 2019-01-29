len :: [a] -> Int
len lst = case lst of
	      []     -> 0
	      (x:xs) -> succ (len xs)

main = do
  inputdata <- getContents
  putStrLn $ show $ len $ map (read :: String -> Int) $ lines inputdata
