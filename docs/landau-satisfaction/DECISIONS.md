# Landau Satisfaction Decisions

Updated: 2026-08-30

This file records the decisions already settled for the Landau satisfaction
planning track. Items in this file are intended to be authoritative for the
phase documents unless superseded here.

## Step 0 Decisions

### D0.1 Primary cert meaning

- `Cert_*` and `StructCert_*` refer primarily to mechanism 2:
  `LRA/AlgebraicStructures/*/Laws` bundled law evidence.
- Mechanism 1 (`LRA/UniversalAlgebra/Satisfaction`) remains a secondary
  equation-level restatement layer and should not be treated as the default
  meaning of a cert name.

### D0.2 Ownership split

- Subject interfaces own operation existence and uniqueness statements.
- `LRA/AlgebraicStructures/*` owns structure-law conjunctions.
- `LRA/UniversalAlgebra/*` owns equation-level restatements.
- `LRA/Operation/*` owns reusable generic operator artifacts that sit above raw
  operation primitives and below subject-specific realizations.

### D0.3 Generic operator placement

- Generic operators live under:
  - `LRA/Operation/Addition/`
  - `LRA/Operation/Multiplication/`
- Each operator directory must use the same file split:
  - `Definition.lean`
  - `Existence.lean`
  - `Uniqueness.lean`
  - `Realization.lean`
  - `Laws.lean`
  - `Theorems.lean`
- Each operator directory should also grow an `Interface/` subtree when the
  operator is promoted into first-class model-theory / universal-algebra
  surfaces.

### D0.4 Interface shape for promoted operators

- Promoted operators should follow the repo's current interface pattern:
  - `Interface/Signature/Definition.lean` when a subject-facing signature layer
    is needed.
  - `Interface/ModelTheory/{Model,Theory,LStructure}.lean` for the operator's
    model-facing contract.
  - `Interface/UniversalAlgebra/Signature/Definition.lean` and
    `Interface/UniversalAlgebra/Satisfy_Generic.lean` for the equation-facing
    view.
- Phase 1 defines the base operator artifact directories first. Interface
  subtrees may be created in the same phase when they are needed to avoid
  retrofitting.

### D0.5 What the generic operator layer may and may not do

- It may define operator specifications, existence obligations, uniqueness
  obligations, realizations, and generic operator-specific theorems.
- It may bridge realized operators to existing law classes.
- It may not redefine commutativity, associativity, identity, distributivity,
  or other canonical law predicates already owned by `LRA/Operation/Laws/*`.
- It may not absorb subject-specific recursion principles that are only valid in
  `PeanoSystem`, `NaturalNumbers`, or other concrete subjects.

### D0.6 Placeholder policy

- Theorems introduced by this workstream may use `sorry` where the repository
  already permits placeholders for comparable work.
- Definitions, routers, placement files, and non-proof scaffolding should be
  sorry-free whenever possible.

### D0.7 Naming standard

- Use descriptive theorem names for operator-specific generic theorems.
- Reserve `Cert_*` for named law evidence and `StructCert_*` for conjunctions of
  such evidence.
- Implication-shaped facts such as cancellation remain ordinary theorem names
  unless a later decision explicitly introduces a new convention.

### D0.8 Phase dependency

- Generic operator laws must be fixed before operator-specific addition and
  multiplication realizations are implemented.
- `Addition` and `Multiplication` discharge those laws individually in their
  own `Laws.lean` files.
- Mixed-operator laws such as distributivity require an explicit ownership rule
  before Phase 2 implementation begins.

### D0.9 Law form and discharge contract

- Generic laws are predicates on operator data, not standalone replacement
  models.
- Unary-operator laws are predicates on one realized operation.
  Examples: associativity, commutativity, identity, inverse, idempotence.
- Mixed-operator laws are predicates on a pair of realized operations.
  Examples: distributivity, absorbing interactions.
- Later operator artifacts must discharge these predicates explicitly by
  exporting proofs of the canonical law predicates one law at a time.
- `Addition` and `Multiplication` may package these proofs as fields,
  instances, or exported theorems, but they may not redefine the predicates.
- Structure bundles consume the resulting evidence only by conjunction.

### D0.10 Involution status

- Involution is not a primitive required law for the generic `Addition` or
  `Multiplication` phases.
- For inverse-bearing structures in the scalar arithmetic chain, involution
  should be treated as a derived theorem proved later from the inverse package
  together with the needed surrounding hypotheses.
- If a future standalone unary operator family is introduced whose primary law
  is involution, that family may define involution as a primitive there without
  changing this arithmetic plan.

### D0.11 Mixed-law sequencing

- Phase 2 covers only unary operator discharge for `Addition` and
  `Multiplication`.
- Mixed laws such as distributivity and additive-zero / multiplicative-absorber
  interactions are deferred to a later arithmetic bridge phase.
- This deferral is intentional because mixed laws depend on the unary operator
  realizations already being in place.

### D0.12 Operator interface subtree timing

- The six-file `Addition/` and `Multiplication/` base split is sufficient for
  Phase 2.
- Operator `Interface/` subtrees are deferred out of Phase 2 and become a
  required deliverable of Phase 3.
- Phase 3 owns the first-class model-facing and equation-facing surfaces for
  promoted operators.

### D0.13 Mixed-operator bridge placement

- Mixed-operator bridge artifacts live under:
  - `LRA/Operation/Arithmetic/`
- Phase 5 should create at least:
  - `LRA/Operation/Arithmetic.lean`
  - `LRA/Operation/Arithmetic/Distributivity.lean`
  - `LRA/Operation/Arithmetic/Absorbing.lean`
  - `LRA/Operation/Arithmetic/Theorems.lean`
- `LRA/Operation/Addition/*` and `LRA/Operation/Multiplication/*` may import
  these later bridges but may not own mixed-law definitions directly.

### D0.14 Baseline versus optional law symmetry

- `Addition` and `Multiplication` must stay structurally symmetric about which
  exported laws are baseline versus optional unless a later decision records an
  explicit reason to diverge.
- Baseline unary law exports should contain only the minimum law package needed
  to represent the operator generically.
- Operator families that can be present or absent across concrete realizations,
  such as commutativity, must be exported through separate optional bundles
  rather than baked into `BaseLawExports`.

### D0.15 Canonical tracker split

- `docs/algebraic-structures-repair/*` remains the canonical queue for
  subject-by-subject work inside `LRA/AlgebraicStructures/*`.
- `docs/landau-satisfaction/*` is the canonical orchestrator for the combined
  scalar-chain buildout across `LRA/Operation/*`,
  `LRA/AlgebraicStructures/*`, `LRA/NumberSystems/*`, and
  `LRA/UniversalAlgebra/*`.
- This workspace may summarize the relevant algebraic-structure dependencies by
  `as-*` id, but it should not fork a second independent per-structure ledger.

### D0.16 Scalar-chain algebraic-structure scope

- The scalar arithmetic chain depends primarily on these algebraic-structure
  subjects from `docs/algebraic-structures-repair/ledger.json`:
  - `as-18` `Semiring`
  - `as-19` `AbelianGroup`
  - `as-20` `OrderedGroup`
  - `as-22` `CommutativeSemiring`
  - `as-23` `CommutativeSemiringWithoutZero`
  - `as-24` `Ring`
  - `as-25` `OrderedSemiring`
  - `as-26` `LinearlyOrderedGroup`
  - `as-27` `CommutativeRing`
  - `as-28` `NontrivialRing`
  - `as-29` `OrderedRing`
  - `as-30` `DivisionRing`
  - `as-31` `IntegralDomain`
  - `as-32` `LinearlyOrderedRing`
  - `as-33` `Field`
  - `as-34` `OrderedField`
  - `as-35` `CompleteOrderedField`
- `as-21` `BooleanAlgebra` belongs to the broader algebraic-structures queue
  but is not on the critical path for the scalar arithmetic number-system
  interfaces in this plan.
- `as-06` `Archimedean` and `as-07` `DiscreteInteger` remain relevant side
  inputs for the ordered-number-system portion of the scalar chain.

### D0.17 Cross-workstream sequencing rule

- A Landau phase that consumes a scalar-chain algebraic structure may advance
  only when the relevant upstream `as-*` subject has either:
  - status `done`, or
  - an explicit recorded exception saying the required interface files already
    exist and do not need further rework for that phase.
- Phase 3 is where the remaining scalar-chain
  `AlgebraicStructures/*/Interface/ModelTheory/*` surfaces are aligned with the
  new operator layer.
- Phase 6 is where the remaining scalar-chain
  `AlgebraicStructures/*/Interface/UniversalAlgebra/*` surfaces and UA
  restatements are synchronized with the operator and number-system work.

### D0.18 Landau theorem scope for this workspace

- This workspace covers the scalar Landau chain through Chapter IV:
  - Chapter I `Natural Numbers` (Theorems 1–36)
  - Chapter II `Fractions` / rationals (Theorems 37–115)
  - Chapter III `Cuts` / real construction (Theorems 116–162)
  - Chapter IV `Real Numbers` (Theorems 163–205)
- This workspace stops at the algebraic endpoint
  `LRA.AlgebraicStructures.CompleteOrderedField`.
- Chapter V `Complex Numbers` (Theorems 206–228) is not on this workspace's
  critical path and should not be used to delay scalar-chain completion.

### D0.19 Proof placeholder policy for this track

- New theorem bodies and new proof-carrying `instance` declarations introduced
  by this workstream are intentionally left as `sorry` for the user to prove.
- This applies across `LRA/Operation/*`, `LRA/AlgebraicStructures/*`,
  `LRA/NumberSystems/*`, and `LRA/UniversalAlgebra/*` when work is being done
  under this Landau-satisfaction plan.
- Definitions, routers, structure declarations, placement files, and other
  non-proof scaffolding should remain sorry-free where possible.
- This policy should be read in coordination with
  `docs/algebraic-structures-repair/DECISIONS.md` D8.

### D0.20 Chunk-first orchestration

- The execution unit for plan-mode orchestration is a chunk under
  `docs/landau-satisfaction/chunks/`, not an entire phase.
- Each chunk must name:
  - the theorem band in scope
  - the algebraic-structure prerequisites by `as-*` id
  - the operator / model-theory / UA files to touch
  - the success gates to run before the chunk can be marked complete
- Chunks must be ordered so that a dropped session can resume from
  `status.md`, `ledger.json`, and the current chunk file without reconstructing
  hidden context from chat history.

## Deferred Decisions

- Whether the top-level `LANDAU-SATISFACTION-PLAN.md` should be renamed or moved
  into this workspace.
- Whether a dedicated progress prompt bundle should be added under this
  workspace, similar to `docs/p0-repair/` or `docs/algebraic-structures-repair/`.
