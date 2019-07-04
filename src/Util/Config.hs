{-# LANGUAGE TemplateHaskell #-}

module Util.Config where

import           Data.Yaml.TH                   ( decodeFile )
import qualified Data.Holiday.Model            as K

holidays :: [K.Holiday]
holidays = $$(decodeFile "data/ko_holidays.yaml")
