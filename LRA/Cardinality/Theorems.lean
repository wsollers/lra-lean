-- LRA/Cardinality/Theorems.lean
-- Theorems about Equinumerous and Dominates alone: the general
-- cardinality-comparison machinery every other concept in this subject
-- is built from.

import LRA.Cardinality.Definition

namespace LRA.Cardinality

universe u v w

/-!
Volume I label: cardinality-theorems
Lean module: LRA.Cardinality.Theorems
Verification status: statements accepted; proofs pending

`Equinumerous` relates *types*, not elements of a fixed type, so it is
not literally an instance of this repository's `LRA.Relation`
equivalence-structure machinery (that machinery is for `α → α → Prop`
at one `α`; here the two sides can live in different universes). The
three equivalence-style facts are stated separately instead, the same
way Mathlib states `Equiv.refl`/`Equiv.symm`/`Equiv.trans` rather than
bundling `Type`-valued equinumerosity into a single `Equivalence`
term.

`CantorSchroederBernstein` and `CantorTheorem` are the two named
theorems of the subject; everything else here is the supporting
preorder/equivalence algebra they and `Properties/` are built from.
-/

/-- **[Theorem — EquinumerousReflexive]**

Every type is equinumerous with itself, via the identity function.

Logical form:

```lean
theorem EquinumerousReflexive (A : Type u) : Equinumerous A A
```
-/
theorem EquinumerousReflexive (A : Type u) : Equinumerous A A := by
  sorry

/-- **[Theorem — EquinumerousSymmetric]**

Equinumerosity is symmetric: a bijection's inverse is a bijection the
other way.

Logical form:

```lean
theorem EquinumerousSymmetric (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : Equinumerous B A
```
-/
theorem EquinumerousSymmetric (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : Equinumerous B A := by
  sorry

/-- **[Theorem — EquinumerousTransitive]**

Equinumerosity is transitive: bijections compose.

Logical form:

```lean
theorem EquinumerousTransitive (A : Type u) (B : Type v) (C : Type w)
    (firstEquinumerous : Equinumerous A B)
    (secondEquinumerous : Equinumerous B C) : Equinumerous A C
```
-/
theorem EquinumerousTransitive (A : Type u) (B : Type v) (C : Type w)
    (firstEquinumerous : Equinumerous A B)
    (secondEquinumerous : Equinumerous B C) : Equinumerous A C := by
  sorry

/-- **[Theorem — DominatesReflexive]**

Every type is dominated by itself, via the identity function.

Logical form:

```lean
theorem DominatesReflexive (A : Type u) : Dominates A A
```
-/
theorem DominatesReflexive (A : Type u) : Dominates A A := by
  sorry

/-- **[Theorem — DominatesTransitive]**

Domination is transitive: injections compose.

Logical form:

```lean
theorem DominatesTransitive (A : Type u) (B : Type v) (C : Type w)
    (firstDominates : Dominates A B)
    (secondDominates : Dominates B C) : Dominates A C
```
-/
theorem DominatesTransitive (A : Type u) (B : Type v) (C : Type w)
    (firstDominates : Dominates A B)
    (secondDominates : Dominates B C) : Dominates A C := by
  sorry

/-- **[Theorem — DominatesOfEquinumerous]**

Equinumerous types dominate each other: a bijection is in particular
an injection.

Logical form:

```lean
theorem DominatesOfEquinumerous (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : Dominates A B
```
-/
theorem DominatesOfEquinumerous (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : Dominates A B := by
  sorry

/-- **[Theorem — CantorSchroederBernstein]**

If `A` is dominated by `B` and `B` is dominated by `A`, the two are
equinumerous. The theorem that makes `Dominates` a genuine measure of
relative size rather than just a preorder: mutual domination collapses
to equality of cardinality, with no appeal to choice.

*Proof status:* proof pending

Logical form:

```lean
theorem CantorSchroederBernstein (A : Type u) (B : Type v)
    (firstDominates : Dominates A B) (secondDominates : Dominates B A) :
    Equinumerous A B
```
-/
theorem CantorSchroederBernstein (A : Type u) (B : Type v)
    (firstDominates : Dominates A B) (secondDominates : Dominates B A) :
    Equinumerous A B := by
  sorry

/-- **[Theorem — CantorTheorem]**

No type surjects onto its own powerset: `A` is always strictly
dominated by `A → Prop`. Cantor's theorem, stated through the diagonal
argument's conclusion rather than its construction.

*Proof status:* proof pending

Logical form:

```lean
theorem CantorTheorem (A : Type u) :
    ¬ ∃ f : A → (A → Prop), LRA.Function.Surjective f
```
-/
theorem CantorTheorem (A : Type u) :
    ¬ ∃ f : A → (A → Prop), LRA.Function.Surjective f := by
  sorry

/-- **[Theorem — StrictlyDominatesPowerset]**

Every type is strictly dominated by its own powerset -- Cantor's
theorem, restated as a strict-domination fact via the singleton
embedding `a ↦ (· = a)`.

*Proof status:* proof pending

Logical form:

```lean
theorem StrictlyDominatesPowerset (A : Type u) :
    StrictlyDominates A (A → Prop)
```
-/
theorem StrictlyDominatesPowerset (A : Type u) :
    StrictlyDominates A (A → Prop) := by
  sorry

end LRA.Cardinality
