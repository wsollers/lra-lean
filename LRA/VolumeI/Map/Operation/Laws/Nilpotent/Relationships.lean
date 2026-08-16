import LRA.VolumeI.Map.Operation.Laws.Nilpotent.Theorems

namespace LRA.Map.Operation.Laws.Nilpotent

open LRA.Map.Operation

universe u

/-- Nilpotence is preserved by equality of elements. -/
theorem NilpotentElement.respects_element_equality {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {zero first second : Carrier}
    (equal_elements : first = second)
    (law : NilpotentElement operation zero first) :
    NilpotentElement operation zero second := by
  sorry

end LRA.Map.Operation.Laws.Nilpotent
