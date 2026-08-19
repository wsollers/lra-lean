-- LRA/Cardinality/Properties/Finiteness/Theorems.lean
-- Theorems about IsFinite/IsInfinite and their Dedekind-free cousins.

import LRA.Cardinality.Properties.Finiteness.Definition

namespace LRA.Cardinality

universe u v

/-!
Volume I label: cardinality-finiteness-theorems
Lean module: LRA.Cardinality.Properties.Finiteness.Theorems
Verification status: statements accepted; proofs pending
-/

/-- **[Theorem — IsFiniteCongr]**

Finiteness transports along equinumerosity: equinumerous types are
finite together or infinite together.

Logical form:

```lean
theorem IsFiniteCongr (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : IsFinite A ↔ IsFinite B
```
-/
theorem IsFiniteCongr (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : IsFinite A ↔ IsFinite B := by
  sorry

/-- **[Theorem — NotBothFiniteAndInfinite]**

No type is both finite and infinite -- immediate from the definitions,
recorded for fluent use.

Logical form:

```lean
theorem NotBothFiniteAndInfinite (A : Type u) :
    ¬ (IsFinite A ∧ IsInfinite A)
```
-/
theorem NotBothFiniteAndInfinite (A : Type u) :
    ¬ (IsFinite A ∧ IsInfinite A) := by
  sorry

/-- **[Theorem — FiniteImpliesDedekindFinite]**

Every finite type is Dedekind-finite -- the choice-free direction (the
converse needs the axiom of choice, and is not stated here).

Logical form:

```lean
theorem FiniteImpliesDedekindFinite (A : Type u)
    (finite : IsFinite A) : IsDedekindFinite A
```
-/
theorem FiniteImpliesDedekindFinite (A : Type u)
    (finite : IsFinite A) : IsDedekindFinite A := by
  sorry

/-- **[Theorem — DedekindInfiniteImpliesInfinite]**

Every Dedekind-infinite type is infinite -- the contrapositive of
`FiniteImpliesDedekindFinite`, stated directly since both directions
are used independently.

Logical form:

```lean
theorem DedekindInfiniteImpliesInfinite (A : Type u)
    (dedekindInfinite : IsDedekindInfinite A) : IsInfinite A
```
-/
theorem DedekindInfiniteImpliesInfinite (A : Type u)
    (dedekindInfinite : IsDedekindInfinite A) : IsInfinite A := by
  sorry

/-- **[Theorem — DominatesOfFiniteInfinite]**

A finite type is dominated by any infinite type: intuitively, an
infinite type has "room" for an injection from any finite one.

Logical form:

```lean
theorem DominatesOfFiniteInfinite (A : Type u) (B : Type v)
    (finiteA : IsFinite A) (infiniteB : IsInfinite B) : Dominates A B
```
-/
theorem DominatesOfFiniteInfinite (A : Type u) (B : Type v)
    (finiteA : IsFinite A) (infiniteB : IsInfinite B) : Dominates A B := by
  sorry

end LRA.Cardinality
