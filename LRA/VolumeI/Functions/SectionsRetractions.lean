import LRA.VolumeI.Functions.Inverses

namespace LRA.Function

universe u v

/-- A section is a right inverse. -/
def Section {Domain : Type u} {Codomain : Type v}
    (sectionMap : LRA.Function Codomain Domain)
    (map : LRA.Function Domain Codomain) : Prop :=
  RightInverse sectionMap map

/-- A retraction is a left inverse. -/
def Retraction {Domain : Type u} {Codomain : Type v}
    (retractionMap : LRA.Function Codomain Domain)
    (map : LRA.Function Domain Codomain) : Prop :=
  LeftInverse retractionMap map

end LRA.Function
