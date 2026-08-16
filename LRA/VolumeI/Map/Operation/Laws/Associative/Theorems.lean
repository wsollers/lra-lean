import LRA.VolumeI.Map.Operation.Laws.Associative.Definition

namespace LRA.Map.Operation.Laws.Associative

open LRA.Map.Operation

universe u

/--
**[Theorem — Associative]**

Apply an associativity law to three elements.

Logical form:

```lean
theorem Associative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation (operation first second) third =
      operation first (operation second third)
```
-/
theorem Associative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation (operation first second) third =
      operation first (operation second third) := by
  sorry
end LRA.Map.Operation.Laws.Associative
