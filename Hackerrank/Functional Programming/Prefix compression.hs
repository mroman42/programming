compression :: String -> String -> (String,String,String)
compression [] y = ([],[],y)
compression x [] = ([],x,[])
compression (x:xs) (y:ys)
    | x == y    = (x:a,b,c) 
    | otherwise = ([],x:xs,y:ys)
  where (a,b,c) = compression xs ys

linelen :: String -> String
linelen x = show (length x) ++ " " ++ x

main = do
  x <- getLine
  y <- getLine
  let (a,b,c) = compression x y
  putStrLn $ linelen a
  putStrLn $ linelen b
  putStrLn $ linelen c
