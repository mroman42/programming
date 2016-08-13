factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

binomial :: Int -> Int -> Int
binomial n r = quot (factorial n) (factorial r * factorial (n-r))

pascal :: Int -> [[Int]]
pascal n = map pascalfile [0..(n-1)]
  where
    pascalfile m = map (binomial m) [0..m]

main :: IO ()
main = do
  x <- getLine
  let n = read x :: Int
  let list = pascal n
  mapM_ (putStrLn . unwords . map show) list
  return ()
