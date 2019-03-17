{-# language ScopedTypeVariables #-}
module P5 where

exampleList :: [Int]
exampleList =
    [5, 7, 3, 1, 2]

myReverse :: [a] -> [a]
myReverse xs = 
   foldl f [] xs
   where 
     f :: [a] -> a -> [a]
     f curr x = x:curr


-- testing utility
shouldBe :: (Show a, Eq a) => a -> a -> IO ()
shouldBe x y =
  if x == y 
    then return ()
    else error (show x ++ " should be equal to " ++ show y)

main :: IO ()
main = do
  shouldBe 2 2
  shouldBe 1 1
  shouldBe (myReverse exampleList) [2,1,3,7,5]
  print("Accepted")
