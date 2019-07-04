# korea-holidays

[![Build Status](https://travis-ci.com/kkweon/korea-holidays.svg?branch=master)](https://travis-ci.com/kkweon/korea-holidays)
![Hackage-Deps](https://img.shields.io/hackage-deps/v/korea-holidays.svg)
![Hackage](https://img.shields.io/hackage/v/korea-holidays.svg)

**korea-holidays** is a Haskell library to check if a given date is a Korean
Holiday.

## Usage

```haskell
Korea.getHoliday 2000 1 1 `shouldBe`
      Just
        Holiday
          {date = KM.MD (1, 1), name = "New Year's Day", lunar = Nothing}

Korea.getHoliday 2019 3 1 `shouldBe`
      Just
        Holiday
          {date = KM.MD (3, 1), name = "March 1 Movement Day", lunar = Nothing}
```

## Add to your dependency

In your `package.yaml`

```yaml
dependencies:
- korea-holidays
```
