import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Fiber.Definition

namespace LRA.Map.Injective

open LRA.Map.Typed
open LRA.Set

universe u v w

/--
The LRA map definition agrees with Lean's standard injectivity predicate.
-/
theorem injective_iff_standard
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Injective map <-> _root_.Function.Injective map :=
  Iff.rfl

/--
Fiber formulation of injectivity over an explicit ambient domain.
-/
def InjectiveByFibers
    {Element : Type u} {Codomain : Type v} {SetObject : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (map : TypedMap Element Codomain) : Prop :=
  forall (output : Codomain) (left right : Element),
    left ∈ LRA.Map.Fiber.AmbientFiber ambientDomain map output ->
    right ∈ LRA.Map.Fiber.AmbientFiber ambientDomain map output ->
    left = right

end LRA.Map.Injective
