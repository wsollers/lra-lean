-- LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Behavior.lean
-- Cross-construction comparison with Cauchy null sequences.

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Laws
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.NumberSystems.Models

variable (rationalModel : DenselyOrderedFieldModel)

/-- Persistent cross-level overlap is equivalent to null difference of the
left-endpoint sequences, relative to the selected rational metric data.

This is a genuine comparison theorem between the primitive-interval relation
and the Cauchy null-sequence relation; unlike the former self-comparison
statement, its two sides are mathematically distinct predicates.

Logical form:

```lean
theorem PersistentOverlapIffEndpointDifferenceIsNull
    (absoluteValueData : Cauchy.RationalMetricData rationalModel)
    (first second : Representative rationalModel) :
    equivalent rationalModel first second ↔
      Cauchy.is_null rationalModel absoluteValueData
        (fun index =>
          rationalModel.signature.Subtraction
            (first.interval index).left_endpoint
            (second.interval index).left_endpoint)
```
-/
theorem PersistentOverlapIffEndpointDifferenceIsNull
    (absoluteValueData : Cauchy.RationalMetricData rationalModel)
    (first second : Representative rationalModel) :
    equivalent rationalModel first second ↔
      Cauchy.is_null rationalModel absoluteValueData
        (fun index =>
          rationalModel.signature.Subtraction
            (first.interval index).left_endpoint
            (second.interval index).left_endpoint) := by
  sorry

/-!
The former `canonical_comparison_isomorphism_exists` has been removed.  It
claimed to compare PrimitiveIntervals with the Cantor construction but its type
was merely `Carrier → Carrier` and its asserted map was the identity.

The former `PrimitiveIntervalConstructionOfReals` summary proposition has also
been removed.  Its final conjunct was the tautology `equivalent ... ↔
equivalent ...`.  Real-number realization is stated concretely in
`Instances.lean` by tying a `RealModel` to the actual primitive-interval
quotient carrier.
-/

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
