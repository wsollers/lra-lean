# ============================================================
# lra-lean — Lean 4 Build Environment
# ============================================================
# Pins the exact Lean toolchain version used by the project.
# Lean version is read from lean-toolchain at build time so
# updating the toolchain only requires changing that one file.
#
# Usage:
#   docker build -t lra-lean .
#   docker run --rm -v $(pwd):/workspace lra-lean make build
#   docker run --rm -it -v $(pwd):/workspace lra-lean bash
#
# The image is intentionally minimal — only what lake needs.
# ============================================================

FROM ubuntu:24.04

# ── System dependencies ──────────────────────────────────────
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl            \
    git             \
    ca-certificates \
    make            \
    bash            \
    && rm -rf /var/lib/apt/lists/*

# ── elan (Lean version manager) ─────────────────────────────
RUN curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh \
    | bash -s -- -y --no-modify-path \
    && echo 'export PATH="$HOME/.elan/bin:$PATH"' >> /etc/environment

ENV PATH="/root/.elan/bin:${PATH}"

# ── Toolchain pin ────────────────────────────────────────────
WORKDIR /workspace
COPY lean-toolchain ./lean-toolchain

RUN elan toolchain install "$(cat lean-toolchain)" \
    && elan default "$(cat lean-toolchain)"

# ── Pre-fetch lake dependencies ──────────────────────────────
COPY lake-manifest.json ./lake-manifest.json
COPY lakefile.lean ./lakefile.lean

RUN lake update 2>/dev/null || true

WORKDIR /workspace

CMD ["bash"]
