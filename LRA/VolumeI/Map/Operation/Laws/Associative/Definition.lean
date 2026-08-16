import LRA.VolumeI.Map.Operation.Definition

namespace LRA.Map.Operation.Laws.Associative

open LRA.Map.Operation

universe u

/--
**[Definition — Associative]**

Associativity of a binary endo-operation.

Logical form:

```lean
def Associative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop
```
-/
def Associative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall first second third,
    operation (operation first second) third =
      operation first (operation second third)

end LRA.Map.Operation.Laws.Associative
