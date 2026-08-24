import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy
open LRA.NumberSystems.RationalNumbers

/-- The constant approximation at a fixed rational value — needs no
precision at all (`Modulus := fun _ => 0`), trivially within any
`PrecisionRadius` of itself. -/
noncomputable def rational_embedding
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.Carrier) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun _ => value
  Modulus := fun _ => 0
  CauchyAtPrecision := by sorry

noncomputable def zero
    (rationalSystem : RationalNumberSystem) : EffectiveCauchyApproximation rationalSystem :=
  rational_embedding rationalSystem 0

noncomputable def one
    (rationalSystem : RationalNumberSystem) : EffectiveCauchyApproximation rationalSystem :=
  rational_embedding rationalSystem 1

/-- `first < second` iff, from some index on, `first` and `second` are
separated by at least a fixed `PrecisionRadius`. -/
def representative_strict_order
    {rationalSystem : RationalNumberSystem}
    (first second : EffectiveCauchyApproximation rationalSystem) : Prop :=
  ∃ precision threshold : Nat,
    ∀ index : Nat, threshold ≤ index →
      first.Approximate index + PrecisionRadius rationalSystem precision ≤
        second.Approximate index

theorem representative_strict_order_respects_equivalence
    (rationalSystem : RationalNumberSystem) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (ApproximationSetoid rationalSystem)
      (representative_strict_order (rationalSystem := rationalSystem)) := by
  sorry

theorem strict_order_is_proper
    (rationalSystem : RationalNumberSystem) :
    LRA.Operation.Laws.QuotientCompatible.RelationIsProper
      (ApproximationSetoid rationalSystem)
      (representative_strict_order (rationalSystem := rationalSystem)) where
  respects := representative_strict_order_respects_equivalence rationalSystem

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
