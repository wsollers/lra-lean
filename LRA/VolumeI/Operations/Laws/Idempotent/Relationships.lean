import LRA.VolumeI.Operations.Laws.Idempotent.Theorems

namespace LRA.Operation.Laws.Idempotent

open LRA.Operation

universe u

/--
**[Theorem — Idempotent.fixed_by_self_operation]**

Idempotence says every element is fixed by combining it with itself.
-/
theorem Idempotent.fixed_by_self_operation {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Idempotent operation)
    (element : Carrier) :
    operation element element = element := by
  sorry

end LRA.Operation.Laws.Idempotent
