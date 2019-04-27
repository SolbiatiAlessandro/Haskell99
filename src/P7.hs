{-# language ScopedTypeVariables #-}
module P7 where

data NestedList a = Int a | List [NestedList a]

exampleList :: NestedList Int
exampleList =
    List [Int 1, List [Int 2, List [Int 3, Int 4], Int 5]]

flatten :: NestedList Int  -> [Int]
flatten (Int x)  = [x]
flatten (List []) = []
flatten (List(x:xs)) = flatten x ++ flatten (List xs)

-- testing utility
shouldBe :: (Show a, Eq a) => a -> a -> IO ()
shouldBe x y =
  if x == y 
    then return ()
    else error (show x ++ " should be equal to " ++ show y)

main :: IO ()
main = do
  --shouldbe 2 2
  --shouldbe 1 1
  shouldBe (flatten exampleList) [1,2,3,4,5]
  print("Accepted")
