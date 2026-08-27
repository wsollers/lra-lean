# LRA/Order (and LRA/Relation) restructure — kickoff plan

Paste this as your FIRST message to Claude Code, in the `lra-lean` repo root.

---

## Context you won't have

`LRA/Order` (151 files, 380 `sorry`s today) is currently a flat, generic-only
module: `PartialOrderLaws`, `Poset`, `Lattice`, `WellOrder`, etc. are all
typeclasses/defs over an abstract `[LE R]` / `Membership Element SetObject`,
with no split between the generic interface and concrete implementations. A
prior session (`LRA/Set`) went through an analogous restructure — splitting a
generic `Interface/` layer from named `Constructions/<Impl>/` folders, each
with its own `ModelTheory` (first-order language + `Satisfies`) and
`Satisfy_*.lean` files proving that implementation satisfies the generic
theory — and that pattern is the template here. Read
`LRA/Set/Interface.lean`, `LRA/Set/Constructions/ZFCSet.lean`, and
`LRA/Set/Constructions/ZFCSet/Interface/ModelTheory/Theory.lean` before
starting, to see the target shape in a working example.

**A key correction from the first draft of this plan**: a set-theoretic
relation *is* a set of ordered pairs (`R ⊆ A × A`), not the
`Carrier → Carrier → Prop` predicate `LRA.Relation.Endorelation` currently
uses. A `Poset` is a set with a relation on it, and that relation is itself
a set — so the in-house ("CanonicalSet") constructions for `Poset`/`Lattice`/
etc. can't just be "prove some type satisfies `PartialOrderLaws`"; they have
to actually *build* a set-based relation (via `Set`'s existing `HasPairing`/
`CartesianProductOf`/`HasSeparation` machinery — see Step 2) and then build
the order structure on top of it. **`LRA/Relation` therefore has to be
restructured first**, before `Order`'s components can get real set-based
constructions — that's Step 2 below, ahead of the `Order`-specific work.

Everything downstream of `Order`/`Relation` (`AlgebraicStructures`,
`NumberSystems`, `Analysis`, `Operation`, `VolumeICore`, `VolumeVICore`) is
currently `sorry`d. **Do not spend time preserving exact backward
compatibility** — if a rename or reshape breaks an import elsewhere, fix the
import, don't design around avoiding it. This is still an
ideation/scaffolding pass, not a proof-completion pass: no theorem in this
plan needs a completed proof body. Every declaration this plan creates is
`sorry` (or a bare structural `def`/`class`/`Signature`/`structure` with no
proof obligation) — **except** the in-house constructions, which per the
correction above need to actually *construct* their example objects (that's
ordinary `def`, not a proof, so it's not a "no proof bodies" exception, just
worth flagging as real content rather than a stub).

## Ground rules

1. Do not write or complete any proof. Every new theorem gets `:= by sorry`.
   Constructions (the `def`s that build an example poset/relation/lattice)
   are not proofs and should be written for real, not stubbed.
2. **Exclude the metatheory.** No completeness, categoricity, stability,
   quantifier elimination, or finite-model-property content — not even as
   `sorry`d theorems. If it's useful context, it belongs in a doc-comment
   paragraph, never as a Lean declaration.
3. Naming: PascalCase, no snake_case, per the repo's own governance overlay
   (`docs/governance/repo-overlays/lra-lean.md` via the canonical
   `lra-governance` checkout — resolve it the same way `AGENTS.md` describes
   before doing any Lean authoring work). **One explicit, deliberately
   authorized exception**: the well-ordering axiom is named `Ax_WellOrdered`
   verbatim, even though it breaks the PascalCase convention.
4. One phase, one green `lake build` (scope the target to what you're
   touching — `LRA.Relation`/`LRA.Order`, adding a `lean_lib` in
   `lakefile.lean` if one doesn't exist yet, mirroring `LRASetCore`), one
   commit. Don't start the next phase on a red build.
5. Every new public declaration gets a doc comment with a `Logical form:`
   fenced Lean block, per the governance overlay's implementation standards.

## Target architecture

Per-component shape (not a single global split — this applies inside each
component's own folder, same as `ZFCSet` already does: `Definition.lean` +
`Laws/` + `Interface/ModelTheory/` + `Interface/UniversalAlgebra/` all live
together under `ZFCSet/`):

```
LRA/Order/Interface/<Family>/<Component>/
  Definition.lean          -- what the component is (existing content, moved)
  Theorems.lean, Relationships.lean, Characterizations.lean, Consequences.lean
                            -- existing theorem content, unchanged, moved
  Laws.lean                 -- the bundled-axiom typeclass, if this component
                              has one (co-located here now instead of a
                              separate sibling `Laws/` topic folder — see
                              Step 4)
  ModelTheory/               -- only for components in the enumeration table
    LStructure.lean
    Theory.lean
    Model.lean
  UniversalAlgebra/           -- only for the Lattice family
    Signature.lean

LRA/Order/Constructions/
  CanonicalSet/<Component>.lean   -- impl #1: literally BUILDS an example
                                     (a concrete carrier + a concrete,
                                     set-based relation from Step 2, then the
                                     proof that this construction satisfies
                                     the component's Laws/Theory)
  Mathlib/<Component>.lean        -- impl #2: extends existing Interop/Mathlib/*
```

`ModelTheory` follows Set's ZFC pattern for real: an actual `Signature`
(`LRA.Logic.Language.FirstOrder.Signature`), actual `Formula`/`Sentence`
axioms, an actual `FormulaTheory`, `Satisfies`-based model membership — not
just a typeclass. Almost none of this exists for Order today
(`AlgebraicStructures/OrderedField/Interface/ModelTheory/*` is the one
existing example of this exact pattern to copy from, alongside Set's ZFC
treatment).

`Bounds/`, `Relation/` (Order's own, distinct from top-level `LRA/Relation`
— see naming note in Step 4), `Directedness/`, `Density/`, `DiscreteOrder/`,
`Morphisms/` stay as **sibling topic folders** directly under `Interface/`
(not nested inside one component) — they're definable notions or
map-properties that cut across multiple components (Bounds applies to both
Poset and Lattice, for instance), so they don't get their own `ModelTheory`/
`UniversalAlgebra` folder. See Step 5 for the full list of what's in scope
for a model vs. what rides on top of one.

---

## Step 1 — The Set Switch (do this first; it's a hard prerequisite)

Both `Relation`'s and `Order`'s in-house constructions need one canonical
in-house set type to name concretely, without hard-coding `ZFCSet`
everywhere. This is the `abbrev Set := ZFCSet`-style rename the original
`LRA/Set` migration explicitly deferred ("Renaming `abbrev Set := ZFCSet /
TGSet / NBGSet` (shadows `_root_.Set`). Separate pass.") — now in scope.

**Naming decision, pick one before writing the file** (recommend the first):

- `LRA.Set.CanonicalSet` (safe): namespaced, only collides with Mathlib's
  `_root_.Set` in files that `open LRA.Set` *and* use bare `Set` unqualified
  in the same scope.
- `LRA.Set.Set` (literal, matches the original deferred note): real
  ambiguity risk against Mathlib's `Set` in files that `open LRA.Set` —
  common throughout `AlgebraicStructures`/`Analysis`/`NumberSystems`. Only
  take this if you're prepared to fully-qualify `_root_.Set` everywhere it's
  needed nearby.

Create `LRA/Set/CanonicalSet.lean`:

```lean
import LRA.Set.Constructions.ZFCSet

/-!
The Set Switch: one canonical in-house set implementation, named once, so
that downstream modules (Relation, Order, ...) that want "the" in-house set
type without committing to a specific construction can depend on this name
instead of `ZFCSet`/`TGSet`/`NBGSet` directly. Flip the right-hand side of
`CanonicalSet` to change which construction backs every generic in-house
consumer at once.
-/

namespace LRA.Set

abbrev CanonicalSet := LRA.Set.Constructions.ZFCSet

end LRA.Set
```

Wire it into `LRA/Set.lean` after `Constructions`. Verify with
`lake build LRA.Set` (instant — one new one-line file). Commit by itself:
`"Set: add the Set Switch (CanonicalSet := ZFCSet)"`.

**Note**: Order's and Relation's *generic* axioms/theorems should stay
generic over `[Membership Element SetObject]` wherever they already are or
naturally can be — the Switch is for naming *one concrete* implementation to
build named example/construction code against, not for making the abstract
theory itself concrete.

---

## Step 2 — Refactor `LRA/Relation` first (relation-as-a-set)

This is the actual foundation everything else in this plan builds on. A
relation on a set `A` is a subset of `A × A` — a genuine set-theoretic
object, not a bare Lean predicate. `LRA.Set.Interface` already has
everything needed to build one:

- `HasPairing`/`OrderedPair` (already exists per construction, e.g.
  `LRA/Set/Constructions/ZFCSet/Axioms/OrderedPair/Theorems.lean`) — builds
  the ordered pair `⟨x, y⟩` as a genuine set element.
- `CartesianProductOf` (`LRA/Set/Interface/CartesianProduct.lean`) — builds
  `A × A` as a genuine set, via `HasSeparation` over an ambient collection
  of pairs.
- A relation is then any `R` with `R ⊆ CartesianProductOf A A ambientPairs`
  (or, more simply for a first pass, any `R : SetObject` together with
  `⟨x, y⟩ ∈ R` as its membership condition — don't over-engineer the
  ambient-pairs plumbing before the rest of the plan needs it).

Target shape for `LRA/Relation` (151-file `Order` pattern, scaled down —
`Relation` is smaller, ~48 files, mostly `Definition.lean` + `Properties/` +
`Operations/` + `Structures/` + `Canonical/` + `Calculus/`):

```
LRA/Relation/
  Interface/
    Definition.lean          -- existing Endorelation/BinaryRelation/etc., moved verbatim
    Properties/                -- existing Reflexive/Symmetric/Transitive/etc. (from Relation/Properties/), moved
    Operations/                 -- existing Closure/Composition/Converse (from Relation/Operations/), moved
    Structures/                  -- existing Equivalence/PartialFunction (from Relation/Structures/), moved
    Canonical/                    -- existing DiversityRelation/EmptyRelation/etc., moved
    Calculus/                      -- existing, moved
  Constructions/
    CanonicalSet/
      SetRelation.lean          -- NEW: `SetRelation (A : CanonicalSet) := {R : CanonicalSet // ...}`
                                    or equivalent — a genuine set of ordered
                                    pairs over `CanonicalSet`, built via
                                    `OrderedPair`/`CartesianProductOf`/
                                    `HasSeparation`. Include the bridge
                                    theorem: `fun x y => ⟨x,y⟩ ∈ R` *is* an
                                    `Endorelation Element` (so everything
                                    downstream that expects the old
                                    predicate-shaped relation still has a
                                    way to get one out of a `SetRelation`).
    Mathlib/
      SetRelation.lean          -- NEW: the parallel construction using
                                    Mathlib's native `Set (Carrier × Carrier)`
                                    (not `Rel`/`α → α → Prop` — Mathlib's own
                                    `Rel` is just `α → β → Prop`, same
                                    predicate shape as `Endorelation`, so it
                                    doesn't give you a second, genuinely
                                    different "relation is a set" impl; a
                                    `Set (Carrier × Carrier)` does).
```

Update `LRA/Relation.lean` to import `Interface` + `Constructions`. This is
its own phase: verify with a scoped build (add a `lean_lib` for `Relation`
in `lakefile.lean` if there isn't one), commit by itself.

**Report back to the user before moving on to `Order`** — this is the
biggest single design decision in the whole plan (how a set-based relation
is represented) and everything else downstream depends on getting the shape
right.

---

## Step 3 — Rename the existing `Order/Constructions/` (name collision)

`LRA/Order/Constructions/{LexicographicOrder,ProductOrder,
StrictNonStrictCorrespondence}` already exists today, but means something
different from what this plan means by "Constructions" — it's *order
combinators* (build a new order from two existing ones), not *concrete
implementations satisfying the generic theory*. Rename before creating the
new one:

- `LRA/Order/Constructions/` → `LRA/Order/Interface/Combinators/` (all three
  subfolders move as-is — generic/carrier-agnostic content).
- `LRA/Order/Constructions.lean` → delete, fold its three imports into a new
  `LRA/Order/Interface/Combinators.lean` barrel.
- Fix the one real external import:
  `LRA/Order/Directedness/Directed/Theorems.lean` imports
  `LRA.Order.Constructions.ProductOrder.Definition` → repoint to
  `LRA.Order.Interface.Combinators.ProductOrder.Definition`.
- `grep -rn "Order\.Constructions\." LRA` afterward should return nothing
  outside the new `Interface/Combinators/` tree.

Verify, commit by itself.

---

## Step 4 — Move the rest of `Order` under `Interface/`, co-locating `Laws/`

Two things happen in this step, both mechanical:

1. Everything currently flat under `LRA/Order/{OrderedSets,Lattices,Bounds,
   Relation,Density,Directedness,DiscreteOrder,Morphisms}/**` moves under
   `LRA/Order/Interface/`, preserving relative paths (e.g.
   `Order/OrderedSets/Poset/Definition.lean` →
   `Order/Interface/OrderedSets/Poset/Definition.lean`).
   (Note: `Order/Relation/*` here is Order's own small relation-property
   folder — `Comparable`, `CoverRelation`, `Adjacent`, etc. — distinct from
   the top-level `LRA/Relation` restructured in Step 2. Consider renaming
   Order's copy to `Order/Interface/RelationProperties/` if the two names
   sitting side by side in the same barrel is confusing; not required.)
2. **`LRA/Order/Laws/{LinearOrder,OperationCompatibility,PartialOrder,
   StrictOrderCompatibility}/Definition.lean` co-locate into their matching
   component instead of moving to a sibling `Interface/Laws/` folder**:
   - `Laws/PartialOrder/Definition.lean` (has `PartialOrderLaws`) →
     `Interface/OrderedSets/PartialOrder/Laws.lean`
   - `Laws/LinearOrder/Definition.lean` → `Interface/OrderedSets/LinearOrder/Laws.lean`
   - `Laws/StrictOrderCompatibility/Definition.lean` →
     `Interface/OrderedSets/StrictOrder/Laws.lean` (check the actual
     dependency — this might belong with `StrictOrder` or `StrictPoset`,
     confirm against what it's actually stated over before moving)
   - `Laws/OperationCompatibility/*` → doesn't cleanly belong to one
     `OrderedSets` component (it's about `+`/`*` respecting an order, i.e.
     ordered-algebra territory) — leave as a sibling
     `Interface/OperationCompatibility/` topic folder rather than forcing
     it into a component that doesn't own it.

`LRA/Order/Interop/Mathlib/*` and `LRA/Order/Interop/AlgebraicLattice.lean`
move to `LRA/Order/Constructions/Mathlib/*` and
`LRA/Order/Constructions/AlgebraicStructures/*` — this content is *already*
concrete-implementation-satisfies-generic-theory work (`PosetFromPartialOrder`,
`toMathlibLinearOrder`, `AlgebraicLatticeJoinOrderIsOrderLattice`), just
under the wrong top-level name today.

`LRA/Order/Examples.lean` and `LRA/Order/FailureModes.lean` stay where they
are.

Rewrite `LRA/Order.lean` to import `Interface` + `Constructions`. Verify,
commit by itself.

---

## Step 5 — Component enumeration (fill in over later sessions)

Each row needs: (a) `ModelTheory/{LStructure,Theory,Model}.lean` inside the
component's own folder (real `Signature`/`Formula`/`Sentence`/
`FormulaTheory`), and (b) two constructions — one under
`Constructions/CanonicalSet/`, one under `Constructions/Mathlib/` — each of
which **builds an actual example** (a concrete poset/lattice/order on a
concrete carrier, using Step 2's `SetRelation` for the CanonicalSet side),
not just a satisfaction instance for an externally-given type.

| Component | Signature shape | Existing generic def |
|---|---|---|
| Preorder | relational `{≤}` | `Interface/OrderedSets/Preorder/Definition.lean` |
| PartialOrder / Poset | relational `{≤}` | `Interface/OrderedSets/{PartialOrder,Poset}/Definition.lean` |
| StrictOrder / StrictPoset | relational `{<}` | `Interface/OrderedSets/{StrictOrder,StrictPoset}/Definition.lean` |
| LinearOrder | relational `{≤}` + totality | `Interface/OrderedSets/LinearOrder/Definition.lean` |
| StrictLinearOrder | relational `{<}` + trichotomy | `Interface/OrderedSets/StrictLinearOrder/Definition.lean` |
| WellOrder | relational `{≤}` + Membership | `Interface/OrderedSets/WellOrder/Definition.lean` — `Ax_WellOrdered` attaches here (Step 6) |
| DenseOrder / DenseLinearOrder | relational `{<}` + density sentence | `Interface/Density/*/Definition.lean` |
| DiscreteOrder | relational `{<}` + discreteness sentence | `Interface/DiscreteOrder/Definition.lean` |
| JoinSemilattice | algebraic `{∨}` | `Interface/Lattices/JoinSemilattice/Definition.lean` |
| MeetSemilattice | algebraic `{∧}` | `Interface/Lattices/MeetSemilattice/Definition.lean` |
| Lattice | algebraic `{∨,∧}` *and* relational `{≤}` (prove equivalent) | `Interface/Lattices/Lattice/Definition.lean` |
| BoundedLattice | algebraic `{∨,∧,0,1}` | `LRA/AlgebraicStructures/BoundedLattice/Definition.lean` (reuse, don't duplicate) |
| DistributiveLattice | algebraic `{∨,∧}` + distributive sentence | `Interface/Lattices/DistributiveLattice/Definition.lean` |
| CompleteLattice | relational `{≤}` + Membership (arbitrary-subset join/meet) | `Interface/Lattices/CompleteLattice/Definition.lean` |

Not their own component — definable formulas riding on a parent's language,
or sibling topic folders (per Target architecture above): `Bounds/*`
(`UpperBound`/`Supremum`/`GreatestElement`/... — all Poset/Lattice-language
definable), `Interface/RelationProperties/*` (née `Order/Relation/*` —
`Comparable`/`CoverRelation`/...), `Directedness/*` (`Directed`/`Chain`).

Not a new signature either — properties of *maps between* two models of the
same theory, do as a fast-follow once components have models:
`Morphisms/*` (`Monotone`/`Antitone`/`OrderEmbedding`/`OrderIsomorphism`),
and the combinators from Step 3 (`Interface/Combinators/*`).

Universal algebra: wire `LatticeLaws`/`BoundedLattice`/`BooleanAlgebra` into
`LRA.UniversalAlgebra`'s actual `Signature`/`Algebra`/`Satisfaction`
framework (`LRA/UniversalAlgebra/*` — not `LRA.Identity.Interface.
UniversalAlgebra`, the smaller module Set used) once `Lattice`'s algebraic
signature exists.

---

## Step 6 — `Ax_WellOrdered`

Once `WellOrder`'s `ModelTheory` exists:

```lean
/-- Every carrier with a generic-Set membership structure admits some
relation that well-orders it. Asserted as a primitive axiom (classically
equivalent to Choice, but not derived from it here). -/
axiom Ax_WellOrdered
    {Element : Type u} (SetObject : Type v) [Membership Element SetObject] :
    ∃ relation : LRA.Relation.Endorelation Element, WellOrder SetObject relation
```

(Adjust to whatever `WellOrder`'s final signature looks like after Step 5 —
this is the shape, not necessarily the final types.) Follow-on, not
required for this pass: a `theorem` (not a second axiom) showing
`Ax_WellOrdered` restricted to `CanonicalSet` follows from `ZFCSet`'s
existing `choiceFormula` axiom.

---

## Verification

- Steps 1–4 are pure reorganization (plus Step 2's one new construction) —
  each its own commit, gated on a green build, in order. Lowest risk, do
  them fast; Step 2 is the one to slow down on and confirm the design before
  continuing, per the note at the end of that step.
- Step 5 is per-component from here — treat each row of the table as its
  own phase (own build, own commit). Don't try to do all fourteen at once.
- `Ax_WellOrdered` (Step 6) is its own commit, after `WellOrder`'s model
  exists.
- Sorry count in `Order/`: baseline 380 today (unaffected by `Relation/`'s
  own count, track separately). Every phase should only ever *increase* it
  (new `sorry`d theorems) or leave it flat (pure moves) — never decrease it.
  Report before/after per phase, same as the Set migration's commits did.
