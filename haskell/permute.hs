import Control.Monad

permute :: String -> String
permute []       = []
permute (a:b:xs) = b:a:(permute xs)

main :: IO ()
main = do
  n <- readLn
  replicateM_ n (do
                    s <- getLine
                    putStrLn $ permute s
                )
