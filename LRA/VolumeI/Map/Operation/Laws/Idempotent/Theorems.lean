import LRA.VolumeI.Map.Operation.Laws.Idempotent.Definition

namespace LRA.Map.Operation.Laws.Idempotent

open LRA.Map.Operation

universe u

/--
Apply an idempotence law to an element.
-/
theorem Idempotent.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Idempotent operation)
    (element : Carrier) :
    operation element element = element :=
  law element

end LRA.Map.Operation.Laws.Idempotent
