import LRA.VolumeI.Map.Operation.Laws.Idempotent.Definition

namespace LRA.Map.Operation.Laws.Idempotent

open LRA.Map.Operation

universe u

/--
**[Theorem — Idempotent]**

Apply an idempotence law to an element.

Logical form:

```lean
theorem Idempotent.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Idempotent operation)
    (element : Carrier) :
    operation element element = element
```
-/
theorem Idempotent.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Idempotent operation)
    (element : Carrier) :
    operation element element = element := by
  sorry
end LRA.Map.Operation.Laws.Idempotent
