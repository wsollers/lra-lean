import LRA.VolumeI.Function.Partial.Definition

namespace LRA.Function.Partial

universe u v

/--
**[Definition — ProperlyPartial]**

A partial map is properly partial when it is undefined somewhere.

Logical form:

```lean
def ProperlyPartial
    {Domain : Type u} {Codomain : Type v}
    (map : PartialFunction Domain Codomain) : Prop
```
-/
def ProperlyPartial
    {Domain : Type u} {Codomain : Type v}
    (map : PartialFunction Domain Codomain) : Prop :=
  exists input : Domain, ¬ map.DefinedAt input

end LRA.Function.Partial
