# ============================================================
# lra-lean — Lean 4 and documentation build environments
# ============================================================
#
# Targets:
#   lean-build            Lean/Lake only
#   documentation-build   Lean + Lean Blueprint + Graphviz + TeX
#
# Usage:
#   docker build --target lean-build -t lra-lean .
#   docker build --target documentation-build -t lra-lean-docs .
# ============================================================

FROM ubuntu:24.04 AS lean-build

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    ca-certificates \
    make \
    bash \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh \
    | bash -s -- -y --no-modify-path \
    && echo 'export PATH="$HOME/.elan/bin:$PATH"' >> /etc/environment

ENV PATH="/root/.elan/bin:${PATH}"

WORKDIR /workspace
COPY lean-toolchain ./lean-toolchain

RUN elan toolchain install "$(cat lean-toolchain)" \
    && elan default "$(cat lean-toolchain)"

COPY lake-manifest.json ./lake-manifest.json
COPY lakefile.lean ./lakefile.lean

RUN lake update 2>/dev/null || true

WORKDIR /workspace
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
      leanblueprint==0.0.20

ENV PATH="/opt/lean-blueprint/bin:/root/.elan/bin:${PATH}"

WORKDIR /workspace
CMD ["bash"]
