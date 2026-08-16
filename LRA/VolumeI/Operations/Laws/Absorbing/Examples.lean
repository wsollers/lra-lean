import LRA.VolumeI.Operations.Laws.Absorbing.Theorems

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

/-- Boolean conjunction as a concrete absorbing-element example. -/
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right

/--
**[Example — BooleanFalseIsTwoSidedAbsorbingForAnd]**

`false` is a two-sided absorbing element for Boolean conjunction.
-/
theorem BooleanFalseIsTwoSidedAbsorbingForAnd :
    TwoSidedAbsorbing BooleanAndOperation false := by
  sorry

/-- Boolean disjunction as a concrete absorbing-element example. -/
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right

/--
**[Example — BooleanTrueIsTwoSidedAbsorbingForOr]**

`true` is a two-sided absorbing element for Boolean disjunction.
-/
theorem BooleanTrueIsTwoSidedAbsorbingForOr :
    TwoSidedAbsorbing BooleanOrOperation true := by
  sorry

end LRA.Operation.Laws.Absorbing
