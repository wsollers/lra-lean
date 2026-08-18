import LRA.VolumeI.Function.Extension.Definition

namespace LRA.Function.Extension

open LRA.Function

universe u v w

/--
**[Definition — MultipleExtensions]**

An original map has multiple extensions along an inclusion-like map when two
distinct extensions both agree with it on the included domain.

Logical form:

```lean
def MultipleExtensions
    {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w}
    (original : Function SmallDomain Codomain)
    (inclusion : Function SmallDomain LargeDomain) : Prop
```
-/
def MultipleExtensions
    {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w}
    (original : Function SmallDomain Codomain)
    (inclusion : Function SmallDomain LargeDomain) : Prop :=
  exists first second : Function LargeDomain Codomain,
    first ≠ second /\
      Extends first original inclusion /\
      Extends second original inclusion

end LRA.Function.Extension
