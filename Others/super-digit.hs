import Data.Char
(+.), (*.) :: Int -> Int -> Int
(+.) = (\a b -> mod (a+b) 18)
(*.) = (\a b -> mod (a*b) 18)
main :: IO ()
main = do
  c <- fmap words getContents
  let a = (foldr (*.) 1) $ map ((foldr (+.) 0) . (map (digitToInt))) c
  print $ if a==9 then a else mod a 9
