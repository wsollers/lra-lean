import LRA.VolumeI.Operations.Definition

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

universe u

/--
**[Definition — Commutative]**

Commutativity of a binary endo-operation.

Logical form:

```lean
def Commutative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop
```
-/
def Commutative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall first second, operation first second = operation second first

end LRA.Operation.Laws.Commutative
