import LRA.VolumeI.Map.Operation.Laws.Closure.Theorems

namespace LRA.Map.Operation.Laws.Closure

open LRA.Map.Operation

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

end LRA.Map.Operation.Laws.Closure
