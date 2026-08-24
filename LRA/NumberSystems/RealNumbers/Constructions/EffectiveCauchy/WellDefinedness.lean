import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Operations
import LRA.Operation.Laws.QuotientCompatible.Definition

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy
open LRA.NumberSystems.RationalNumbers
open LRA.Operation.Laws.QuotientCompatible

/-!
`EffectiveCauchyApproximation` has no separate raw/promoted split —
`representative_addition`/`_negation`/`_multiplication` are already total
functions on it directly (like `Dedekind.Cut`, unlike `Cauchy.Representative`).
So `BinaryOperationIsProper`/`UnaryOperationIsProper` apply here in their
degenerate form (`Raw := Representative`, `toRaw := id`,
`invariant := fun _ => True`, documented in
`Operation/Laws/QuotientCompatible/Definition.lean`): `closed` is
`trivial` and `matches_raw` is `rfl` in every instance below, since
there's nothing to reconstruct.
-/

theorem representative_addition_respects_equivalence
    (rationalSystem : RationalNumberSystem) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (ApproximationSetoid rationalSystem)
      (representative_addition (rationalSystem := rationalSystem)) := by
  sorry

theorem addition_is_proper
    (rationalSystem : RationalNumberSystem) :
    BinaryOperationIsProper
      (fun _ : EffectiveCauchyApproximation rationalSystem => True)
      id
      (representative_addition (rationalSystem := rationalSystem))
      (ApproximationSetoid rationalSystem)
      (representative_addition (rationalSystem := rationalSystem)) where
  closed := fun _ _ => trivial
  matches_raw := fun _ _ => rfl
  respects := representative_addition_respects_equivalence rationalSystem

theorem representative_negation_respects_equivalence
    (rationalSystem : RationalNumberSystem) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (ApproximationSetoid rationalSystem)
      (representative_negation (rationalSystem := rationalSystem)) := by
  sorry

theorem negation_is_proper
    (rationalSystem : RationalNumberSystem) :
    UnaryOperationIsProper
      (fun _ : EffectiveCauchyApproximation rationalSystem => True)
      id
      (representative_negation (rationalSystem := rationalSystem))
      (ApproximationSetoid rationalSystem)
      (representative_negation (rationalSystem := rationalSystem)) where
  closed := fun _ => trivial
  matches_raw := fun _ => rfl
  respects := representative_negation_respects_equivalence rationalSystem

theorem representative_multiplication_respects_equivalence
    (rationalSystem : RationalNumberSystem) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (ApproximationSetoid rationalSystem)
      (representative_multiplication (rationalSystem := rationalSystem)) := by
  sorry

theorem multiplication_is_proper
    (rationalSystem : RationalNumberSystem) :
    BinaryOperationIsProper
      (fun _ : EffectiveCauchyApproximation rationalSystem => True)
      id
      (representative_multiplication (rationalSystem := rationalSystem))
      (ApproximationSetoid rationalSystem)
      (representative_multiplication (rationalSystem := rationalSystem)) where
  closed := fun _ _ => trivial
  matches_raw := fun _ _ => rfl
  respects := representative_multiplication_respects_equivalence rationalSystem

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
