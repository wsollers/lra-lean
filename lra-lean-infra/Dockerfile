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
# elan is the rustup equivalent for Lean.
# We install it non-interactively and add it to PATH.
RUN curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh \
    | bash -s -- -y --no-modify-path \
    && echo 'export PATH="$HOME/.elan/bin:$PATH"' >> /etc/environment

ENV PATH="/root/.elan/bin:${PATH}"

# ── Toolchain pin ────────────────────────────────────────────
# Copy lean-toolchain first so Docker layer cache is invalidated
# only when the toolchain version changes, not on every code change.
WORKDIR /workspace
COPY lean-toolchain ./lean-toolchain

# Install the exact toolchain version pinned in lean-toolchain.
# This downloads the Lean binary and caches it in the image layer.
RUN elan toolchain install "$(cat lean-toolchain)" \
    && elan default "$(cat lean-toolchain)"

# ── Pre-fetch lake dependencies ──────────────────────────────
# Copy only the lake manifest files first.
# lake packages are currently empty (VolumeII is bare Lean 4)
# but this layer is ready for when VolumeIII adds Mathlib.
COPY lake-manifest.json ./lake-manifest.json
COPY lakefile.lean ./lakefile.lean

# Fetch/resolve dependencies (no-op for empty packages list)
RUN lake update 2>/dev/null || true

# ── Default working directory ────────────────────────────────
# The full source is mounted at runtime via -v $(pwd):/workspace
# We do NOT COPY the source into the image — that would defeat
# the purpose of a build container. Source is always mounted.
WORKDIR /workspace

CMD ["bash"]
