module Data.Holiday.KoreaSpec where

import qualified Data.Holiday.Korea as Korea
import qualified Data.Holiday.Model as KM
import Data.Holiday.Model (date, lunar, name)
import Test.Hspec (Spec, describe, it, shouldBe)

spec :: Spec
spec = do
  describe "Data.Holiday.Korea" $ do
    it "returns a SinJeong when xxxx/1/1" $ do
      Korea.getHoliday 2000 1 1 `shouldBe`
        Just
          KM.Holiday {date = KM.MD (1, 1), name = "SinJeong", lunar = Nothing}
    it "returns the Independence Movement Day 3/1" $ do
      Korea.getHoliday 2019 3 1 `shouldBe`
        Just
          KM.Holiday {date = KM.MD (3, 1), name = "SamIlJeol", lunar = Nothing}
