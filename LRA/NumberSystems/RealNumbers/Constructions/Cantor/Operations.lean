import LRA.NumberSystems.RealNumbers.Constructions.Cantor.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Interface.ModelTheory

/-- `result` is the pointwise sum `[a,b] + [c,d] = [a+c, b+d]`. -/
def IsEndpointSum
    (fieldModel : DenselyOrderedFieldModel)
    (first second result : EndpointInterval fieldModel) : Prop :=
  result.lower = fieldModel.signature.add first.lower second.lower ∧
  result.upper = fieldModel.signature.add first.upper second.upper

/-- `result` is the negation `-[a,b] = [-b,-a]`. -/
def IsEndpointNegation
    (fieldModel : DenselyOrderedFieldModel)
    (interval result : EndpointInterval fieldModel) : Prop :=
  result.lower = fieldModel.signature.neg interval.upper ∧
  result.upper = fieldModel.signature.neg interval.lower

/-- One of the four corner products of two intervals. -/
def IsCornerProduct
    (fieldModel : DenselyOrderedFieldModel)
    (first second : EndpointInterval fieldModel)
    (value : fieldModel.signature.carrier) : Prop :=
  value = fieldModel.signature.multiply first.lower second.lower ∨
  value = fieldModel.signature.multiply first.lower second.upper ∨
  value = fieldModel.signature.multiply first.upper second.lower ∨
  value = fieldModel.signature.multiply first.upper second.upper

/-- `result` bounds every corner product and is itself achieved by two
corners — the standard characterization of interval multiplication
(matches `PrimitiveIntervals.IsIntervalProduct`). -/
def IsEndpointProduct
    (fieldModel : DenselyOrderedFieldModel)
    (first second result : EndpointInterval fieldModel) : Prop :=
  (∀ corner, IsCornerProduct fieldModel first second corner →
    fieldModel.signature.le result.lower corner) ∧
  (∀ corner, IsCornerProduct fieldModel first second corner →
    fieldModel.signature.le corner result.upper) ∧
  IsCornerProduct fieldModel first second result.lower ∧
  IsCornerProduct fieldModel first second result.upper

/-- Bundles `NestedIntervalSequence`'s two proof obligations (`nested`,
`widths_converge_to_zero`) into one predicate on a bare
`Nat → EndpointInterval`, so it can serve as the `invariant` for
`Operation.Laws.QuotientCompatible`. -/
def IsNestedAndShrinking
    (fieldModel : DenselyOrderedFieldModel)
    (sequence : Nat → EndpointInterval fieldModel) : Prop :=
  (∀ index : Nat,
    fieldModel.signature.le (sequence index).lower (sequence (index + 1)).lower ∧
    fieldModel.signature.le (sequence (index + 1)).upper (sequence index).upper) ∧
  (∀ positive_tolerance : fieldModel.signature.carrier,
    fieldModel.signature.StrictOrder fieldModel.signature.zero positive_tolerance →
    ∃ index : Nat,
      fieldModel.signature.StrictOrder
        (fieldModel.signature.add
          (sequence index).upper
          (fieldModel.signature.neg (sequence index).lower))
        positive_tolerance)

end LRA.NumberSystems.RealNumbers.Cantor
