module Util.YamlSpec where

import           Test.Hspec         (Spec, describe, it, shouldBe)

import qualified Data.Holiday.Korea as Korea
import qualified Util.Yaml          as Yaml

spec :: Spec
spec = describe "Util.Yaml" $ do

  it "should parse Korea.MD correctly" $ do
    Yaml.parseKoreanDate "01-01" `shouldBe` Just (Korea.MD (1, 1))
    Yaml.parseKoreanDate "1-31" `shouldBe` Just (Korea.MD (1, 31))

  it "should parse Korea.YMD correctly" $ do
    Yaml.parseKoreanDate "2019-01-01" `shouldBe` Just (Korea.YMD (2019, 1, 1))
    Yaml.parseKoreanDate "19-1-31" `shouldBe` Just (Korea.YMD (2019, 1, 31))
    Yaml.parseKoreanDate "01-1-31" `shouldBe` Just (Korea.YMD (2001, 1, 31))

  it "should return Nothing when wrong date is given" $ do
    Yaml.parseKoreanDate "0-31" `shouldBe` Nothing
