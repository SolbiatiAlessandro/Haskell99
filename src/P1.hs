module P1 where
exampleList :: [Int]
exampleList =
    [5, 7, 3, 1, 2]

myLast :: [Int] -> Int
myLast xs =
	case xs of
		[] -> error "empty"
		[x] -> x
		x:rest -> myLast(rest)
