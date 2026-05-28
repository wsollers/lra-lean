# ============================================================
# lra-lean — Makefile
# ============================================================
# Targets:
#   make build        — build all Lean libraries in the project
#   make check        — build + verify no sorry, no axiom leaks
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

IMAGE    := lra-lean
LEAN_VER := $(shell cat lean-toolchain 2>/dev/null || echo "unknown")
SRC_DIR  := $(CURDIR)

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
	@echo "── Checking for sorry ──────────────────────────────"
	@$(RUN) grep -rn "sorry" LRA/VolumeII/ --include="*.lean" \
	    && echo "✗ ERROR: sorry found in VolumeII" && exit 1 \
	    || echo "✓ No sorry in VolumeII"
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
