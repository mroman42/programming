import Control.Monad

modulo = 100000000 + 7
(+.) = \x -> \y -> mod (x+y) modulo
fibonacci = [0,1] ++ (zipWith (+.) fibonacci (tail fibonacci))
fib = (fibonacci !!)

main = do
  cases <- readLn
  replicateM_ cases (do
                        n <- readLn
                        print $ fib n
                    )
