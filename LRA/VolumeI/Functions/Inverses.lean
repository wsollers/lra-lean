import LRA.VolumeI.Functions.Composition
import LRA.VolumeI.Functions.IdentityFunction

namespace LRA.VolumeI.Functions

universe u

/-- A left inverse for a function. -/
def LeftInverse {Domain Codomain : Type u}
    (inverseMap : Codomain -> Domain)
    (map : Domain -> Codomain) : Prop :=
  Composition inverseMap map = IdentityFunction Domain

/-- A right inverse for a function. -/
def RightInverse {Domain Codomain : Type u}
    (inverseMap : Codomain -> Domain)
    (map : Domain -> Codomain) : Prop :=
  Composition map inverseMap = IdentityFunction Codomain

end LRA.VolumeI.Functions
