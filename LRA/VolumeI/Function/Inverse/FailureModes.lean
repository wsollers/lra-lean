import LRA.VolumeI.Function.Inverse.Definition

namespace LRA.Function.Inverse

open LRA.Function

universe u v

/--
**[Definition — MultipleLeftInverses]**

A map has multiple left inverses when two distinct maps both undo it on the
left.

Logical form:

```lean
def MultipleLeftInverses
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop
```
-/
def MultipleLeftInverses
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop :=
  exists first second : Function Codomain Domain,
    first ≠ second /\ LeftInverse map first /\ LeftInverse map second

/--
**[Definition — MultipleRightInverses]**

A map has multiple right inverses when two distinct maps both split it on the
right.

Logical form:

```lean
def MultipleRightInverses
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop
```
-/
def MultipleRightInverses
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop :=
  exists first second : Function Codomain Domain,
    first ≠ second /\ RightInverse map first /\ RightInverse map second

end LRA.Function.Inverse
