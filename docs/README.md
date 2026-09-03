# Documentation

This repository distinguishes between authoritative standards and working
artifacts.

## Authoritative Documents

These files define the durable repository contract for structure, standards,
and documentation policy:

- `docs/governance/repository-governance.md`
- `docs/architecture/repository-architecture.md`
- `docs/standards/lean-standards.md`

When these files conflict with older planning notes, prompts, audits, or
scratch status documents, the authoritative set wins.

## Working Artifacts

The rest of `docs/` is non-authoritative unless a file explicitly says
otherwise. In practice that includes:

- repair plans and migration ledgers such as `docs/p0-repair/`,
  `docs/algebraic-structures-repair/`, and `docs/landau-satisfaction/`;
- audit and commentary files such as `docs/structure-audit-inventory.md`;
- tool-specific prompt packs under `docs/tool-prompts/`;
- subject-local design notes such as `LRA/Analysis/MetricSpace/DesignDoc.md`.

Working artifacts may explain current state or a proposed path, but they do not
override repository governance.

## Placement Rules

- Put durable repository-wide policy in `docs/governance/`,
  `docs/architecture/`, or `docs/standards/`.
- Put active migration plans, audits, and repair notes under `docs/<initiative>/`.
- Put machine-facing prompt packs under `docs/tool-prompts/`.
- Do not add new repository-wide governance or planning markdown at the repo
  root. The only root markdown files that should remain durable are `README.md`,
  `AGENTS.md`, and `LICENSE.md`.
