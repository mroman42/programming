forms :: [Int] -> Int -> Int
forms _  0 = 1
forms [] _ = 0
forms (x:xs) g
  | g < x     = 0
  | otherwise = (forms xs g) + (forms xs (g-x))

sumpowers :: Int -> Int -> Int
sumpowers n e = forms (map (^e) [1..]) n

main :: IO ()
main = do
  n <- readLn :: IO Int
  e <- readLn :: IO Int
  putStrLn . show $ sumpowers n e
