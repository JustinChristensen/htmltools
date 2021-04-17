CABAL := cabal
SCRIPTS_DIR := scripts
MIGRATIONS_DIR := $(SCRIPTS_DIR)/migrations

HASKELL_SOURCES := \
lib/Html/Internal/Elements.hs \
lib/Html/Internal/Attributes.hs

.PHONY: all
all:
	$(CABAL) build

scripts/data/%.sql:
	cd scripts && ./gentool.js

scripts/html.db: $(MIGRATIONS_DIR)/data/*.sql $(MIGRATIONS_DIR)/*.sql
	cd scripts && ./gendb.sh

.PHONY: $(HASKELL_SOURCES)
$(HASKELL_SOURCES): scripts/html.db
	cd scripts && ./gentool.js haskell

.PHONY: repl
repl:
	$(CABAL) repl

.PHONY: clean
clean:
	$(CABAL) clean
	rm -rf $(SCRIPTS_DIR)/tmp

