CABAL := cabal
SCRIPTS_DIR := scripts
MIGRATIONS_DIR := $(SCRIPTS_DIR)/migrations

.PHONY: all
all:
	$(CABAL) build

scripts/data/%.sql:
	cd scripts && ./index_spec.js

scripts/html.db: $(MIGRATIONS_DIR)/data/*.sql $(MIGRATIONS_DIR)/*.sql
	cd scripts && ./gendb.sh

.PHONY: repl
repl:
	$(CABAL) repl

.PHONY: clean
clean:
	$(CABAL) clean
	rm -rf $(SCRIPTS_DIR)/tmp

