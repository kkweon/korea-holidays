module Data.Holiday.KoreaSpec where

import Test.Hspec (Spec, describe, it, shouldBe)
import qualified Data.Holiday.Korea as Korea

spec :: Spec
spec = do
  describe "Data.Holiday.Korea" $ do
    it "returns a SinJeong when xxxx/1/1" $ do
      Korea.getHoliday 2000 1 1 `shouldBe` Just Korea.Holiday
        { Korea.date = Korea.MD (1, 1)
        , Korea.name = "SinJeong"
        }

    it "returns the Independence Movement Day 3/1" $ do
      Korea.getHoliday 2019 3 1 `shouldBe` Just Korea.Holiday
        { Korea.date = Korea.MD (3, 1)
        , Korea.name = "SamIlJeol"
        }
