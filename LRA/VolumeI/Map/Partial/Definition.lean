import LRA.VolumeI.Map.Typed.Definition
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.Map.Partial

open LRA.Map.Typed

universe u v

/--
A partial map is a domain-of-definition predicate with a value on every
defined input.
-/
structure PartialMap (Domain : Type u) (Codomain : Type v) where
  DefinedAt : Domain -> Prop
  value : forall input, DefinedAt input -> Codomain

/--
A partial map from a carrier to itself.
-/
abbrev PartialEndomap (Carrier : Type u) :=
  PartialMap Carrier Carrier

/--
The graph relation of a partial map.
-/
def Graph {Domain : Type u} {Codomain : Type v}
    (map : PartialMap Domain Codomain) :
    LRA.Relation.HeterogeneousRelation Domain Codomain :=
  fun input output => exists defined : map.DefinedAt input,
    map.value input defined = output

end LRA.Map.Partial
