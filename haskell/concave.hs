import Control.Monad
import Data.List

triples :: [(Int,Int)] -> [((Int,Int),(Int,Int),(Int,Int))]
triples z = zip3 z (tail $ cycle z) (tail $ tail $ cycle z)

concaveangle :: ((Int,Int),(Int,Int),(Int,Int)) -> Bool
concaveangle xs = (<=0) $ crossproduct xs

crossproduct :: ((Int,Int),(Int,Int),(Int,Int)) -> Int
crossproduct ((a,b),(c,d),(e,f)) = dx1*dy2 - dy1*dx2
  where dx1 = c-a
        dy1 = d-b
        dx2 = e-c
        dy2 = f-d

concave :: [(Int,Int)] -> Bool
concave xs = and (map concaveangle (triples xs))
             || and (map (not . concaveangle) (triples xs))

main :: IO ()
main = do
  n <- readLn
  points <- replicateM n (
    fmap ((\[a,b]->(a,b)) . (map (read :: String -> Int)) . words) $ getLine
    )
  putStrLn . (\x -> if x then "NO" else "YES") $ concave $ sortangle points


sortangle :: [(Int,Int)] -> [(Int,Int)]
sortangle l = sortBy compAngle i
  where i = map (\(x,y) -> (x-m,y)) l
        m = minimum $ map fst $ l

compAngle :: (Int,Int) -> (Int,Int) -> Ordering
compAngle (a,b) (c,d) = compare (atan ((fromIntegral a)/(fromIntegral b))) (atan ((fromIntegral c)/(fromIntegral d)))
