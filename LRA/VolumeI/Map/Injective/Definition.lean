import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Injective

open LRA.Map.Typed

universe u v

/--
A typed map is injective when equal outputs imply equal inputs.
-/
def Injective {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop :=
  forall first second, map first = map second -> first = second

end LRA.Map.Injective
