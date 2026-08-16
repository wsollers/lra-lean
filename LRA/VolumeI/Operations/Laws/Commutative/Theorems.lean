import LRA.VolumeI.Operations.Laws.Commutative.Definition

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

universe u

/--
**[Theorem — Commutative]**

Apply a commutativity law to two elements.

Logical form:

```lean
theorem Commutative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Commutative operation)
    (first second : Carrier) :
    operation first second = operation second first
```
-/
theorem Commutative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Commutative operation)
    (first second : Carrier) :
    operation first second = operation second first := by
  sorry

/--
**[Theorem — Commutative.symm_apply]**

Apply a commutativity law in the reverse displayed direction.
-/
theorem Commutative.symm_apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Commutative operation)
    (first second : Carrier) :
    operation second first = operation first second := by
  sorry
end LRA.Operation.Laws.Commutative
