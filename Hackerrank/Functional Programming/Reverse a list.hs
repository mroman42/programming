  rev [] = []
  rev (x:xs) = (rev xs) ++ [x]

  main = do
    inputdata <- getContents
    mapM_ putStrLn $ map show $ rev $ map (read :: String -> Int) $ lines inputdata
