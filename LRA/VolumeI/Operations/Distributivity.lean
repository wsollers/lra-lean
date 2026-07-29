import LRA.VolumeI.Operations.Laws

namespace LRA.VolumeI.Operations

universe u

/-- Alias emphasizing two-sided distributivity. -/
def TwoSidedDistributive {Alpha : LRA.VolumeI.Set.LRACarrier}
    (multiplication addition : BinaryOperation Alpha) : Prop :=
  Distributive multiplication addition

/-- Commutative multiplication turns left distributivity into right distributivity. -/
theorem LeftDistributiveImpliesRightDistributiveOfCommutative
    {Alpha : LRA.VolumeI.Set.LRACarrier}
    {multiplication addition : BinaryOperation Alpha}
    (multiplicationIsCommutative : Commutative multiplication)
    (leftDistributivity :
      LeftDistributive multiplication addition) :
    RightDistributive multiplication addition := by
  sorry

/-- Commutative multiplication turns right distributivity into left distributivity. -/
theorem RightDistributiveImpliesLeftDistributiveOfCommutative
    {Alpha : LRA.VolumeI.Set.LRACarrier}
    {multiplication addition : BinaryOperation Alpha}
    (multiplicationIsCommutative : Commutative multiplication)
    (rightDistributivity :
      RightDistributive multiplication addition) :
    LeftDistributive multiplication addition := by
  sorry

end LRA.VolumeI.Operations
