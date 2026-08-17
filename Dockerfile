# ============================================================
# lra-lean — Lean 4 and documentation build environments
# ============================================================
#
# Targets:
#   lean-build            Lean/Lake only, with dependencies preloaded
#   documentation-build   Lean + Lean Blueprint + Graphviz + TeX
#
# The lean-build image is deliberately source-independent.  It contains:
#   * OS tooling
#   * elan + the pinned Lean toolchain
#   * Lake dependency sources
#   * Mathlib's downloaded compiled cache
#
# Ordinary CI MUST NOT bind-mount the repository over /workspace.  Doing so
# would hide /workspace/.lake and throw away the expensive preloaded dependency
# environment.  Instead CI mounts only the live LRA/ source tree and the live
# project lakefile.lean.
# ============================================================

FROM ubuntu:24.04 AS lean-build

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    ca-certificates \
    make \
    bash \
    python3 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh \
    | bash -s -- -y --no-modify-path \
    && echo 'export PATH="$HOME/.elan/bin:$PATH"' >> /etc/environment

ENV PATH="/root/.elan/bin:${PATH}"

WORKDIR /workspace

COPY lean-toolchain ./lean-toolchain
RUN TOOLCHAIN="$(tr -d '\r\n' < lean-toolchain)" \
    && elan toolchain install "$TOOLCHAIN" \
    && elan default "$TOOLCHAIN"

# Use a dependency-only Lake file so ordinary edits to the repository's real
# lakefile.lean (for example adding build roots during standardization) do not
# invalidate this expensive image.
COPY docker/lakefile.env.lean ./lakefile.lean
COPY lake-manifest.json ./lake-manifest.json

# Materialize dependency sources and Mathlib's precompiled .olean cache inside
# the image.  These remain visible at runtime because CI mounts source
# selectively instead of mounting over /workspace.
RUN lake update
RUN lake exe cache get

CMD ["bash"]

FROM lean-build AS documentation-build

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    graphviz \
    libgraphviz-dev \
    pkg-config \
    latexmk \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-science \
    texlive-bibtex-extra \
    texlive-xetex \
    biber \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/lean-blueprint \
    && /opt/lean-blueprint/bin/pip install --upgrade pip \
    && /opt/lean-blueprint/bin/pip install \
      leanblueprint==0.0.20 \
      pyyaml

ENV PATH="/opt/lean-blueprint/bin:/root/.elan/bin:${PATH}"

WORKDIR /workspace
CMD ["bash"]
