{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Monad

import Hedgehog

import CITest.Core

main :: IO ()
main =
  void (checkParallel $ Group "CITest" props)

  where props = [
          ("prop_truth", propTruth)
          , ("prop_falseness", propFalseness)]

        propTruth = withTests 5 $ property $ True === truth
        propFalseness = withTests 5 $ property $ False === falseness
