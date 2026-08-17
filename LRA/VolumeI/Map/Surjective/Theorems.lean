import LRA.VolumeI.Map.Surjective.Definition
import LRA.VolumeI.Map.Fiber.Definition

namespace LRA.Map.Surjective

open LRA.Map.Typed
open LRA.Set

universe u v w

/--
**[Theorem — surjective_iff_standard]**

The LRA map definition agrees with Lean's standard surjectivity predicate.

Logical form:

```lean
theorem surjective_iff_standard
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Surjective map <-> _root_.Function.Surjective map
```
-/
theorem surjective_iff_standard
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Surjective map <-> _root_.Function.Surjective map := by
  rfl
/--
**[Definition — SurjectiveByFibers]**

Fiber formulation of surjectivity over an explicit ambient domain.

Logical form:

```lean
def SurjectiveByFibers
    {Element : Type u} {Codomain : Type v} {SetObject : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (map : TypedMap Element Codomain) : Prop
```
-/
def SurjectiveByFibers
    {Element : Type u} {Codomain : Type v} {SetObject : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (map : TypedMap Element Codomain) : Prop :=
  forall output : Codomain, exists input : Element,
    input ∈ LRA.Map.Fiber.AmbientFiber ambientDomain map output

end LRA.Map.Surjective
