import LRA.VolumeI.Operations.Definition

namespace LRA.Operation.Laws.Idempotent

open LRA.Operation

universe u

/--
**[Definition — Idempotent]**

Idempotence of a binary endo-operation.

Logical form:

```lean
def Idempotent {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop
```
-/
def Idempotent {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall element, operation element element = element

end LRA.Operation.Laws.Idempotent
