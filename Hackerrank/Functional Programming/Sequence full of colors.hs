import Control.Monad

fullcolorrec :: Int -> Int -> String -> Bool
fullcolorrec rg yb []       = (rg == 0) && (yb == 0)
fullcolorrec rg yb ('R':xs) = (rg <  1) && (fullcolorrec (rg+1) yb xs)
fullcolorrec rg yb ('G':xs) = (rg > -1) && (fullcolorrec (rg-1) yb xs)
fullcolorrec rg yb ('Y':xs) = (yb <  1) && (fullcolorrec rg (yb+1) xs)
fullcolorrec rg yb ('B':xs) = (yb > -1) && (fullcolorrec rg (yb-1) xs)


fullcolor :: String -> Bool
fullcolor = fullcolorrec 0 0 

main :: IO ()
main = do
  cases <- readLn
  replicateM_ cases (
    do
      chain <- getLine
      putStrLn . show $ fullcolor chain
    )
