substring :: String -> String -> Bool
substring as bs = substringInit as bs bs

substringInit :: String -> String -> String -> Bool
substringInit a:as b:bs s:st
    | s == a && a == b = next && new
    | s == a && a != b = new
    | s != a && a == b = next
    | otherwise        = other
    where
      new   = substring as   st s:st
      next  = substring as   bs s:st
      other = substring as s:st s:st

handleCase :: IO ()
handleCase = do tex <- readLn :: IO String 
                pat <- readLn :: IO String
                case substring tex pat of
                  True -> putStrLn "YES"
                  False -> putStrLn "NO"
