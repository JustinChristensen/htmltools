CABAL := cabal

.PHONY: all
all:
	$(CABAL) build

.PHONY: repl
repl:
	$(CABAL) repl

.PHONY: clean
clean:
	$(CABAL) clean