import Control.Monad

(*.), (+.) :: Int -> Int -> Int
(*.) = (\a b -> (a*b) `mod` 100000007)
(+.) = (\a b -> (a+b) `mod` 100000007)

bin :: [Int]
bin = 1 : do
  n <- [1..]
  return $ foldr (+.) 0 $ do
    c <- [0..(n-1)]
    return $ (bin !! c) *. (bin !! (n-1-c))

main :: IO ()
main = do
  cases <- readLn :: IO Int
  replicateM_ cases (
    do
      n <- readLn
      print $ bin !! n
    )
