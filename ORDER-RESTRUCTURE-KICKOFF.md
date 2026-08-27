# LRA/Order restructure — kickoff plan

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

Everything downstream of `Order` (`AlgebraicStructures`, `NumberSystems`,
`Analysis`, `Operation`, `VolumeICore`, `VolumeVICore`) is currently `sorry`d.
**Do not spend time preserving exact backward compatibility** — if a rename
or reshape breaks an import elsewhere, fix the import, don't design around
avoiding it. This is still an ideation/scaffolding pass, not a
proof-completion pass: no theorem in this plan needs a completed proof body.
Every declaration this plan creates is `sorry` (or a bare structural
`def`/`class`/`Signature` with no proof obligation).

## Ground rules

1. Do not write or complete any proof. Every new theorem gets `:= by sorry`.
2. **Exclude the metatheory.** No completeness, categoricity, stability,
   quantifier elimination, or finite-model-property content — not even as
   `sorry`d theorems. If it's useful context, it belongs in a doc-comment
   paragraph, never as a Lean declaration. (This was deliberately scoped out
   after review of a full model-theoretic write-up for Poset and Lattice —
   the write-up's syntax/semantics/axiomatization/definability sections are
   in scope; its classification-theoretic section is not.)
3. Naming: PascalCase, no snake_case, per the repo's own governance overlay
   (`docs/governance/repo-overlays/lra-lean.md` via the canonical
   `lra-governance` checkout — resolve it the same way `AGENTS.md` describes
   before doing any Lean authoring work). **One explicit, deliberately
   authorized exception**: the well-ordering axiom is named `Ax_WellOrdered`
   verbatim, even though it breaks the PascalCase convention — this was a
   direct, considered instruction, don't "fix" it.
4. One phase, one `lake build LRA.Order` (or whatever the scoped target ends
   up being — check `lakefile.lean` for whether `Order` has its own
   `lean_lib` target; add one if not, mirroring `LRASetCore`), one commit.
   Don't start the next phase on a red build.
5. Every new public declaration gets a doc comment with a `Logical form:`
   fenced Lean block, per the governance overlay's implementation standards
   (same rule Set followed).

## Target architecture

For each order-theoretic "component" (see the table below), the eventual
shape is:

```
LRA/Order/Interface/<Component>/
  Definition.lean          -- the existing generic def/class, moved here verbatim
  ModelTheory/
    LStructure.lean         -- the signature (relational and/or algebraic)
    Theory.lean              -- the sentence(s)/FormulaTheory
    Model.lean               -- generic L-structure-from-typeclass glue, if needed
LRA/Order/Constructions/
  CanonicalSet/<Component>/Satisfy.lean   -- impl #1: built on the Set Switch (below)
  Mathlib/<Component>/Satisfy.lean        -- impl #2: extends Interop/Mathlib/*
```

`ModelTheory` here follows Set's ZFC pattern for real: an actual
`Signature` (`LRA.Logic.Language.FirstOrder.Signature`), actual
`Formula`/`Sentence` axioms, an actual `FormulaTheory`, and `Satisfies`-based
model membership — not just a typeclass. That's new work; almost none of it
exists for Order today (`AlgebraicStructures/OrderedField/Interface/ModelTheory/*`
is the one existing example of this exact pattern to copy from, alongside
Set's ZFC treatment).

---

## Step 1 — The Set Switch (do this first; it's a hard prerequisite)

Order's in-house constructions need one canonical in-house set type to name
concretely (the "impl #1" backing for every component), without hard-coding
`ZFCSet` everywhere and without having to re-litigate the choice later. This
is the `abbrev Set := ZFCSet`-style rename that the original `LRA/Set`
migration explicitly deferred (see its own instructions: "Renaming `abbrev
Set := ZFCSet / TGSet / NBGSet` (shadows `_root_.Set`). Separate pass.") —
that deferred item is now in scope, because Order needs it.

**Naming decision, pick one before writing the file** (I recommend the first):

- `LRA.Set.CanonicalSet` (safe): namespaced, so it only collides with
  Mathlib's `_root_.Set` in files that `open LRA.Set` *and* use bare `Set`
  unqualified in the same scope — much rarer than a bare top-level `Set`
  alias, and avoids the exact hazard the original deferred note flagged.
- `LRA.Set.Set` (literal, matches the original deferred note's exact
  intended name): real ambiguity risk in any file that both `open LRA.Set`
  and references Mathlib's `Set` unqualified — which is common
  (`Set R`, `∈ Set`, etc. show up throughout `AlgebraicStructures`,
  `Analysis`, `NumberSystems`). Only take this if you're prepared to
  fully-qualify `_root_.Set` at every call site that needs it.

Create `LRA/Set/CanonicalSet.lean` (or `LRA/Set/Switch.lean` — pick one,
it's the file this whole plan calls "the Set Switch"):

```lean
import LRA.Set.Constructions.ZFCSet

/-!
The Set Switch: one canonical in-house set implementation, named once, so
that downstream modules (starting with `Order`) that want "the" in-house
set type without committing to a specific construction can depend on this
name instead of `ZFCSet`/`TGSet`/`NBGSet` directly. Flip the right-hand side
of `CanonicalSet` to change which construction backs every generic in-house
consumer at once.
-/

namespace LRA.Set

abbrev CanonicalSet := LRA.Set.Constructions.ZFCSet

end LRA.Set
```

Wire it into `LRA/Set.lean` (the root barrel) after `Constructions`. Verify
with `lake build LRA.Set` (should be instant — one new one-line file).
Commit by itself: `"Set: add the Set Switch (CanonicalSet := ZFCSet)"`.

**Note**: per the earlier discussion, Order's *generic* axioms/theorems
should stay generic over `[Membership Element SetObject]` (not hard-coded to
`CanonicalSet`) wherever they already are or naturally can be — the Switch
is for naming *one concrete* implementation to build named example/impl code
against, not for making the abstract theory itself concrete. Any type in
`LRA.Set.Constructions.*` that already satisfies the needed typeclasses
(`Membership`, `HasSubset`, `HasCollectionUnion`, ...) automatically
satisfies Order's generic theorems for free — `CanonicalSet` is just which
one gets a name and worked examples.

---

## Step 2 — Rename the existing `Order/Constructions/` (name collision)

`LRA/Order/Constructions/{LexicographicOrder,ProductOrder,
StrictNonStrictCorrespondence}` already exists today, but means something
different from what this plan means by "Constructions" — it's *order
combinators* (build a new order from two existing ones), not *concrete
implementations satisfying the generic theory*. Rename the existing folder
before creating the new one, to avoid the collision:

- `LRA/Order/Constructions/` → `LRA/Order/Interface/Combinators/`
  (all three subfolders move as-is; it's generic/carrier-agnostic content,
  so it belongs under `Interface/` in the target architecture anyway).
- Update `LRA/Order/Constructions.lean` → delete it, fold its three imports
  into a new `LRA/Order/Interface/Combinators.lean` barrel instead.
- Fix the one real external import:
  `LRA/Order/Directedness/Directed/Theorems.lean` imports
  `LRA.Order.Constructions.ProductOrder.Definition` → repoint to
  `LRA.Order.Interface.Combinators.ProductOrder.Definition`.
- `grep -rn "Order\.Constructions\." LRA` afterward should return nothing
  outside the new `Interface/Combinators/` tree itself.

Verify (`lake build LRA.Order` or whatever target you set up in Step 0
below), commit by itself.

---

## Step 3 — Move the rest of the flat tree under `Interface/`

Rule, not a file-by-file list (it's mechanical): everything currently flat
under `LRA/Order/{OrderedSets,Lattices,Bounds,Relation,Density,Directedness,
DiscreteOrder,Laws,Morphisms}/**` is generic/carrier-agnostic content — move
it under `LRA/Order/Interface/`, preserving every relative path exactly
(e.g. `Order/OrderedSets/Poset/Definition.lean` →
`Order/Interface/OrderedSets/Poset/Definition.lean`). Update every `import
LRA.Order.X` to `import LRA.Order.Interface.X` for the moved paths (a
mechanical `grep -rl` + sed-style pass; this is exactly the kind of move
Phase 3 of the Set migration did for its Satisfy_Generic instances — same
technique, just import-path surgery instead of instance-block surgery this
time). `LRA/Order/Examples.lean` and `LRA/Order/FailureModes.lean` stay
where they are (matches the "opt-in layers" pattern from `LRA/Interop`, not
part of the Interface/Constructions split).

`LRA/Order/Interop/Mathlib/*` and `LRA/Order/Interop/AlgebraicLattice.lean`
move to `LRA/Order/Constructions/Mathlib/*` and
`LRA/Order/Constructions/AlgebraicStructures/*` respectively — this content
is *already* concrete-implementation-satisfies-generic-theory work (that's
what `PosetFromPartialOrder`, `toMathlibLinearOrder`,
`AlgebraicLatticeJoinOrderIsOrderLattice` all are), it's just sitting under
the wrong top-level name today.

Rewrite `LRA/Order.lean` to import the new top-level shape:
`Interface` (barrel importing everything moved above), `Constructions`
(barrel importing `Mathlib` + `AlgebraicStructures`, growing to include
`CanonicalSet` as components get built out).

Verify, commit by itself.

---

## Step 4 — Component enumeration (fill in over later sessions)

This is the checklist "each would need a model and the 2 impls" maps to.
Each row needs: (a) an `Interface/<Component>/ModelTheory/{LStructure,
Theory,Model}.lean` (real `Signature`/`Formula`/`Sentence`/`FormulaTheory`,
not just a typeclass), and (b) two `Satisfy.lean` files — one under
`Constructions/CanonicalSet/<Component>/`, one under
`Constructions/Mathlib/<Component>/`. Do not start a component's model
without first checking whether its existing generic def already exists (all
of column 2 already exists in some form in the current tree; the work is
adding the FOL layer + the two satisfiers, not inventing the math).

| Component | Signature shape | Existing generic def (source of truth for the theory) |
|---|---|---|
| Preorder | relational `{≤}` | `Order/OrderedSets/Preorder/Definition.lean` |
| PartialOrder / Poset | relational `{≤}` | `Order/OrderedSets/{PartialOrder,Poset}/Definition.lean` |
| StrictOrder / StrictPoset | relational `{<}` | `Order/OrderedSets/{StrictOrder,StrictPoset}/Definition.lean` |
| LinearOrder | relational `{≤}` + totality | `Order/OrderedSets/LinearOrder/Definition.lean` |
| StrictLinearOrder | relational `{<}` + trichotomy | `Order/OrderedSets/StrictLinearOrder/Definition.lean` |
| WellOrder | relational `{≤}` + Membership | `Order/OrderedSets/WellOrder/Definition.lean` — this is also where `Ax_WellOrdered` attaches (see Step 5) |
| DenseOrder / DenseLinearOrder | relational `{<}` + density sentence | `Order/Density/*/Definition.lean` |
| DiscreteOrder | relational `{<}` + discreteness sentence | `Order/DiscreteOrder/Definition.lean` |
| JoinSemilattice | algebraic `{∨}` | `Order/Lattices/JoinSemilattice/Definition.lean` |
| MeetSemilattice | algebraic `{∧}` | `Order/Lattices/MeetSemilattice/Definition.lean` |
| Lattice | algebraic `{∨,∧}` *and* relational `{≤}` (prove equivalent, per the definitional-equivalence write-up) | `Order/Lattices/Lattice/Definition.lean` |
| BoundedLattice | algebraic `{∨,∧,0,1}` | `LRA/AlgebraicStructures/BoundedLattice/Definition.lean` (already exists outside Order — reuse, don't duplicate) |
| DistributiveLattice | algebraic `{∨,∧}` + distributive sentence | `Order/Lattices/DistributiveLattice/Definition.lean` |
| CompleteLattice | relational `{≤}` + Membership (arbitrary-subset join/meet, not just binary) | `Order/Lattices/CompleteLattice/Definition.lean` |

Not their own component (definable formulas riding on a parent's language,
per the write-up's §4/§5 — do these as a definability pass once a handful of
the core components above have real models, not as separate signatures):
`UpperBound`/`LowerBound`/`Supremum`/`Infimum`/`GreatestElement`/
`LeastElement`/`MaximalElement`/`MinimalElement`/`TopElement`/`BottomElement`/
`Bounded*`/`Cofinal`/`Coinitial` (all of `Order/Bounds/*`), `Comparable`/
`CoverRelation`/`Adjacent`/`UpperCover`/`LowerCover` (`Order/Relation/*`),
`Directed`/`Chain` (`Order/Directedness/*`).

Not a new signature either — these are properties of *maps between* two
models of the same theory, do them as a fast-follow once components have
models: `Monotone`/`Antitone`/`OrderEmbedding`/`OrderIsomorphism`
(`Order/Morphisms/*`), and the combinators from Step 2
(`Order/Interface/Combinators/*` — "if A and B are Posets, `Lex(A,B)`/
`Product(A,B)` is a Poset" becomes a theorem once Poset has a real model).

Universal algebra: wire `LatticeLaws`/`BoundedLattice`/`BooleanAlgebra`
into `LRA.UniversalAlgebra`'s actual `Signature`/`Algebra`/`Satisfaction`
framework (the mature one, `LRA/UniversalAlgebra/*` — not
`LRA.Identity.Interface.UniversalAlgebra`, which is the smaller module Set
used and is the wrong fit here), once `Lattice`'s algebraic signature exists
from the table above.

---

## Step 5 — `Ax_WellOrdered`

Once `WellOrder`'s `ModelTheory` exists (table above), add the axiom itself
— the actual Well-Ordering Theorem, asserted as a primitive rather than
derived:

```lean
/-- Every carrier with a generic-Set membership structure admits some
relation that well-orders it. Asserted as a primitive axiom (classically
equivalent to Choice, but not derived from it here). -/
axiom Ax_WellOrdered
    {Element : Type u} (SetObject : Type v) [Membership Element SetObject] :
    ∃ relation : LRA.Relation.Endorelation Element, WellOrder SetObject relation
```

(Adjust the exact statement to whatever `WellOrder`'s final signature looks
like after Step 4 — this is the shape, not necessarily the final types.)
Follow-on, not required for this pass: a `theorem` (not a second axiom)
showing `Ax_WellOrdered` restricted to `CanonicalSet` follows from
`ZFCSet`'s existing `choiceFormula` axiom — good consistency evidence once
the rest is in place.

---

## Verification

- Set Switch, the Constructions rename, and the Interface move (Steps 1–3)
  should each be their own commit, gated on a green build, in that order —
  they're pure reorganization, zero new math, lowest risk, do them fast.
- Step 4 is per-component from here — treat each row of the table as its
  own phase (own build, own commit), same discipline as the Set migration.
  Don't try to do all fourteen in one pass.
- `Ax_WellOrdered` (Step 5) is its own commit, after `WellOrder`'s model
  exists.
- Sorry count in `Order/`: baseline 380 today. Every phase should only ever
  *increase* it (new `sorry`d theorems from new models) or leave it flat
  (pure moves) — never decrease it, since no proof is being completed in
  this pass. Report the before/after count per phase, same as the Set
  migration's commit messages did.
