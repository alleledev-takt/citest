{-# LANGUAGE OverloadedStrings #-}
module Main where

import Hedgehog

import CITest.Core

void :: Monad m => m a -> m ()
void f = f >> return ()

main :: IO ()
main =
  void (checkParallel $ Group "CITest" [("prop_truth", propTruth)])
  where propTruth = withTests 5 $ property $ True === truth
