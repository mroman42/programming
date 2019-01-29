isOdd x = (mod x 2 == 1)
f = sum . (filter (isOdd))

main = do
   inputdata <- getContents
   putStrLn $ show $ f $ map (read :: String -> Int) $ lines inputdata
