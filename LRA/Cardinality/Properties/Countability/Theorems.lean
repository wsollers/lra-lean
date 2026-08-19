-- LRA/Cardinality/Properties/Countability/Theorems.lean
-- Theorems about IsCountable/IsCountablyInfinite/IsUncountable.

import LRA.Cardinality.Properties.Countability.Definition
import LRA.Cardinality.Properties.Finiteness.Definition

namespace LRA.Cardinality

universe u v

/-!
Volume I label: cardinality-countability-theorems
Lean module: LRA.Cardinality.Properties.Countability.Theorems
Verification status: statements accepted; proofs pending
-/

/-- **[Theorem — FiniteImpliesCountable]**

Every finite type is countable.

Logical form:

```lean
theorem FiniteImpliesCountable (A : Type u)
    (finite : IsFinite A) : IsCountable A
```
-/
theorem FiniteImpliesCountable (A : Type u)
    (finite : IsFinite A) : IsCountable A := by
  sorry

/-- **[Theorem — CountablyInfiniteImpliesCountable]**

Every countably infinite type is countable.

Logical form:

```lean
theorem CountablyInfiniteImpliesCountable (A : Type u)
    (countablyInfinite : IsCountablyInfinite A) : IsCountable A
```
-/
theorem CountablyInfiniteImpliesCountable (A : Type u)
    (countablyInfinite : IsCountablyInfinite A) : IsCountable A := by
  sorry

/-- **[Theorem — CountablyInfiniteImpliesInfinite]**

Every countably infinite type is infinite -- distinguishing
`IsCountablyInfinite` from mere finiteness.

Logical form:

```lean
theorem CountablyInfiniteImpliesInfinite (A : Type u)
    (countablyInfinite : IsCountablyInfinite A) : IsInfinite A
```
-/
theorem CountablyInfiniteImpliesInfinite (A : Type u)
    (countablyInfinite : IsCountablyInfinite A) : IsInfinite A := by
  sorry

/-- **[Theorem — IsCountableCongr]**

Countability transports along equinumerosity.

Logical form:

```lean
theorem IsCountableCongr (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : IsCountable A ↔ IsCountable B
```
-/
theorem IsCountableCongr (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : IsCountable A ↔ IsCountable B := by
  sorry

/-- **[Theorem — DominatesCountableIsCountable]**

Countability is downward closed under domination: whatever is
dominated by a countable type is itself countable.

Logical form:

```lean
theorem DominatesCountableIsCountable (A : Type u) (B : Type v)
    (dominatesB : Dominates A B) (countableB : IsCountable B) :
    IsCountable A
```
-/
theorem DominatesCountableIsCountable (A : Type u) (B : Type v)
    (dominatesB : Dominates A B) (countableB : IsCountable B) :
    IsCountable A := by
  sorry

/-- **[Theorem — CountableSigmaOfCountableIndexCountableFibers]**

A dependent sum over a countable index type, with every fiber
countable, is countable -- the general form of "a countable union of
countable sets is countable."

*Proof status:* proof pending (needs the axiom of choice, to select an
enumeration of each fiber simultaneously)

Logical form:

```lean
theorem CountableSigmaOfCountableIndexCountableFibers
    {Index : Type u} (family : Index → Type v)
    (countableIndex : IsCountable Index)
    (countableFibers : ∀ index : Index, IsCountable (family index)) :
    IsCountable (Sigma family)
```
-/
theorem CountableSigmaOfCountableIndexCountableFibers
    {Index : Type u} (family : Index → Type v)
    (countableIndex : IsCountable Index)
    (countableFibers : ∀ index : Index, IsCountable (family index)) :
    IsCountable (Sigma family) := by
  sorry

end LRA.Cardinality
