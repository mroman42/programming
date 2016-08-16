-- Problem statement: https://www.hackerrank.com/challenges/huge-gcd-fp

(*.) a b = mod (a*b) 1000000007

hugegcd :: [Int] -> [Int] -> Int
hugegcd as bs = fst $ foldr gcdr (1,bs) as
  where
    gcdr :: Int -> (Int,[Int]) -> (Int,[Int])
    gcdr a (g,br) = (g *. ng, nbr)
      where
        (ng,nbr) = gcda a br

gcda :: Int -> [Int] -> (Int,[Int])
gcda a []     = (1,[])
gcda a (b:bs) = (d *. g, (quot b d):ls)
  where
    d      = gcd a b
    (g,ls) = gcda (quot a d) bs

main = do
  a <- readLn :: IO Int
  lista <- fmap ((map read) . words) getLine
  b <- readLn :: IO Int
  listb <- fmap ((map read) . words) getLine
  putStrLn . show $ hugegcd lista listb

