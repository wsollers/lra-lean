import LRA.VolumeI.Operations.Laws.Closure.Theorems

namespace LRA.Operation.Laws.Closure

open LRA.Operation

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

end LRA.Operation.Laws.Closure
