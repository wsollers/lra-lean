import LRA.VolumeI.Map.Operation.Laws.Distributive.Theorems

namespace LRA.Map.Operation.Laws.Distributive

open LRA.Map.Operation

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

end LRA.Map.Operation.Laws.Distributive
