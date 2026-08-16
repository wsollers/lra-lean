import LRA.VolumeI.Map.Operation.Laws.Cancellation.Theorems

namespace LRA.Map.Operation.Laws.Cancellation

open LRA.Map.Operation

/-- Natural-number addition as the running cancellation example. -/
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
**[Example — NaturalAdditionTwoSidedCancellative]**

Natural-number addition is two-sided cancellative.
-/
theorem NaturalAdditionTwoSidedCancellative :
    TwoSidedCancellative NaturalAddition := by
  sorry

/-- Natural-number multiplication as a restricted cancellation example. -/
def NaturalMultiplicationForRestrictedCancellation : BinaryEndoOperation Nat :=
  fun left right => left * right

/-- Natural-number multiplication is left-cancellative after excluding zero. -/
theorem NaturalMultiplicationLeftCancellativeOnNonzero :
    LeftCancellativeOn
      (fun fixed : Nat => fixed ≠ 0)
      NaturalMultiplicationForRestrictedCancellation := by
  sorry

/-- Natural-number multiplication is right-cancellative after excluding zero. -/
theorem NaturalMultiplicationRightCancellativeOnNonzero :
    RightCancellativeOn
      (fun fixed : Nat => fixed ≠ 0)
      NaturalMultiplicationForRestrictedCancellation := by
  sorry

end LRA.Map.Operation.Laws.Cancellation
