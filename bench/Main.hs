module Main where

import qualified Lib
import P5
import Chronos.Bench

testList :: [Int]
testList = 
	[5,3,6,4,2,6,7,4,6,2,5,4,9,7,6,5,4,(9 :: Int)]

main :: IO ()
main =
  defaultMain
    [ bench
        "haskell reverse"
        reverse
        testList
    , bench
        "my reverse"
        myReverse
        testList
    , bench
        "my reverse"
        myReverse
        testList
    ]
