area :: [(Int,Int)] -> Float
area l = (fromIntegral (sum $ map (\((x,y),(v,w)) -> (x*w-y*v)) (pairs l))) * 0.5

pairs :: [a] -> [(a,a)]
pairs l = zip l (tail l ++ [head l])

main :: IO ()
main = do
  contents <- getContents
  let points = parseContents contents
  print $ (area points)

parseContents :: String -> [(Int,Int)]
parseContents str = map ((\[a,b] -> (a,b)) . (map read) . words) (take (read n) ns)
  where n:ns = lines str
