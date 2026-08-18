import LRA.VolumeI.Function.Typed.Definition

namespace LRA.Function.Extension

open LRA.Function

universe u v w

/--
**[Definition — Extends]**

`extension` extends `original` along an inclusion-like map.

Logical form:

```lean
def Extends {SmallDomain : Type u} {LargeDomain : Type v}
    {Codomain : Type w}
    (extension : Function LargeDomain Codomain)
    (original : Function SmallDomain Codomain)
    (inclusion : Function SmallDomain LargeDomain) : Prop
```
-/
def Extends {SmallDomain : Type u} {LargeDomain : Type v}
    {Codomain : Type w}
    (extension : Function LargeDomain Codomain)
    (original : Function SmallDomain Codomain)
    (inclusion : Function SmallDomain LargeDomain) : Prop :=
  forall input, extension (inclusion input) = original input

end LRA.Function.Extension
