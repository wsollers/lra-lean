import LRA.VolumeI.Operations.Laws.Associative.Definition

namespace LRA.Operation.Laws.Associative

open LRA.Operation

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

/--
**[Theorem — Associative.reassociate_left]**

Use associativity to move one pair of parentheses from the left to the right.
-/
theorem Associative.reassociate_left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation (operation first second) third =
      operation first (operation second third) := by
  sorry

/--
**[Theorem — Associative.reassociate_right]**

Use associativity to move one pair of parentheses from the right to the left.
-/
theorem Associative.reassociate_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation first (operation second third) =
      operation (operation first second) third := by
  sorry

/--
**[Theorem — Associative.four_left]**

Reassociate four entries from fully left-associated form to fully
right-associated form.
-/
theorem Associative.four_left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third fourth : Carrier) :
    operation (operation (operation first second) third) fourth =
      operation first (operation second (operation third fourth)) := by
  sorry

/--
**[Theorem — Associative.four_right]**

Reassociate four entries from fully right-associated form to fully
left-associated form.
-/
theorem Associative.four_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third fourth : Carrier) :
    operation first (operation second (operation third fourth)) =
      operation (operation (operation first second) third) fourth := by
  sorry
end LRA.Operation.Laws.Associative
