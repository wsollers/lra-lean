import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Inverse

open LRA.Map.Typed

universe u v

/--
`inverse` is a left inverse of `map` when it recovers every input after
applying `map`.
-/
def LeftInverse {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain) : Prop :=
  forall input, inverse (map input) = input

/--
`inverse` is a right inverse of `map` when `map` recovers every codomain value
after applying `inverse`.
-/
def RightInverse {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain) : Prop :=
  forall output, map (inverse output) = output

/--
`inverse` is a two-sided inverse of `map`.
-/
def TwoSidedInverse {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain) : Prop :=
  LeftInverse map inverse /\ RightInverse map inverse

end LRA.Map.Inverse
