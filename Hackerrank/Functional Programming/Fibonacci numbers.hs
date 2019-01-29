module Main where

fib :: Int -> Int
fib n
    | (n==1) = 0
    | (n==2) = 1
    | otherwise = (fib (n-1)) + (fib (n-2))

main = do
    input <- getLine
    print . fib . (read :: String -> Int) $ input
