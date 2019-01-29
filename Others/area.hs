import Text.Printf (printf)

data Poly = Poly { coef::[Int]
                 , grad::[Int]
                 }

eval :: Poly -> Double -> Double
eval p x = sum $ map (\(c,g) -> (fromIntegral c)*(x**(fromIntegral g))) (zip (coef p) (grad p))

integrate :: Int -> Int -> (Double -> Double) -> Double
integrate l r f = sum $ map ((/1000) . f) partition
    where
        partition = map ((/1000) . (fromIntegral)) [1..(r-l)*1000]

area :: Int -> Int -> Poly -> Double
area l r p = integrate l r (eval p)

vol :: Int -> Int -> Poly -> Double
vol l r p = integrate l r (\x -> eval p x * eval p x * 3.14159275358979)

-- This function should return a list [area, volume].
solve :: Int -> Int -> [Int] -> [Int] -> [Double]
solve l r a b = [area l r p, vol l r p]
    where
      p = Poly a b

--Input/Output.
main :: IO ()
main = getContents >>= mapM_ (printf "%.1f\n"). (\[a, b, [l, r]] -> solve l r a b). map (map read. words). lines
