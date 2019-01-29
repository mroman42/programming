f :: [Int] -> [Int]
f (x:xs) = g xs
f [] = []

g :: [Int] -> [Int]
g (x:xs) = x : (f xs)
g [] = []

main = do
   inputdata <- getContents
   mapM_ (putStrLn. show). f. map read. lines $ inputdata
