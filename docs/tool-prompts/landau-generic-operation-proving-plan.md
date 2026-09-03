# Prompt: Plan Generic (Universal-Algebra) Proving for Landau's Theorems

You are working in the `lra-lean` repository.

## Current repo constraints

- Do not run `lake build` unless a specific step below requires it.
- Do not run validator execution as a success gate.
- Do not propose compatibility shims, legacy aliases, or temporary bridge files.
- Do not change any mathematics, definitions, or proofs — **this is a planning
  task only**. No `.lean` file should be edited as part of this prompt.
- See `docs/tool-prompts/README.md` for the folder-wide constraints and known
  broken-import state at time of writing.

## Why this prompt exists

Landau's *Foundations of Analysis* proves the same shape of theorem
(associativity, commutativity, distributivity, order compatibility, ...) by
hand at every stage of the number tower (ℕ → ℤ → ℚ → ℝ → ℂ). The project
already decided — see the design history below — that this repetition should
be replaced by: (1) a small number of **generic transport theorems** proved
once at the `Signature`/`Model`/`Equation` level, plus (2) a standardized
**cert-naming convention** so each concrete number system just *cites* that
its carrier and operations satisfy the relevant generic theorem, rather than
re-deriving the law by hand. That decision was made in a separate design arc
and has not yet been executed against the actual Landau theorem list. This
prompt is the handoff to do that: survey what exists, survey what Landau
requires, and produce a concrete plan to close the gap.

## Documents to read, in this order

1. **`docs/architecture/repository-architecture.md`** and
   **`docs/standards/lean-standards.md`** — overall repo intent, the
   `namespace Landau` convention for legacy arithmetic work, and the source and
   doc-comment policy that governs theorem citations and display names.
2. **`docs/interface-model-standardization-inventory.md`** — current state of
   interface/model standardization across the repo; relevant because the
   generic transport-theorem approach is itself an interface-standardization
   move.
3. **`docs/foundations/00-index.md`** — index and governing chain for the
   full foundational-interludes doc arc. Read the whole arc, but the load-bearing
   files for this task are:
   - `docs/foundations/06-operations.md` §6.7.3 — the corrected, current
     machinery description (points at real `SatisfiesEquation`/`IsVariety`,
     not a discarded bespoke type).
   - `docs/foundations/06a-satisfaction-certificates.md` — the worked cert
     tree for ℕ, ℤ, ℚ, ℝ using the standardized naming.
   - `docs/foundations/06b-model-theory-boundary.md` — the equational vs.
     relational scope boundary (why trichotomy and order-type theorems do
     **not** fit the equational `Law`/`Equation` template and must route
     through `Logic.Signature/Model` instead).
   - `docs/foundations/07-algebraic-structures.md` — the Magma → ... → Field
     hierarchy and the ℕ/ℤ/ℚ/ℝ/ℂ instantiation table certs should plug into.
   - `docs/foundations/12-audit-corrections.md` and
     `docs/foundations/13-audit-round-2.md` — what a real repo audit already
     confirmed exists vs. is genuinely missing (notably: the product-side and
     quotient-side transport theorems themselves are **not yet built**, only
     the underlying `productModel`/`piModel`/`quotientProjectionIsHomomorphism`
     constructions are).
   - `docs/foundations/16-landau-cert-naming-history.md` — the reasoning
     trail and the binding cert-naming convention (`Cert_⟨Carrier⟩_⟨Operator⟩_⟨Law⟩`,
     `StructCert_⟨Carrier⟩_⟨StructureName⟩`, `Cert_..._via_⟨TransportTheorem⟩`),
     plus the binding rule that a `StructCert_*` must be a bare conjunction of
     citations, never a restated equation.
4. **`LANDAU-THEOREMS.md`** (repo root) — the full ordered checklist of
   Landau's 301 theorems across Chapters I–V (axioms deliberately excluded;
   they're covered by the Peano-system formalization directly).
5. **`LANDAU-CROSSWALK.md`** (repo root) — Chapter I (Theorems 1–36) mapped to
   their current Lean declarations and proof status. **Currently Chapter I
   only** — Chapters II–V (Fractions, Cuts, Real Numbers, Complex Numbers) are
   not yet surveyed against Lean; part of this task's job is deciding whether/how
   to extend this file.
6. Real Lean source for the generic machinery:
   - `LRA/UniversalAlgebra/Satisfaction/Definition.lean` (and `Consequences.lean`)
     — `Equation`, `SatisfiesEquation`, `EquationalTheory`,
     `ModelsOfEquationalTheory`, `IsVariety`.
   - `LRA/UniversalAlgebra/Product/Definition.lean`, `Consequences.lean` —
     `productModel`/`piModel`.
   - `LRA/UniversalAlgebra/Quotient/Definition.lean`, `Consequences.lean`,
     `RepresentativeCompatibility.lean` — quotient construction and
     `quotientProjectionIsHomomorphism`.
   - `LRA/UniversalAlgebra/Congruence/*`, `LRA/UniversalAlgebra/Homomorphism/*`
     — supporting machinery the transport theorems would build on.
7. Real Lean source for the concrete, currently-duplicated-by-hand layer:
   - `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/**` — the book's
     own construction (Carrier, Laws, Operations/{Addition,Multiplication,
     Exponentiation,Builders}, WellFoundedness).
   - `LRA/NumberSystems/PeanoSystem/Theorems/Successor.lean`,
     `Predecessor.lean` — the generic-over-any-PeanoSystem consequences
     (already a working example of "prove once against the interface, cite
     for every model" — but note these are still `sorry`).
   - `LRA/NumberSystems/WholeNumbers/Constructions/Landau/**` — the reused
     Landau construction for integers, including the misfiled
     `well_ordering` (Theorem 27) noted in `LANDAU-CROSSWALK.md`.
   - `LRA/AlgebraicStructures/**` — the existing Magma/Semigroup/Monoid/
     Group/.../Field hierarchy that `StructCert_*` bundlers should compose
     from, per the naming convention.
   - `LRA/Operation/Laws/**` (e.g. `Cancellation/`) — generic operation-law
     definitions that exist but, per `LANDAU-CROSSWALK.md`, are not yet
     instantiated against any concrete Landau carrier.

## Task

1. **Survey.** Confirm the current state of the generic machinery (item 6
   above) against what the foundations docs claim: is `SatisfiesEquation`/
   `IsVariety` still sorry-free (per `06b-model-theory-boundary.md`, "one
   `sorry` from complete" at time of writing)? Do the product/quotient
   transport theorems described in `12-audit-corrections.md` as "confirmed
   missing" still not exist? Report drift from the docs if any is found.
2. **Survey.** Using `LANDAU-THEOREMS.md` and `LANDAU-CROSSWALK.md` as the
   source of truth for what Landau requires, extend the crosswalk survey to
   Chapters II–V (Fractions/ℚ, Cuts/ℝ, Real Numbers/ℝ, Complex Numbers/ℂ) at
   least at a coarse level: for each chapter, which existing Lean construction
   (`RationalNumbers/Constructions/RationalQuotientFractions`,
   `RealNumbers/Constructions/Dedekind`, `ComplexNumbers/Constructions/OrderedPairs`,
   or others) is the natural target, and roughly how many of that chapter's
   theorems are law-shaped (commutativity/associativity/distributivity —
   equational, transport-theorem-eligible) versus order/relational-shaped
   (trichotomy, completeness, triangle-inequality-style — must route through
   `Logic.Signature/Model` per `06b-model-theory-boundary.md`, not the
   equational fragment). This does not need theorem-by-theorem precision like
   Chapter I's crosswalk — a chapter-level estimate is enough to size the plan.
3. **Plan.** Produce a concrete, ordered plan — not code — for closing the
   gap between "Landau's theorems" and "generically proved, cert-cited Lean
   declarations", consistent with the architecture already decided in the
   foundations docs. The plan must:
   - Specify the exact statement and location of the missing product-side and
     quotient-side transport theorems (which file/namespace they belong in,
     what they should be named, and their precise type signature against
     `SatisfiesEquation`/`IsVariety`), since these are the one piece of
     the original design confirmed to be real, unclaimed work.
   - For each Chapter I theorem currently `sorry` or unmatched in
     `LANDAU-CROSSWALK.md`, state whether it should become (a) a direct proof
     against the `Landau` carrier, (b) a `Cert_*` obtained via one of the
     transport theorems, or (c) a consequence that doesn't need its own named
     lemma at all (e.g. trivial via `congrArg` per Theorem 1) — and justify
     briefly using the equational/relational boundary from `06b`.
   - Propose the `Cert_*`/`StructCert_*` names each surviving lemma should
     carry, following the naming convention in `16-landau-cert-naming-history.md`
     exactly (including the "`StructCert_*` must be a bare conjunction of
     citations" rule).
   - Sequence the work: what must be proved first (e.g. the transport
     theorems and the Peano-generic successor/predecessor theorems are
     currently blocking dependencies for most of Chapter I) before later
     items become citable rather than hand-proved.
   - Note where the plan would fix a misfiling (e.g. Theorem 27's
     `well_ordering` living under `WholeNumbers` instead of `NaturalNumbers`)
     without silently folding that fix into unrelated work.
   - Flag anywhere the plan would require deviating from
     `docs/foundations/*` as currently written, and say why.
4. **Do not implement.** Stop at the plan. If asked to continue into
   implementation afterward, that is a separate, explicit follow-up request.

## Required output

A single markdown document (suggested location: `LANDAU-SATISFACTION-PLAN.md`
at repo root, alongside `LANDAU-THEOREMS.md` and `LANDAU-CROSSWALK.md`)
containing:

- The survey findings from steps 1–2 (brief; this is not the main deliverable).
- The ordered plan from step 3, in enough detail that a future session could
  execute it item-by-item without re-deriving the design reasoning.
- An explicit list of open questions or decisions that need a human call
  before implementation starts (naming disputes, scope calls on Chapters
  II–V, anything the source docs left ambiguous).
