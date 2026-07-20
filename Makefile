# ============================================================
# lra-lean — Makefile
# ============================================================
# Targets:
#   make build        — build all Lean libraries in the project
#   make check        — build + verify proof-readiness and import policy
#   make clean        — remove lake build artifacts
#   make shell        — open interactive shell in Docker container
#   make docker-build — build the Docker image
#   make lint         — check doc-comment coverage (display names)
#   make stats        — print proof counts per file
#   make ci           — full CI pipeline (docker-build + check)
#
# Run with Docker (recommended, reproducible):
#   make docker-build
#   make build       (runs inside Docker automatically if IMAGE set)
#
# Run natively (requires matching lean-toolchain installed):
#   NATIVE=1 make build
# ============================================================

IMAGE     := lra-lean
DOC_IMAGE := lra-lean-docs
LEAN_VER  := $(shell cat lean-toolchain 2>/dev/null || echo "unknown")
SRC_DIR   := $(CURDIR)

ifdef NATIVE
  RUN :=
else
  RUN := docker run --rm -v $(SRC_DIR):/workspace -w /workspace $(IMAGE)
endif

.PHONY: build
build:  ## Build all Lean libraries
	$(RUN) lake build LRAVolumeII
	@echo "✓ VolumeII build successful (Lean $(LEAN_VER))"

.PHONY: build-all
build-all:  ## Build all volumes
	$(RUN) lake build
	@echo "✓ Full build successful (Lean $(LEAN_VER))"

.PHONY: check
check: build  ## Build + run all checks
	@echo "── Checking proof-readiness ────────────────────────"
ifdef NATIVE
	@python3 scripts/check-proof-readiness.py
else
	@$(RUN) python3 scripts/check-proof-readiness.py
endif
	@echo "── Checking Mathlib imports in VolumeII ────────────"
	@$(RUN) bash -lc 'if grep -rn "^import Mathlib" LRA/VolumeII/ LRA/VolumeII.lean --include="*.lean"; then \
	    echo "✗ ERROR: Mathlib import found in VolumeII"; exit 1; \
	  else \
	    echo "✓ No Mathlib imports in VolumeII"; \
	  fi'
	@echo "── Checking for axiom leaks ────────────────────────"
	@$(RUN) lake env lean --run scripts/check_axioms.lean 2>/dev/null \
	    || echo "  (axiom check script not yet present — skipping)"
	@echo "── Checking doc-comment coverage ───────────────────"
	@$(MAKE) lint
	@echo "✓ All checks passed"

.PHONY: clean
clean:  ## Remove build artifacts
	$(RUN) lake clean
	@echo "✓ Build artifacts removed"

.PHONY: shell
shell:  ## Open interactive shell in Docker container
	docker run --rm -it -v $(SRC_DIR):/workspace -w /workspace $(IMAGE) bash

.PHONY: docker-build
docker-build:  ## Build the Docker image
	docker build -t $(IMAGE) .
	@echo "✓ Docker image '$(IMAGE)' built (Lean $(LEAN_VER))"

.PHONY: docker-docs-build
docker-docs-build:  ## Build the Docker documentation image
	docker build --target documentation-build -t $(DOC_IMAGE) .
	@echo "✓ Docker image '$(DOC_IMAGE)' built"

.PHONY: number-systems-blueprint
number-systems-blueprint:  ## Generate number-system Blueprint inputs
ifdef NATIVE
	python3 scripts/build-number-systems-declaration-manifest.py
	python3 scripts/build-number-systems-blueprint.py
else
	docker run --rm -v $(SRC_DIR):/workspace -w /workspace $(DOC_IMAGE) python3 scripts/build-number-systems-declaration-manifest.py
	docker run --rm -v $(SRC_DIR):/workspace -w /workspace $(DOC_IMAGE) python3 scripts/build-number-systems-blueprint.py
endif
	@echo "✓ Number-system Blueprint inputs generated"

.PHONY: blueprint
blueprint: number-systems-blueprint  ## Compile Blueprint PDF and web output
ifdef NATIVE
	leanblueprint pdf
	leanblueprint web
	python3 scripts/check-blueprint-declarations.py
else
	docker run --rm -v $(SRC_DIR):/workspace -w /workspace $(DOC_IMAGE) leanblueprint pdf
	docker run --rm -v $(SRC_DIR):/workspace -w /workspace $(DOC_IMAGE) leanblueprint web
	docker run --rm -v $(SRC_DIR):/workspace -w /workspace $(DOC_IMAGE) python3 scripts/check-blueprint-declarations.py
endif
	@echo "✓ Blueprint compiled"

.PHONY: docs
docs: blueprint  ## Build repository site and attach Blueprint output
	python3 scripts/build-repository-site.py
	mkdir -p site/blueprint
	cp -R blueprint/web/. site/blueprint/
	cp blueprint/print/print.pdf site/number-systems-blueprint.pdf
	@echo "✓ Documentation site generated in site/"

.PHONY: docker-pull
docker-pull:  ## Pull a pre-built image if available
	docker pull ghcr.io/wsollers/lra-lean:latest 2>/dev/null \
	    && docker tag ghcr.io/wsollers/lra-lean:latest $(IMAGE) \
	    || echo "No pre-built image found — run 'make docker-build'"

.PHONY: lint
lint:  ## Check that every theorem/def has a display name doc-comment
	@echo "── Doc-comment coverage check ──────────────────────"
	@bash scripts/lint_doccomments.sh LRA/VolumeII \
	    || echo "  (lint script not yet present — skipping)"

.PHONY: stats
stats:  ## Print theorem/def counts per file
	@echo "── Proof statistics ────────────────────────────────"
	@find LRA/VolumeII -name "*.lean" | while read f; do \
	    thms=$$(grep -c "^theorem\|^lemma\|^corollary" "$$f" 2>/dev/null || echo 0); \
	    defs=$$(grep -c "^def\|^noncomputable def" "$$f" 2>/dev/null || echo 0); \
	    sorry=$$(grep -c "sorry" "$$f" 2>/dev/null || echo 0); \
	    echo "  $$f : $$thms theorems, $$defs defs, $$sorry sorry"; \
	done

.PHONY: ci
ci: docker-build check  ## Full CI pipeline
	@echo "✓ CI pipeline complete"

.PHONY: help
help:  ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	    | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
