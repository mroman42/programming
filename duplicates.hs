import Data.Char
import Data.Bits

type Bit32 = Int

indexChar :: Char -> Int
indexChar c = (ord c) - (ord 'a')

isChar :: Bit32 -> Char -> Bool
isChar a c = testBit a (indexChar c)

setChar :: Bit32 -> Char -> Bit32
setChar a c = setBit a (indexChar c)


duplicates :: String -> String
duplicates xs = duplicates' 0 xs

duplicates' :: Bit32 -> String -> String
duplicates' _ []     = []
duplicates' b (x:xs)
  | (isChar b x)  = duplicates' b xs
  | otherwise     = x : (duplicates' (setChar b x) xs)

main = do
  string <- getLine
  putStrLn (duplicates string)
