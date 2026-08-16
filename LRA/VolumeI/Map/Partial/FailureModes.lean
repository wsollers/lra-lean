import LRA.VolumeI.Map.Partial.Definition

namespace LRA.Map.Partial

universe u v

/--
**[Definition — ProperlyPartial]**

A partial map is properly partial when it is undefined somewhere.

Logical form:

```lean
def ProperlyPartial
    {Domain : Type u} {Codomain : Type v}
    (map : PartialMap Domain Codomain) : Prop
```
-/
def ProperlyPartial
    {Domain : Type u} {Codomain : Type v}
    (map : PartialMap Domain Codomain) : Prop :=
  exists input : Domain, ¬ map.DefinedAt input

end LRA.Map.Partial
