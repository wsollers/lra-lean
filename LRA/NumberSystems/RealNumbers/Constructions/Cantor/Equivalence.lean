-- LRA/NumberSystems/RealNumbers/Constructions/Cantor/Equivalence.lean
-- Equivalence between shrinking nested interval sequences.

import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Carrier

namespace LRA.NumberSystems.RealNumbers.Cantor

open LRA.NumberSystems.Models

/-- Two shrinking nested interval sequences represent the same limit when,
for every positive tolerance, some common stage has each interval lying within
that tolerance of the other.

Equivalently, neither interval is separated from the other by a positive gap
bounded away from zero. Both inequalities are required; the former one-sided
condition was not symmetric and therefore could not define a quotient
relation.

Logical form:

```lean
def EndpointEquivalent
    (fieldModel : DenselyOrderedFieldModel)
    (first second : NestedIntervalSequence fieldModel) : Prop :=
  ∀ tolerance : fieldModel.Carrier,
    0 < tolerance →
      ∃ index : Nat,
        first.interval index |>.lower - second.interval index |>.upper < tolerance ∧
        second.interval index |>.lower - first.interval index |>.upper < tolerance
```
-/
def EndpointEquivalent
    (fieldModel : DenselyOrderedFieldModel)
    (first second : NestedIntervalSequence fieldModel) : Prop :=
  ∀ tolerance : fieldModel.Carrier,
    0 < tolerance →
      ∃ index : Nat,
        (first.interval index).lower - (second.interval index).upper < tolerance ∧
        (second.interval index).lower - (first.interval index).upper < tolerance

/-- Symmetric asymptotic overlap is an equivalence relation on shrinking nested
interval sequences.

Reflexivity uses `lower ≤ upper`. Symmetry exchanges the two conjuncts.
Transitivity combines the two comparison gaps with a sufficiently small width
of the middle interval sequence.

Logical form:

```lean
theorem EndpointEquivalentIsEquivalence
    (fieldModel : DenselyOrderedFieldModel) :
    Equivalence (EndpointEquivalent fieldModel)
```
-/
theorem EndpointEquivalentIsEquivalence
    (fieldModel : DenselyOrderedFieldModel) :
    Equivalence (EndpointEquivalent fieldModel) := by
  sorry

/-- The setoid of shrinking nested interval sequences representing the same
limit.

Logical form:

```lean
def EndpointSetoid (fieldModel : DenselyOrderedFieldModel) :
    Setoid (NestedIntervalSequence fieldModel)
```
-/
def EndpointSetoid (fieldModel : DenselyOrderedFieldModel) :
    Setoid (NestedIntervalSequence fieldModel) where
  r := EndpointEquivalent fieldModel
  iseqv := EndpointEquivalentIsEquivalence fieldModel

/-- The quotient carrier of the Cantor nested-interval construction. -/
abbrev Carrier (fieldModel : DenselyOrderedFieldModel) :=
  Quotient (EndpointSetoid fieldModel)

end LRA.NumberSystems.RealNumbers.Cantor
