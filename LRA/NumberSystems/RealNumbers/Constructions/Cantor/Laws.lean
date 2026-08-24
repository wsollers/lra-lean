import LRA.NumberSystems.RealNumbers.Constructions.Cantor.WellDefinedness
import LRA.Operation.Laws.QuotientCompatible.Definition

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Interface.ModelTheory
open LRA.Operation.Laws.QuotientCompatible

noncomputable def addition
    (fieldModel : DenselyOrderedFieldModel)
    (first second : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_addition fieldModel first second
  nested := (representative_addition_is_nested_and_shrinking fieldModel first second).1
  widths_converge_to_zero :=
    (representative_addition_is_nested_and_shrinking fieldModel first second).2

theorem representative_addition_respects_equivalence
    (fieldModel : DenselyOrderedFieldModel) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (EndpointSetoid fieldModel) (addition fieldModel) := by
  sorry

theorem addition_is_proper
    (fieldModel : DenselyOrderedFieldModel) :
    BinaryOperationIsProper
      (IsNestedAndShrinking fieldModel)
      (fun representative => representative.interval)
      (representative_addition fieldModel)
      (EndpointSetoid fieldModel)
      (addition fieldModel) where
  closed := representative_addition_is_nested_and_shrinking fieldModel
  matches_raw := fun _ _ => rfl
  respects := representative_addition_respects_equivalence fieldModel

noncomputable def negation
    (fieldModel : DenselyOrderedFieldModel)
    (sequence : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_negation fieldModel sequence
  nested := (representative_negation_is_nested_and_shrinking fieldModel sequence).1
  widths_converge_to_zero :=
    (representative_negation_is_nested_and_shrinking fieldModel sequence).2

theorem representative_negation_respects_equivalence
    (fieldModel : DenselyOrderedFieldModel) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (EndpointSetoid fieldModel) (negation fieldModel) := by
  sorry

theorem negation_is_proper
    (fieldModel : DenselyOrderedFieldModel) :
    UnaryOperationIsProper
      (IsNestedAndShrinking fieldModel)
      (fun representative => representative.interval)
      (representative_negation fieldModel)
      (EndpointSetoid fieldModel)
      (negation fieldModel) where
  closed := representative_negation_is_nested_and_shrinking fieldModel
  matches_raw := fun _ => rfl
  respects := representative_negation_respects_equivalence fieldModel

noncomputable def multiplication
    (fieldModel : DenselyOrderedFieldModel)
    (first second : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_multiplication fieldModel first second
  nested :=
    (representative_multiplication_is_nested_and_shrinking fieldModel first second).1
  widths_converge_to_zero :=
    (representative_multiplication_is_nested_and_shrinking fieldModel first second).2

theorem representative_multiplication_respects_equivalence
    (fieldModel : DenselyOrderedFieldModel) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (EndpointSetoid fieldModel) (multiplication fieldModel) := by
  sorry

theorem multiplication_is_proper
    (fieldModel : DenselyOrderedFieldModel) :
    BinaryOperationIsProper
      (IsNestedAndShrinking fieldModel)
      (fun representative => representative.interval)
      (representative_multiplication fieldModel)
      (EndpointSetoid fieldModel)
      (multiplication fieldModel) where
  closed := representative_multiplication_is_nested_and_shrinking fieldModel
  matches_raw := fun _ _ => rfl
  respects := representative_multiplication_respects_equivalence fieldModel

/-- The degenerate (single-point) interval `[value, value]`. -/
def constant_interval
    (fieldModel : DenselyOrderedFieldModel)
    (value : fieldModel.signature.carrier) : EndpointInterval fieldModel where
  lower := value
  upper := value
  lower_le_upper := by sorry

theorem constant_sequence_is_nested_and_shrinking
    (fieldModel : DenselyOrderedFieldModel)
    (value : fieldModel.signature.carrier) :
    IsNestedAndShrinking fieldModel (fun _ => constant_interval fieldModel value) := by
  sorry

/-- The embedding of ℚ into the Cantor reals at the representative level,
matching `Dedekind.rational_embedding`/`Cauchy.rational_embedding`'s
naming. -/
noncomputable def rational_embedding
    (fieldModel : DenselyOrderedFieldModel)
    (value : fieldModel.signature.carrier) : NestedIntervalSequence fieldModel where
  interval := fun _ => constant_interval fieldModel value
  nested := (constant_sequence_is_nested_and_shrinking fieldModel value).1
  widths_converge_to_zero :=
    (constant_sequence_is_nested_and_shrinking fieldModel value).2

noncomputable def zero
    (fieldModel : DenselyOrderedFieldModel) : NestedIntervalSequence fieldModel :=
  rational_embedding fieldModel fieldModel.signature.zero

noncomputable def one
    (fieldModel : DenselyOrderedFieldModel) : NestedIntervalSequence fieldModel :=
  rational_embedding fieldModel fieldModel.signature.one

/-- `first < second` iff, from some index on, `first`'s interval lies
strictly to the left of `second`'s. -/
def representative_strict_order
    (fieldModel : DenselyOrderedFieldModel)
    (first second : NestedIntervalSequence fieldModel) : Prop :=
  ∃ index : Nat,
    fieldModel.signature.StrictOrder
      (first.interval index).upper (second.interval index).lower

theorem representative_strict_order_respects_equivalence
    (fieldModel : DenselyOrderedFieldModel) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (EndpointSetoid fieldModel) (representative_strict_order fieldModel) := by
  sorry

theorem strict_order_is_proper
    (fieldModel : DenselyOrderedFieldModel) :
    RelationIsProper
      (EndpointSetoid fieldModel) (representative_strict_order fieldModel) where
  respects := representative_strict_order_respects_equivalence fieldModel

end LRA.NumberSystems.RealNumbers.Cantor
