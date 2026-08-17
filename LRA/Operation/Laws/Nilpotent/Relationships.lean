import LRA.Operation.Laws.Nilpotent.Theorems

namespace LRA.Operation.Laws.Nilpotent

open LRA.Operation

universe u

theorem NilpotentElement.respects_element_equality {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {zero first second : Carrier}
    (equal_elements : first = second)
    (law : NilpotentElement operation zero first) :
    NilpotentElement operation zero second := by
  sorry

end LRA.Operation.Laws.Nilpotent
