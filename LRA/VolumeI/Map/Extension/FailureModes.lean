import LRA.VolumeI.Map.Extension.Definition

namespace LRA.Map.Extension

open LRA.Map.Typed

universe u v w

/--
**[Definition — MultipleExtensions]**

An original map has multiple extensions along an inclusion-like map when two
distinct extensions both agree with it on the included domain.

Logical form:

```lean
def MultipleExtensions
    {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w}
    (original : TypedMap SmallDomain Codomain)
    (inclusion : TypedMap SmallDomain LargeDomain) : Prop
```
-/
def MultipleExtensions
    {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w}
    (original : TypedMap SmallDomain Codomain)
    (inclusion : TypedMap SmallDomain LargeDomain) : Prop :=
  exists first second : TypedMap LargeDomain Codomain,
    first ≠ second /\
      Extends first original inclusion /\
      Extends second original inclusion

end LRA.Map.Extension
