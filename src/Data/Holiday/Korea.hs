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

data Date = YMD(Integer, Int, Int) -- ^ (Year, Month, Day) Some Holiday has a different date every year
  | MD(Int, Int) -- ^ (Month, Day) Some holidays repeat every year on the same date
  deriving (Show, Eq)

-- | 'Holiday' represents the date of holiday and the name of holiday.
data Holiday =
  Holiday
    { date :: Date -- ^ Date of the holiday
    , name :: String -- ^ Name of the holiday
    }
  deriving (Show, Eq)

-- | 'sinJeong' is the new year holiday.
sinJeong :: Holiday
sinJeong = Holiday {date = MD (1, 1), name = "SinJeong"}

samIlJeol :: Holiday
samIlJeol = Holiday {date = MD (3, 1), name = "SamIlJeol"}

-- | 'getHoliday' returns Nothing if there is no Korean holiday.
getHoliday
  :: Integer -- ^ Year
  -> Int -- ^ Month
  -> Int -- ^ Day
  -> Maybe Holiday
getHoliday year month day | month == 1 && day == 1 = Just sinJeong
                          | month == 3 && day == 1 = Just samIlJeol
                          | otherwise              = Nothing
