import LRA.VolumeI.Function.Typed.Definition

namespace LRA.Function.Section

open LRA.Function

universe u v

/--
**[Definition — SectionOf]**

A section of a map chooses a preimage of every codomain element.

Logical form:

```lean
def SectionOf {Domain : Type u} {Codomain : Type v}
    (sectionMap : Function Codomain Domain)
    (map : Function Domain Codomain) : Prop
```
-/
def SectionOf {Domain : Type u} {Codomain : Type v}
    (sectionMap : Function Codomain Domain)
    (map : Function Domain Codomain) : Prop :=
  forall output, map (sectionMap output) = output

end LRA.Function.Section
