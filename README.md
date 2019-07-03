# korea-holidays

[![Build Status](https://travis-ci.com/kkweon/korea-holidays.svg?branch=master)](https://travis-ci.com/kkweon/korea-holidays)

*korea-holidays* is a Haskell library to check if a given date is a Korean
Holiday.

## Usage

```haskell
import qualified Data.Holiday.Korea as Korea

Korea.getHoliday 2000 1 1 `shouldBe` Just Korea.Holiday
  { Korea.date = Korea.MD (1, 1)
  , Korea.name = "SinJeong"
  }
```

## Add to your dependency

In your `package.yaml`

```yaml
library:
  dependencies:
  - korea-holidays
```
