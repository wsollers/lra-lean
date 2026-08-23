import LRA.Operation.Laws.Idempotent.Theorems

namespace LRA.Operation.Laws.Idempotent

open LRA.Operation

universe u

                                                                           
theorem Idempotent.fixed_by_self_operation {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Idempotent operation)
    (element : Carrier) :
    operation element element = element := by
  sorry

end LRA.Operation.Laws.Idempotent
