perimeter :: [(Int,Int)] -> Float
perimeter l = sum $ map distance (pairs l)

pairs :: [a] -> [(a,a)]
pairs l = zip l (tail l ++ [head l])

distance :: ((Int,Int),(Int,Int)) -> Float
distance ((x,y),(v,w)) = sqrt . fromIntegral $ (x-v)^2 + (y-w)^2

main :: IO ()
main = do
  contents <- getContents
  let points = parseContents contents
  let perim = perimeter points
  print perim

parseContents :: String -> [(Int,Int)]
parseContents str = map ((\[a,b] -> (a,b)) . (map read) . words) (take (read n) ns)
  where n:ns = lines str
