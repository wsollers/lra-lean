import LRA.VolumeI.Operations.Laws.Distributive.Theorems

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

/-- Natural-number addition for distributivity examples. -/
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

/-- Natural-number multiplication for distributivity examples. -/
def NaturalMultiplication : BinaryEndoOperation Nat :=
  fun left right => left * right

/--
**[Example — NaturalMultiplicationDistributesOverAddition]**

Natural-number multiplication distributes over natural-number addition.
-/
theorem NaturalMultiplicationDistributesOverAddition :
    TwoSidedDistributive NaturalMultiplication NaturalAddition := by
  sorry

end LRA.Operation.Laws.Distributive
