module P4 where
{-# language ScopedTypeVariables #-}

exampleList :: [Int]
exampleList =
    [5, 7, 3, 1, 2]

_myLength :: [a] -> Int -> Int
_myLength xs counter =
    case xs of 
      [] -> counter
      x:rest -> _myLength rest (counter + 1)

myLength :: [a] -> Int
myLength xs =
    _myLength xs 0

myFoldL :: [a] -> Int
myFoldL xs =
    foldl f 0 xs
    where
      f :: Int -> a -> Int
      f counter x = 
        counter + 1

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
  shouldBe (myLength [1,2,3]) 3
  shouldBe (myLength exampleList) 5
  shouldBe (myFoldL exampleList) 5
  print("Accepted")
