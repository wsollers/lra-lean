# Lean Standards

## Purpose

This document defines repository-wide mathematical, proof, and Lean authoring
standards.

## Mathematical Foundation Rules

### One-based natural numbers

The Landau natural-number development uses the one-based convention:

- distinguished element: `one`
- addition base clause: `plus x one = successor x`
- multiplication base clause: `mul x one = x`
- exponentiation base clause: `exp x one = x`

Do not silently switch that development to a zero-based convention.

### Dependency order

Definitions and proofs must respect the dependency chain of the local subject.
Do not use later machinery inside earlier foundational layers.

### No unauthorized mathematical drift

Structural cleanup, migration, or governance work must preserve mathematical
substance unless the task explicitly asks for mathematical authoring or
correction.

## Mathlib Policy

- Mathlib-free zones must remain Mathlib-free.
- Where Mathlib is permitted, import only what the file actually needs.
- Do not use Mathlib imports as a substitute for an LRA-owned foundational
  layer that is intentionally independent.

## Proof Architecture

- Prove reusable architectural lemmas once and cite them.
- Do not repeatedly unfold low-level recursion or representation machinery in
  higher-level algebraic proofs when a named clause or interface theorem exists.
- If a proof is growing mainly because the abstraction boundary is wrong, fix
  the boundary instead of normalizing the long proof.

## Naming

- Use `PascalCase` for source-facing definitions, structures, theorem packages,
  and chapter-style declarations.
- Use `snake_case` only where the surrounding subsystem already uses it, such
  as legacy Landau arithmetic.
- Name theorems for mathematical content, not for proof method or temporary
  implementation role.
- Use semantically meaningful local names for hypotheses, predicates, witnesses,
  and intermediate constructions.

## Namespaces

- Keep namespaces aligned with file paths.
- Preserve established local namespace conventions in legacy subsystems unless
  the task includes a deliberate namespace migration.

## Doc Comments

Every source-facing `theorem`, `lemma`, `corollary`, `def`, `structure`,
`class`, and `axiom` must have a doc comment that is readable without opening
external notes.

Minimum required content:

- display name;
- mathematical statement in ordinary language, or a temporary Lean-signature
  statement during a scoped import pass;
- dependencies when they matter materially;
- source or notes references when available;
- proof status when the declaration is intentionally pending.

## Proof-Pending Declarations

Proof-pending declarations are allowed only when the repository or task already
permits them.

When a body uses `sorry`:

- the Lean type must still state the intended mathematics accurately;
- the doc comment must say `*Proof status:* proof pending`;
- the declaration must not be reported as proved or complete.

Do not hide incomplete definitions, invalid signatures, or architectural
uncertainty behind proof stubs.

## Proof Style

- Prefer short, explicit proofs over tactic golf.
- Use named intermediate claims when they improve readability.
- Extract a lemma when the same sub-argument is repeated or a proof exceeds its
  reasonable local complexity budget.
- Induct on the variable that matches the defining recursion unless there is a
  concrete reason not to.

## Review Standard

A Lean change is not complete until:

- the declaration is placed under the correct owner and layer;
- naming and doc-comment standards are met;
- the claimed proof status matches reality;
- the required verification gate for the task has been run, or the omission is
  reported explicitly.
