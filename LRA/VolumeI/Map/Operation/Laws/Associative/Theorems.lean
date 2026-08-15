import LRA.VolumeI.Map.Operation.Laws.Associative.Definition

namespace LRA.Map.Operation.Laws.Associative

open LRA.Map.Operation

universe u

/--
Apply an associativity law to three elements.
-/
theorem Associative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation (operation first second) third =
      operation first (operation second third) :=
  law first second third

end LRA.Map.Operation.Laws.Associative
