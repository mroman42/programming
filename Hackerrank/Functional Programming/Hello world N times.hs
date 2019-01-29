hello_worlds n = mapM_ putStrLn (replicate n "Hello World")

main = do
   n <- readLn :: IO Int
   hello_worlds n
