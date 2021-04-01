CABAL := cabal

.PHONY: all
all:
	$(CABAL) build

scripts/data/%.sql:
	cd scripts && ./index_spec.js

scripts/html.db: scripts/data/*.sql scripts/*.sql
	cd scripts && ./gendb.sh

.PHONY: repl
repl:
	$(CABAL) repl

.PHONY: clean
clean:
	$(CABAL) clean

