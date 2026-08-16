import LRA.VolumeI.Map.Operation.Laws.Idempotent.Theorems

namespace LRA.Map.Operation.Laws.Idempotent

open LRA.Map.Operation

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

end LRA.Map.Operation.Laws.Idempotent
