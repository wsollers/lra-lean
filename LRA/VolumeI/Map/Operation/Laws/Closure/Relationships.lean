import LRA.VolumeI.Map.Operation.Laws.Closure.Theorems

namespace LRA.Map.Operation.Laws.Closure

open LRA.Map.Operation

universe u

/--
**[Theorem — BinaryEndoClosedOn]**

Subcarrier closure is exactly binary closure with the same predicate in all
three positions.
-/
theorem BinaryEndoClosedOn.iff_binary_closed_under {Ambient : Type u}
    {carrier : Ambient -> Prop}
    {operation : BinaryEndoOperation Ambient} :
    BinaryEndoClosedOn carrier operation <->
      BinaryClosedUnder carrier carrier carrier operation := by
  sorry

end LRA.Map.Operation.Laws.Closure
