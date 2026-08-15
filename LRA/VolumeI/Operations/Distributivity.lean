import LRA.VolumeI.Operations.Laws

namespace LRA.Algebra.Operation

universe u

/--
Alias emphasizing two-sided distributivity.

Logical form:

```lean
def TwoSidedDistributive {Alpha : Type u}
    (multiplication addition : BinaryOperation Alpha) : Prop :=
  Distributive multiplication addition
```
-/
def TwoSidedDistributive {Alpha : Type u}
    (multiplication addition : BinaryOperation Alpha) : Prop :=
  Distributive multiplication addition

/--
Commutative multiplication turns left distributivity into right distributivity.

Logical form:

```lean
theorem LeftDistributiveImpliesRightDistributiveOfCommutative
    {Alpha : Type u}
    {multiplication addition : BinaryOperation Alpha}
    (multiplicationIsCommutative : Commutative multiplication)
    (leftDistributivity :
      LeftDistributive multiplication addition) :
    RightDistributive multiplication addition
```
-/
theorem LeftDistributiveImpliesRightDistributiveOfCommutative
    {Alpha : Type u}
    {multiplication addition : BinaryOperation Alpha}
    (multiplicationIsCommutative : Commutative multiplication)
    (leftDistributivity :
      LeftDistributive multiplication addition) :
    RightDistributive multiplication addition := by
  sorry

/--
Commutative multiplication turns right distributivity into left distributivity.

Logical form:

```lean
theorem RightDistributiveImpliesLeftDistributiveOfCommutative
    {Alpha : Type u}
    {multiplication addition : BinaryOperation Alpha}
    (multiplicationIsCommutative : Commutative multiplication)
    (rightDistributivity :
      RightDistributive multiplication addition) :
    LeftDistributive multiplication addition
```
-/
theorem RightDistributiveImpliesLeftDistributiveOfCommutative
    {Alpha : Type u}
    {multiplication addition : BinaryOperation Alpha}
    (multiplicationIsCommutative : Commutative multiplication)
    (rightDistributivity :
      RightDistributive multiplication addition) :
    LeftDistributive multiplication addition := by
  sorry

end LRA.Algebra.Operation
