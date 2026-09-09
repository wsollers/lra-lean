
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Laws
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy
import LRA.NumberSystems.RationalNumbers.Interface.Definition

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

variable (rationalSystem : RationalNumberSystem)

/--
`PersistentOverlapIffEndpointDifferenceIsNull` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absoluteValueData : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rationalSystem.FieldModel), LRA.NumberSystems.RealNumbers.PrimitiveIntervals.equivalent rationalSystem.FieldModel first second ↔ LRA.NumberSystems.RealNumbers.Cauchy.is_null rationalSystem absoluteValueData fun index => rationalSystem.FieldModel.signature.Subtraction (first.interval index).left_endpoint (second.interval index).left_endpoint

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalSystem : RationalNumberSystem
    absoluteValueData : Cauchy.RationalMetricData rationalSystem
    first second : Representative rationalSystem.FieldModel
  Prove
    LRA.NumberSystems.RealNumbers.PrimitiveIntervals.equivalent rationalSystem.FieldModel first second ↔ LRA.NumberSystems.RealNumbers.Cauchy.is_null rationalSystem absoluteValueData fun index => rationalSystem.FieldModel.signature.Subtraction (first.interval index).left_endpoint (second.interval index).left_endpoint

Logical form (Lean):

```lean
theorem PersistentOverlapIffEndpointDifferenceIsNull
    (absoluteValueData : Cauchy.RationalMetricData rationalSystem)
    (first second : Representative rationalSystem.FieldModel) :
    equivalent rationalSystem.FieldModel first second ↔
      Cauchy.is_null rationalSystem absoluteValueData
        (fun index =>
          rationalSystem.FieldModel.signature.Subtraction
            (first.interval index).left_endpoint
            (second.interval index).left_endpoint)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem PersistentOverlapIffEndpointDifferenceIsNull
    (absoluteValueData : Cauchy.RationalMetricData rationalSystem)
    (first second : Representative rationalSystem.FieldModel) :
    equivalent rationalSystem.FieldModel first second ↔
      Cauchy.is_null rationalSystem absoluteValueData
        (fun index =>
          rationalSystem.FieldModel.signature.Subtraction
            (first.interval index).left_endpoint
            (second.interval index).left_endpoint) := by
  sorry
end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
