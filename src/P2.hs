module P2 where
exampleList :: [Int]
exampleList =
    [5, 7, 3, 1, 2]

myLast :: [a] -> a
myLast xs =
    case xs of
        [x] -> error "empty"
        [x, y] -> x
        x:rest -> myLast(rest)

shouldBe :: (Show a, Eq a) => a -> a -> IO ()
shouldBe x y =
  if x == y 
    then return ()
    else error (show x ++ " should be equal to " ++ show y)

main :: IO ()
main = do
  shouldBe 2 2
  shouldBe 1 1
  shouldBe (myLast exampleList) 1
  shouldBe (myLast [1, 2]) 1
  shouldBe (myLast ['a'..'z']) 'y'
