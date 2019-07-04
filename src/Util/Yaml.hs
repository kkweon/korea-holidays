module Util.Yaml where

import Data.List.Split (splitOn)
import qualified Data.Holiday.Korea as Korea


parseKoreanDate :: String -> Maybe Korea.Date
parseKoreanDate xs =
  case splitOn "-" xs of
    [y,m,d] | verifyYmd y m d -> Just Korea.YMD(y, m, d)
    [m, d]  | verifyMd m d -> Just Kore.MD(m, d)
    otherwise -> Nothing



verifyYmd :: String -> String -> String -> Bool
verifyYmd y m d = undefined

verifyMd :: String -> String -> Bool
verifyMd m d = undefined
