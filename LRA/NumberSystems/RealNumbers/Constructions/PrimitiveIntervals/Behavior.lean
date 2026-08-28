
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

  equivalent rationalSystem.FieldModel first second ↔ Cauchy.is_null rationalSystem absoluteValueData (fun index => rationalSystem.FieldModel.signature.Subtraction (first.interval index).left_endpoint (second.interval index).left_endpoint)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absoluteValueData : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rationalSystem.2), ∀ (first_index second_index : Nat), Exists fun value => ((rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (first.interval first_index).1 value ∧ rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 value (first.interval first_index).2) ∧ (rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (second.interval second_index).1 value ∧ rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 value (second.interval second_index).2)) ↔ ∀ (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absoluteValueData.1 ((fun index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.interval index).1 (rationalSystem.FieldModel.signature.toRingConceptSignature.2 (second.interval index).left_endpoint)) index)) epsilon

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
