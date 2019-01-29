f :: Int -> [Int] -> [Int]
f _ [] = [] 
f n (x:xs)
    | (x < n) = (x:(f n xs))
    | otherwise = f n xs

main = do 
    n <- readLn :: IO Int 
    inputdata <- getContents 
    let 
        numbers = map read (lines inputdata) :: [Int] 
    putStrLn . unlines $ (map show . f n) numbers
