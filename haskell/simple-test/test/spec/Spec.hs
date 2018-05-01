{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Monad

import Hedgehog

import CITest.Core

main :: IO ()
main =
  void (checkParallel $ Group "CITest" [("prop_truth", propTruth)])
  where propTruth = withTests 5 $ property $ True === truth
