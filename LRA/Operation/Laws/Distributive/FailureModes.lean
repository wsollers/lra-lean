import LRA.Operation.Laws.Distributive.Definition

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

universe u

def FailsLeftDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  Not (LeftDistributive outer inner)

def FailsRightDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  Not (RightDistributive outer inner)

def NaturalAdditionForDistributiveFailure : BinaryEndoOperation Nat :=
  fun left right => left + right

def NaturalMultiplicationForDistributiveFailure : BinaryEndoOperation Nat :=
  fun left right => left * right

theorem NaturalAdditionFailsLeftDistributiveOverMultiplication :
    FailsLeftDistributive
      NaturalAdditionForDistributiveFailure
      NaturalMultiplicationForDistributiveFailure := by
  sorry

theorem NaturalAdditionFailsRightDistributiveOverMultiplication :
    FailsRightDistributive
      NaturalAdditionForDistributiveFailure
      NaturalMultiplicationForDistributiveFailure := by
  sorry

end LRA.Operation.Laws.Distributive
