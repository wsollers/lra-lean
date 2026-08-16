import LRA.VolumeI.Map.Bijective.Definition
import LRA.VolumeI.Map.Injective.FailureModes
import LRA.VolumeI.Map.Surjective.FailureModes

namespace LRA.Map.Bijective

open LRA.Map.Typed

universe u v

/--
A map fails to be bijective when it has either a collision or a missed value.
-/
def FailsBijective
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop :=
  LRA.Map.Injective.HasCollision map \/
    LRA.Map.Surjective.MissesValue map

end LRA.Map.Bijective
