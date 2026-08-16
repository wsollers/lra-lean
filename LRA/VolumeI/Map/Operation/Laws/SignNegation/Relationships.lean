import LRA.VolumeI.Map.Operation.Laws.SignNegation.Theorems

namespace LRA.Map.Operation.Laws.SignNegation

open LRA.Map.Operation

universe u

/-- A bundled sign-negation contract supplies additive inverse involution. -/
theorem SignNegationLaws.additive_inverse_involutive {Carrier : Type u}
    {addition multiplication subtraction : BinaryEndoOperation Carrier}
    {negation : UnaryEndoOperation Carrier}
    {zero one : Carrier}
    (laws : SignNegationLaws addition multiplication subtraction negation zero one) :
    AdditiveInverseInvolutive negation := by
  sorry

/-- A bundled sign-negation contract supplies the additive inverse anchor. -/
theorem SignNegationLaws.additive_inverse_anchor {Carrier : Type u}
    {addition multiplication subtraction : BinaryEndoOperation Carrier}
    {negation : UnaryEndoOperation Carrier}
    {zero one : Carrier}
    (laws : SignNegationLaws addition multiplication subtraction negation zero one) :
    AdditiveInverseAnchor addition negation zero := by
  sorry

/-- A bundled sign-negation contract supplies product of negatives. -/
theorem SignNegationLaws.mul_negated_both {Carrier : Type u}
    {addition multiplication subtraction : BinaryEndoOperation Carrier}
    {negation : UnaryEndoOperation Carrier}
    {zero one : Carrier}
    (laws : SignNegationLaws addition multiplication subtraction negation zero one) :
    MulNegatedBoth multiplication negation := by
  sorry

/-- A bundled sign-negation contract supplies left distributivity over subtraction. -/
theorem SignNegationLaws.left_distributive_over_subtraction {Carrier : Type u}
    {addition multiplication subtraction : BinaryEndoOperation Carrier}
    {negation : UnaryEndoOperation Carrier}
    {zero one : Carrier}
    (laws : SignNegationLaws addition multiplication subtraction negation zero one) :
    LeftDistributiveOverSubtraction multiplication subtraction := by
  sorry

/-- A bundled sign-negation contract supplies right distributivity over subtraction. -/
theorem SignNegationLaws.right_distributive_over_subtraction {Carrier : Type u}
    {addition multiplication subtraction : BinaryEndoOperation Carrier}
    {negation : UnaryEndoOperation Carrier}
    {zero one : Carrier}
    (laws : SignNegationLaws addition multiplication subtraction negation zero one) :
    RightDistributiveOverSubtraction multiplication subtraction := by
  sorry

end LRA.Map.Operation.Laws.SignNegation
