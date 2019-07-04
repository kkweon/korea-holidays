{-# LANGUAGE OverloadedStrings #-}

{-|
Module      : Data.Holiday.Korea
Description : The module contains Korea Holidays
Copyright   : (c) Kyung Mo Kweon
License     : BSD
Maintainer  : kkweon@gmail.com
Stability   : experimental
Portability : POSIX

The module contains Korea Holidays
-}
module Data.Holiday.Korea where

import Data.Aeson.Types (FromJSON, (.:), parseJSON, withObject)
import Data.Holiday.Model (Date(..), Holiday(..))
import Data.Maybe (fromJust)

-- | 'sinJeong' is the new year holiday.
sinJeong :: Holiday
sinJeong = Holiday {date = MD (1, 1), name = "SinJeong", lunar = Nothing}

samIlJeol :: Holiday
samIlJeol = Holiday {date = MD (3, 1), name = "SamIlJeol", lunar = Nothing}

-- | 'getHoliday' returns Nothing if there is no Korean holiday.
getHoliday ::
     Integer -- ^ Year
  -> Int -- ^ Month
  -> Int -- ^ Day
  -> Maybe Holiday
getHoliday year month day
  | month == 1 && day == 1 = Just sinJeong
  | month == 3 && day == 1 = Just samIlJeol
  | otherwise = Nothing
