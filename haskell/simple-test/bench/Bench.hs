module Main where

import CITest.Core

import Criterion.Main

main :: IO ()
main = defaultMain [
  bgroup "truth" [ bench "core.truth" $ whnf id truth
                 , bench "core.falseness" $ whnf id falseness
                 ]
  ]
