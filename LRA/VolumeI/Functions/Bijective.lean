import LRA.VolumeI.Functions.Injective
import LRA.VolumeI.Functions.Surjective

namespace LRA.Function

universe u v

/-- Bijectivity of a typed function. -/
def Bijective {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) : Prop :=
  Injective map ∧ Surjective map

end LRA.Function
