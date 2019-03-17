module P3 where
exampleList :: [Int]
exampleList =
    [5, 7, 3, 1, 2]

elementAt :: [a] -> Int -> a
elementAt xs a =
    case xs of
      [] -> error "empty"
      x:rest ->
        if a == 1
          then x
          else
            elementAt rest (a - 1)

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
  shouldBe (elementAt [1,2,3] 2) 2
  print("Accepted")
