import LRA.VolumeI.Map.Inverse.Definition
import LRA.Function.Definition

namespace LRA.Map.Inverse


universe u v

/--
**[Definition — MultipleLeftInverses]**

A map has multiple left inverses when two distinct maps both undo it on the
left.

Logical form:

```lean
def MultipleLeftInverses
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) : Prop
```
-/
def MultipleLeftInverses
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) : Prop :=
  exists first second : LRA.Function Codomain Domain,
    first ≠ second /\ LeftInverse map first /\ LeftInverse map second

/--
**[Definition — MultipleRightInverses]**

A map has multiple right inverses when two distinct maps both split it on the
right.

Logical form:

```lean
def MultipleRightInverses
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) : Prop
```
-/
def MultipleRightInverses
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) : Prop :=
  exists first second : LRA.Function Codomain Domain,
    first ≠ second /\ RightInverse map first /\ RightInverse map second

end LRA.Map.Inverse
