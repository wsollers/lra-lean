import LRA.VolumeI.Map.Composition.Definition
import LRA.VolumeI.Map.Identity.Definition

namespace LRA.Map.Composition

open LRA.Map.Typed
open LRA.Map.Identity

universe u v w x

/--
Evaluation of composition.
-/
theorem ComposeApply
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : TypedMap Middle Codomain)
    (first : TypedMap Domain Middle)
    (input : Domain) :
    Compose second first input = second (first input) :=
  rfl

/--
Left identity law for composition.
-/
theorem ComposeLeftIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Compose (IdentityMap Codomain) map = map :=
  rfl

/--
Right identity law for composition.
-/
theorem ComposeRightIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Compose map (IdentityMap Domain) = map :=
  rfl

/--
Associativity of composition.
-/
theorem ComposeAssociative
    {A : Type u} {B : Type v} {C : Type w} {D : Type x}
    (third : TypedMap C D)
    (second : TypedMap B C)
    (first : TypedMap A B) :
    Compose third (Compose second first) =
      Compose (Compose third second) first :=
  rfl

end LRA.Map.Composition
