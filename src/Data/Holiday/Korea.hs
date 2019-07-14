{-|
Module      : Data.Holiday.Korea
Description : The module contains Korea Holidays
Copyright   : (c) Kyung Mo Kweon
License     : MIT
Maintainer  : kkweon@gmail.com
Stability   : experimental
Portability : POSIX

The module contains Korea Holidays
-}
module Data.Holiday.Korea where

import Data.Holiday.Model (Date(..), Holiday(..))
import Data.Maybe (listToMaybe)
import Util.Config (holidays)

import Control.Monad (msum)

import qualified Data.Time as Time

-- | 'getHoliday' returns Nothing if there is no Korean holiday.
getHoliday ::
     Integer -- ^ Year
  -> Int -- ^ Month
  -> Int -- ^ Day
  -> Maybe Holiday
getHoliday year month day = listToMaybe $ filter match holidays
  where
    match :: Holiday -> Bool
    match Holiday {date = YMD (y, m, d)}
      | y == year && m == month && d == day = True
    match Holiday {date = MD (m, d)}
      | m == month && d == day = True
    match _ = False

-- | `getNearestHoliday` returns a nearest holiday within a year range
getNearestHoliday :: Time.Day -> Maybe Holiday
getNearestHoliday day = msum . map go $ [0 .. 365]
  where
    go :: Integer -> Maybe Holiday
    go delta =
      let newDay = Time.addDays delta day
          (y, m, d) = Time.toGregorian newDay
       in getHoliday y m d
