{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveLift #-}

{-|
Module      : Data.Holiday.Model
Description : Holiday Model
Copyright   : (c) Mo Kweon
License     : MIT
Maintainer  : kkweon@gmail.com
Stability   : experimental
Portability : POSIX

It contains data models for Holiday
-}
module Data.Holiday.Model
  ( Date(..)
  , Holiday(..)
  ) where

import Control.Monad.Extra (liftMaybe)
import Data.Aeson.Types (FromJSON, (.:), parseJSON, withObject)
import Data.List.Split (splitOn)
import Data.Maybe (fromMaybe)
import GHC.Generics (Generic)
import Language.Haskell.TH.Syntax (Lift)
import Text.Read (readMaybe)

data Date
  = YMD (Integer, Int, Int) -- ^ (Year, Month, Day) Some Holiday has a different date every year
  | MD (Int, Int) -- ^ (Month, Day) Some holidays repeat every year on the same date
  deriving (Show, Eq, Lift)

-- | 'Holiday' represents the date of holiday and the name of holiday.
data Holiday =
  Holiday
    { date :: Date -- ^ Date of the holiday
    , name :: String -- ^ Name of the holiday
    }
  deriving (Show, Eq, Generic, Lift)

instance FromJSON Holiday where
  parseJSON =
    withObject "Holiday" $ \v -> Holiday <$> parseDate v <*> v .: "name"
    where
      parseDate o = do
        s <- o .: "date"
        liftMaybe $ parseKoreanDate s

parseKoreanDate :: String -> Maybe Date
parseKoreanDate xs =
  case splitOn "-" xs of
    [y, m, d]
      | verifyYmd y m d -> Just $ YMD (read y, read m, read d)
    [m, d]
      | verifyMd m d -> Just $ MD (read m, read d)
    _ -> Nothing

verifyYmd :: String -> String -> String -> Bool
verifyYmd y m d =
  fromMaybe False $ do
    year <- readMaybe y :: Maybe Integer
    month <- readMaybe m :: Maybe Int
    day <- readMaybe d :: Maybe Int
    return $ isValidYear year && isValidMonth month && isValidDay day

verifyMd :: String -> String -> Bool
verifyMd m d =
  fromMaybe False $ do
    month <- readMaybe m :: Maybe Int
    day <- readMaybe d :: Maybe Int
    return $ isValidMonth month && isValidDay day

isValidYear :: Integer -> Bool
isValidYear y
  | 1900 <= y && y <= 3000 = True
  | otherwise = False

isValidMonth :: Int -> Bool
isValidMonth m
  | 1 <= m && m <= 12 = True
  | otherwise = False

isValidDay :: Int -> Bool
isValidDay d
  | 1 <= d && d <= 31 = True
  | otherwise = False
