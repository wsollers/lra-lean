import LRA.VolumeI.Map.Bijective.Theorems
import LRA.VolumeI.Map.Bijective.Definition
import LRA.VolumeI.Map.Inverse.Definition
import LRA.VolumeI.Map.Inverse.Relationships

namespace LRA.Map.Bijective

open LRA.Map.Typed
open LRA.Map.Injective
open LRA.Map.Surjective

universe u v

/--
Bijectivity is exactly injectivity together with surjectivity.
-/
theorem BijectiveIffInjectiveAndSurjective
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Bijective map <-> Injective map /\ Surjective map :=
  Iff.rfl

/--
A map with a two-sided inverse is bijective.
-/
theorem BijectiveOfTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    {map : TypedMap Domain Codomain}
    {inverse : TypedMap Codomain Domain}
    (twoSidedInverse :
      LRA.Map.Inverse.TwoSidedInverse map inverse) :
    Bijective map :=
  LRA.Map.Inverse.InjectiveAndSurjectiveOfTwoSidedInverse twoSidedInverse

end LRA.Map.Bijective
