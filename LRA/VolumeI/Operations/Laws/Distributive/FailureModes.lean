import LRA.VolumeI.Operations.Laws.Distributive.Definition

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

universe u

/-- Failure of left distributivity. -/
def FailsLeftDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  Not (LeftDistributive outer inner)

/-- Failure of right distributivity. -/
def FailsRightDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  Not (RightDistributive outer inner)

/-- Natural-number addition for distributivity failures. -/
def NaturalAdditionForDistributiveFailure : BinaryEndoOperation Nat :=
  fun left right => left + right

/-- Natural-number multiplication for distributivity failures. -/
def NaturalMultiplicationForDistributiveFailure : BinaryEndoOperation Nat :=
  fun left right => left * right

/--
**[Failure Mode — NaturalAdditionFailsLeftDistributiveOverMultiplication]**

Natural-number addition does not left-distribute over natural-number
multiplication.
-/
theorem NaturalAdditionFailsLeftDistributiveOverMultiplication :
    FailsLeftDistributive
      NaturalAdditionForDistributiveFailure
      NaturalMultiplicationForDistributiveFailure := by
  sorry

/--
**[Failure Mode — NaturalAdditionFailsRightDistributiveOverMultiplication]**

Natural-number addition does not right-distribute over natural-number
multiplication.
-/
theorem NaturalAdditionFailsRightDistributiveOverMultiplication :
    FailsRightDistributive
      NaturalAdditionForDistributiveFailure
      NaturalMultiplicationForDistributiveFailure := by
  sorry

end LRA.Operation.Laws.Distributive
