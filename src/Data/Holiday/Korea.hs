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

import           Data.Aeson.Types               ( FromJSON
                                                , (.:)
                                                , parseJSON
                                                , withObject
                                                )
import           Data.Holiday.Model             ( Date(..)
                                                , Holiday(..)
                                                )
import           Data.Maybe                     ( fromJust
                                                , listToMaybe
                                                )
import           Util.Config                    ( holidays )

-- | 'getHoliday' returns Nothing if there is no Korean holiday.
getHoliday
  :: Integer -- ^ Year
  -> Int -- ^ Month
  -> Int -- ^ Day
  -> Maybe Holiday
getHoliday year month day = listToMaybe $ filter match holidays
 where
  match :: Holiday -> Bool
  match Holiday { date = YMD (y, m, d) } | y == year && m == month && d == day =
    True
  match Holiday { date = MD (m, d) } | m == month && d == day = True
  match _ = False
