# Repository Governance

## Purpose

This document defines the repository's documentation authority, governance
boundaries, and markdown hygiene rules.

The goal is to keep `lra-lean` governed by a small, stable set of documents
instead of a growing pile of overlapping plans, prompts, and design notes.

## Authority Order

Resolve authority in this order:

1. Canonical governance resolved through `AGENTS.md` and `lra-governance`.
2. Repo-local authoritative documents:
   - `docs/governance/repository-governance.md`
   - `docs/architecture/repository-architecture.md`
   - `docs/standards/lean-standards.md`
3. Subject-local design notes for the subject they explicitly cover.
4. Working artifacts such as audits, plans, prompts, reviews, and status files.

Working artifacts may record state, proposals, or migration sequencing. They
are not binding policy.

## Document Classes

### Authoritative

Authoritative documents are durable, cross-cutting, and expected to remain true
after the current refactor or repair effort ends.

Allowed repository-wide authoritative locations:

- `docs/governance/`
- `docs/architecture/`
- `docs/standards/`

An authoritative document must:

- define a stable rule, ownership boundary, or standard;
- avoid embedding time-sensitive project status;
- avoid task-specific handoff instructions;
- be referenced by other durable docs instead of restating them.

### Subject-local design notes

Subject-local design notes are allowed when one subject needs extra structure
guidance beyond the repository-wide architecture. They are advisory outside the
subject they name and must defer to the authoritative repository-wide set.

### Working artifacts

Working artifacts include:

- audits;
- cleanup plans;
- migration ledgers;
- prompt packs;
- status dashboards;
- handoff notes;
- scratch reviews.

These belong under `docs/<initiative>/` or `docs/tool-prompts/`, not at the
repo root.

## Root Markdown Policy

The repo root is not a planning workspace.

Allowed durable root markdown:

- `README.md`
- `AGENTS.md`
- `LICENSE.md`

Everything else should either:

- move into `docs/` as a working artifact; or
- be deleted if it is obsolete or duplicated by an authoritative document.

## Non-Duplication Rule

A repository-wide rule should have one canonical home.

- Governance rules live here.
- Architecture and placement rules live in
  `docs/architecture/repository-architecture.md`.
- Lean authoring, proof, and mathematical standards live in
  `docs/standards/lean-standards.md`.

Do not create a second policy file that partially restates one of those areas.
Extend the canonical document instead.

## Change Control

Add or expand an authoritative document only when the rule is:

- cross-cutting across multiple subjects or initiatives;
- expected to remain valid after current repair work ends; and
- specific enough to drive placement or review decisions.

Do not promote an audit finding, issue list, or prompt into governance unless
the finding generalizes into a durable standard.

## Working Artifact Lifecycle

- Keep active work under a named `docs/<initiative>/` directory.
- Prefer `README.md`, `status.md`, and `DECISIONS.md` inside an initiative
  folder over many root-level files.
- When an initiative ends, either delete the artifact or retain only the
  minimum record needed for future context.
- Do not let superseded working files remain ambiguous with authoritative docs.

## Review Expectations

Any change to the authoritative set must:

- update inbound references that cite superseded files;
- avoid leaving duplicate policy text behind;
- preserve subject-local exceptions explicitly instead of relying on history;
- keep the authoritative set small.
