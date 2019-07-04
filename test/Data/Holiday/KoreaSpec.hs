module Data.Holiday.KoreaSpec where

import qualified Data.Holiday.Korea            as Korea
import qualified Data.Holiday.Model            as KM

import           Data.Holiday.Model             ( date
                                                , name
                                                )
import           Test.Hspec                     ( Spec
                                                , describe
                                                , it
                                                , shouldBe
                                                )

spec :: Spec
spec = describe "Data.Holiday.Korea" $ do
  it "returns New Year's Day when 2000/1/1"
    $          Korea.getHoliday 2000 1 1
    `shouldBe` Just KM.Holiday {date = KM.MD (1, 1), name = "New Year's Day"}
  it "returns March 1 Movement Day when 2019/3/1"
    $          Korea.getHoliday 2019 3 1
    `shouldBe` Just KM.Holiday
                 { date = KM.MD (3, 1)
                 , name = "March 1 Movement Day"
                 }
  it "returns Chuseok when 2029/09/22"
    $          Korea.getHoliday 2029 9 22
    `shouldBe` Just KM.Holiday {date = KM.YMD (2029, 9, 22), name = "Chuseok"}
  it "returns Nothing when it's not a Holiday 2019/07/04"
    $          Korea.getHoliday 2019 7 4
    `shouldBe` Nothing
