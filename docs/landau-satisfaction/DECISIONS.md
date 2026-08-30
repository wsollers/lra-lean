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

## Deferred Decisions

- Whether the top-level `LANDAU-SATISFACTION-PLAN.md` should be renamed or moved
  into this workspace.
- Whether Phase 2 should create operator `Interface/` subtrees immediately or
  stage them after the six-file base artifact split.
- Where mixed-operator bridges such as distributivity should live if a shared
  bridge file is introduced after Phase 2.
- Whether a dedicated progress prompt bundle should be added under this
  workspace, similar to `docs/p0-repair/` or `docs/algebraic-structures-repair/`.
