reduction :: Eq a => [a] -> [a]
reduction []    = []
reduction (x:xs)
    | elem x xs = reduction xs
    | otherwise = x:(reduction xs)

main :: IO ()
main = do x <- getLine
          putStr $ reverse (reduction (reverse x))
