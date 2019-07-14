.PHONY: test clean doc upload format

test:
	stack test

clean:
	stack clean

doc:
	stack haddock

upload:
	stack upload .

format:
	find src -type f -not -path '*/Config.hs' -exec hindent --sort-imports {} +
