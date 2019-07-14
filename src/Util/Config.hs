{-# LANGUAGE TemplateHaskell #-}

module Util.Config where

import qualified Data.Holiday.Model as K
import Data.Yaml.TH (decodeFile)

holidays :: [K.Holiday]
holidays = $$(decodeFile "data/ko_holidays.yaml")
