import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Operations

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Interface.ModelTheory

variable (fieldModel : DenselyOrderedFieldModel)

theorem endpoint_sum_exists_uniquely (first second : EndpointInterval fieldModel) :
    ∃ result, IsEndpointSum fieldModel first second result ∧
      ∀ other, IsEndpointSum fieldModel first second other → other = result := by
  sorry

noncomputable def endpoint_addition
    (first second : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_sum_exists_uniquely fieldModel first second)

theorem endpoint_negation_exists_uniquely (interval : EndpointInterval fieldModel) :
    ∃ result, IsEndpointNegation fieldModel interval result ∧
      ∀ other, IsEndpointNegation fieldModel interval other → other = result := by
  sorry

noncomputable def endpoint_negation
    (interval : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_negation_exists_uniquely fieldModel interval)

theorem endpoint_product_exists_uniquely (first second : EndpointInterval fieldModel) :
    ∃ result, IsEndpointProduct fieldModel first second result ∧
      ∀ other, IsEndpointProduct fieldModel first second other → other = result := by
  sorry

noncomputable def endpoint_multiplication
    (first second : EndpointInterval fieldModel) : EndpointInterval fieldModel :=
  Classical.choose (endpoint_product_exists_uniquely fieldModel first second)

/-- The raw representative-level operations — pointwise on the underlying
`Nat → EndpointInterval`, not yet known to be nested/shrinking. -/
noncomputable def representative_addition
    (first second : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index =>
    endpoint_addition fieldModel (first.interval index) (second.interval index)

noncomputable def representative_negation
    (sequence : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index => endpoint_negation fieldModel (sequence.interval index)

noncomputable def representative_multiplication
    (first second : NestedIntervalSequence fieldModel) :
    Nat → EndpointInterval fieldModel :=
  fun index =>
    endpoint_multiplication fieldModel (first.interval index) (second.interval index)

theorem representative_addition_is_nested_and_shrinking
    (first second : NestedIntervalSequence fieldModel) :
    IsNestedAndShrinking fieldModel
      (representative_addition fieldModel first second) := by
  sorry

theorem representative_negation_is_nested_and_shrinking
    (sequence : NestedIntervalSequence fieldModel) :
    IsNestedAndShrinking fieldModel
      (representative_negation fieldModel sequence) := by
  sorry

theorem representative_multiplication_is_nested_and_shrinking
    (first second : NestedIntervalSequence fieldModel) :
    IsNestedAndShrinking fieldModel
      (representative_multiplication fieldModel first second) := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
