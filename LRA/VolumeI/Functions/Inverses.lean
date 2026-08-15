import LRA.VolumeI.Functions.Composition
import LRA.VolumeI.Functions.IdentityFunction

namespace LRA.Function

universe u v

/-- A left inverse for a typed function. -/
def LeftInverse {Domain : Type u} {Codomain : Type v}
    (inverseMap : LRA.Function Codomain Domain)
    (map : LRA.Function Domain Codomain) : Prop :=
  Composition inverseMap map = IdentityFunction Domain

/-- A right inverse for a typed function. -/
def RightInverse {Domain : Type u} {Codomain : Type v}
    (inverseMap : LRA.Function Codomain Domain)
    (map : LRA.Function Domain Codomain) : Prop :=
  Composition map inverseMap = IdentityFunction Codomain

end LRA.Function
