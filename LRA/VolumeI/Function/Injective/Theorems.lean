import LRA.VolumeI.Function.Injective.Definition
import LRA.VolumeI.Function.Fiber.Definition

namespace LRA.Function.Injective

open LRA.Function
open LRA.Set

universe u v w

/--
**[Theorem — injective_iff_standard]**

The LRA map definition agrees with Lean's standard injectivity predicate.

Logical form:

```lean
theorem injective_iff_standard
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    Injective map <-> _root_.Function.Injective map
```
-/
theorem injective_iff_standard
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    Injective map <-> _root_.Function.Injective map := by
  sorry
/--
**[Definition — InjectiveByFibers]**

Fiber formulation of injectivity over an explicit ambient domain.

Logical form:

```lean
def InjectiveByFibers
    {Element : Type u} {Codomain : Type v} {SetObject : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (map : Function Element Codomain) : Prop
```
-/
def InjectiveByFibers
    {Element : Type u} {Codomain : Type v} {SetObject : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (map : Function Element Codomain) : Prop :=
  forall (output : Codomain) (left right : Element),
    left ∈ LRA.Function.Fiber.AmbientFiber ambientDomain map output ->
    right ∈ LRA.Function.Fiber.AmbientFiber ambientDomain map output ->
    left = right

end LRA.Function.Injective
