# Foundation Restart Plan

This is the tracking document and table of contents for the `lra-lean`
foundation restart.

Continuation prompt:

```text
docs/restart/handoff-prompt.md
```

The restart begins by archiving the current Lean tree, then rebuilding the
foundation slowly from a light logic layer into sets. No relation algebra,
function theory, quotient work, order theory, cardinality, or number-system work
should begin until the logic prelude and set architecture have been accepted.

## Purpose

Restart `lra-lean` from a deliberately small, source-grounded foundation so the
Lean development can serve three goals at once:

- formalize the notes faithfully enough that the Lean files are a genuine
  companion to the book;
- provide theorem statements with `sorry` proofs so proofs can be completed as
  a learning path;
- build the number systems later on top of a foundation that was designed for
  sets first, not retrofitted from later number-system pressure.

The flavor should be Bourbaki-inspired: explicit foundational vocabulary,
clean algebraic laws, stable dependency order, and careful attention to when
Lean forces distinctions that the prose notes leave implicit.

## Design Decisions

- Bourbaki is an inspiration for order, rigor, and proof-theoretic orientation,
  not a requirement to preserve Bourbaki's original notation or historical
  formal language.
- The restart will model modern mathematical logic, proof theory, and set
  theory in contemporary notation and terminology.
- When Bourbaki's presentation differs from modern practice, prefer the modern
  formulation and record the Bourbaki comparison as commentary.
- Lean's native `Prop` remains the proof engine for ordinary mathematical
  formalization; object logics are Volume I learning artifacts unless a later
  design decision says otherwise.
- Shared object-logic vocabulary lives in `LRA/VolumeI/Logic/Core.lean`.
  The top-level interface is `Logic`, with mixins for truth values, Boolean
  evaluation, connectives, quantifiers, theoremhood, and semantic entailment.
  The older `LogicalLanguage`, `LogicalFormula`, `LogicalStructure`, and
  `LogicalTheory` layer remains as a concrete syntax helper for simple
  connective-based object logics.
- Shared object-language connective notation lives in
  `LRA.VolumeI.Logic.Notation`. It provides opt-in classes and constructors for
  `not`, `and`, `or`, `implies`, and `iff`; quantifier notation is delayed until
  first-order syntax has a real binder representation.
- Generic formula-formation facts live in `LRA.VolumeI.Logic.ClosureRules`.
  Concrete propositional modules should use those shared theorems directly
  rather than wrapping them under local theorem names.
- Generic formula minimality/induction facts live in
  `LRA.VolumeI.Logic.FormulaMinimality`. Concrete propositional modules should
  use the shared theorem directly.
- Generic Bool-valued semantics live under `LRA.VolumeI.Logic.Semantics`, split
  into `Satisfaction`, `TheoryModels`, and `Entailment`. They are shared
  object-logic facts, not propositional-specific facts.

## Current Status

Status: restart skeleton created.

Active phase: first-order logic first pass.

Current decision:

- Archive completed: previous `LRA/` is now `LRA-OLD/`.
- Restart scope includes a light logic layer and then stops at sets.
- Use Lean's `Prop` for future mathematical proofs where possible.
- Keep tiny Bourbaki-style propositional proof theory, if retained, under
  `Alternate/` as a learning/reference artifact. The core propositional layer
  models regular modern logic.
- Keep the abstract object-logic interface separate from propositional logic:
  propositional modules provide instances and notation, not the shared
  `Logical*` definitions themselves.
- Propositional logic now provides `propositionalLogic`, the first implementation
  of the shared `Logic` interface.
- First-order logic should implement its own term/formula/assignment syntax and
  use the `Logic` interface as an outer mixin target where natural.
- Accommodate first-order logic, proof theory, and model theory with locations
  and wiring tests, but do not build model theory in the restart core.
- Use this document as the stable handoff point between chats and Codex
  threads.

## Step Index

| Step | Status | File | Purpose |
|---|---|---|---|
| 0 | drafted | [Pre-Restart Volume I Lean Catalog](foundation-restart-plan/00-current-volume-i-lean-catalog.md) | Catalog archived Volume I Lean and logic machinery for harvesting decisions. |
| 1 | completed | [Archive Current Lean Tree](foundation-restart-plan/01-archive-current-lean-tree.md) | Preserve current `LRA/` as `LRA-OLD/` before rebuilding. |
| 2 | planned | [Scope Stops At Sets](foundation-restart-plan/02-scope-stops-at-sets.md) | Explicitly block later layers until logic and set architecture are accepted. |
| 3 | completed | [Logic Layer Layout](foundation-restart-plan/03-logic-layer-layout.md) | Define Volume I package/file/namespace locations and tautological wiring tests. |
| 4 | checkpointed | [Propositional Logic First Pass](foundation-restart-plan/04-propositional-logic-first-pass.md) | Define regular modern propositional logic and keep Bourbaki/NAND material as alternate artifacts. |
| 4a | next | [First-Order Logic First Pass](foundation-restart-plan/04a-first-order-logic-first-pass.md) | Define the first-order language, terms, formulas, structures, assignments, and satisfaction. |
| 5 | planned | [Set Architecture Decision](foundation-restart-plan/05-set-architecture-decision.md) | Choose the Lean representation of sets and document the book-to-Lean translation. |
| 6 | planned | [First Set Core](foundation-restart-plan/06-first-set-core.md) | Define the smallest proof-ready set foundation. |
| 7 | planned | [Set Diagrams And Governance](foundation-restart-plan/07-set-diagrams-and-governance.md) | Create diagrams, source-grounding rules, and book-tweak tracking. |
| 8 | planned | [Set Phase Acceptance Criteria](foundation-restart-plan/08-set-phase-acceptance-criteria.md) | Define the gate for moving beyond sets. |

## Working Rules

- Treat `LRA-OLD/` as an archive once created.
- Do not introduce compatibility aliases during the restart.
- Every new Lean declaration should map to a Volume I source label or to a
  documented Lean-support need.
- The object-logic layer is a learning artifact; later set proofs should not
  depend on it unless we explicitly choose that for a source-grounded reason.
- Volume I learning artifacts live under `LRA/VolumeI/`, not
  `LRA/Foundation/`.
- Definitions must be real.
- Theorem statements must be mathematically honest.
- Proofs may use `sorry`.
- Prefer small theorem statements that can be completed by hand.
- Record required book changes in a dedicated book-tweak document instead of
  silently bending the Lean formalization.

## Open Design Questions

- Should the alternate Bourbaki artifact remain imported by the propositional
  aggregate, or stay available only by direct import?
- Should `ProofTheory.lean` contain theoremhood in general, or should
  propositional theoremhood live entirely in `PropositionalLogic.lean` at first?
- Should the first set layer use predicate sets directly, structured set
  objects, or a two-layer design?
- How should complement be represented: absolute over a carrier, or explicitly
  relative to a universe set?
- Should `powerSet` be included in the first core, or delayed until universe
  behavior is documented?
- How much classical logic should the first set file allow?

## Next Action

Begin the first-order logic first pass from
`docs/restart/foundation-restart-plan/04a-first-order-logic-first-pass.md`.
Start with the file/module layout and a small `Language.lean`; do not move to
sets until the first-order architecture is accepted.
