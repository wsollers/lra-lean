import LRA.VolumeI.Map.Operation.Laws.SignNegation.Definition

namespace LRA.Map.Operation.Laws.SignNegation

open LRA.Map.Operation

universe u

/-- Apply additive inverse involution. -/
theorem AdditiveInverseInvolutive.apply {Carrier : Type u}
    {negation : UnaryEndoOperation Carrier}
    (law : AdditiveInverseInvolutive negation)
    (element : Carrier) :
    negation (negation element) = element := by
  sorry

/-- Apply the additive inverse anchor on the right. -/
theorem AdditiveInverseAnchor.apply_right {Carrier : Type u}
    {addition : BinaryEndoOperation Carrier}
    {negation : UnaryEndoOperation Carrier}
    {zero : Carrier}
    (law : AdditiveInverseAnchor addition negation zero)
    (element : Carrier) :
    addition element (negation element) = zero := by
  sorry

/-- Apply the additive inverse anchor on the left. -/
theorem AdditiveInverseAnchor.apply_left {Carrier : Type u}
    {addition : BinaryEndoOperation Carrier}
    {negation : UnaryEndoOperation Carrier}
    {zero : Carrier}
    (law : AdditiveInverseAnchor addition negation zero)
    (element : Carrier) :
    addition (negation element) element = zero := by
  sorry

/-- Apply left multiplication by negative one. -/
theorem MulNegativeOneLeft.apply {Carrier : Type u}
    {multiplication : BinaryEndoOperation Carrier}
    {negation : UnaryEndoOperation Carrier}
    {one : Carrier}
    (law : MulNegativeOneLeft multiplication negation one)
    (element : Carrier) :
    multiplication (negation one) element = negation element := by
  sorry

/-- Apply right multiplication by negative one. -/
theorem MulNegativeOneRight.apply {Carrier : Type u}
    {multiplication : BinaryEndoOperation Carrier}
    {negation : UnaryEndoOperation Carrier}
    {one : Carrier}
    (law : MulNegativeOneRight multiplication negation one)
    (element : Carrier) :
    multiplication element (negation one) = negation element := by
  sorry

/-- Apply multiplication by a negated left factor. -/
theorem MulNegatedLeft.apply {Carrier : Type u}
    {multiplication : BinaryEndoOperation Carrier}
    {negation : UnaryEndoOperation Carrier}
    (law : MulNegatedLeft multiplication negation)
    (left right : Carrier) :
    multiplication (negation left) right =
      negation (multiplication left right) := by
  sorry

/-- Apply multiplication by a negated right factor. -/
theorem MulNegatedRight.apply {Carrier : Type u}
    {multiplication : BinaryEndoOperation Carrier}
    {negation : UnaryEndoOperation Carrier}
    (law : MulNegatedRight multiplication negation)
    (left right : Carrier) :
    multiplication left (negation right) =
      negation (multiplication left right) := by
  sorry

/-- Apply product of two negated factors. -/
theorem MulNegatedBoth.apply {Carrier : Type u}
    {multiplication : BinaryEndoOperation Carrier}
    {negation : UnaryEndoOperation Carrier}
    (law : MulNegatedBoth multiplication negation)
    (left right : Carrier) :
    multiplication (negation left) (negation right) =
      multiplication left right := by
  sorry

/-- Apply left distributivity over subtraction. -/
theorem LeftDistributiveOverSubtraction.apply {Carrier : Type u}
    {multiplication subtraction : BinaryEndoOperation Carrier}
    (law : LeftDistributiveOverSubtraction multiplication subtraction)
    (left right third : Carrier) :
    multiplication left (subtraction right third) =
      subtraction (multiplication left right) (multiplication left third) := by
  sorry

/-- Apply right distributivity over subtraction. -/
theorem RightDistributiveOverSubtraction.apply {Carrier : Type u}
    {multiplication subtraction : BinaryEndoOperation Carrier}
    (law : RightDistributiveOverSubtraction multiplication subtraction)
    (left right third : Carrier) :
    multiplication (subtraction left right) third =
      subtraction (multiplication left third) (multiplication right third) := by
  sorry

end LRA.Map.Operation.Laws.SignNegation
