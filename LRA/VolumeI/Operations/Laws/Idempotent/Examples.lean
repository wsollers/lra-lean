import LRA.VolumeI.Operations.Laws.Idempotent.Theorems

namespace LRA.Operation.Laws.Idempotent

open LRA.Operation

/-- Boolean disjunction as a concrete idempotence example. -/
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right

/--
**[Example — BooleanOrIdempotent]**

Boolean disjunction is idempotent.
-/
theorem BooleanOrIdempotent :
    Idempotent BooleanOrOperation := by
  sorry

/-- Boolean conjunction as a concrete idempotence example. -/
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right

/--
**[Example — BooleanAndIdempotent]**

Boolean conjunction is idempotent.
-/
theorem BooleanAndIdempotent :
    Idempotent BooleanAndOperation := by
  sorry

end LRA.Operation.Laws.Idempotent
