import LRA.VolumeI.Map.Operation.Definition

namespace LRA.Map.Operation.Laws.Idempotent

open LRA.Map.Operation

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

end LRA.Map.Operation.Laws.Idempotent
