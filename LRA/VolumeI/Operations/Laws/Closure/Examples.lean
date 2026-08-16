import LRA.VolumeI.Operations.Laws.Closure.Theorems

namespace LRA.Operation.Laws.Closure

open LRA.Operation

/-- Natural-number addition as the running full-carrier closure example. -/
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
**[Example — NaturalAdditionClosedOnFullCarrier]**

Natural-number addition is closed on the full natural-number carrier.
-/
theorem NaturalAdditionClosedOnFullCarrier :
    BinaryEndoClosedOn (fun _ : Nat => True) NaturalAddition := by
  sorry

end LRA.Operation.Laws.Closure
