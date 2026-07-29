import LRA.VolumeI.Functions.Inverses

namespace LRA.VolumeI.Functions

universe u

/-- A section is a right inverse. -/
def Section {Domain Codomain : Type u}
    (sectionMap : Codomain -> Domain)
    (map : Domain -> Codomain) : Prop :=
  RightInverse sectionMap map

/-- A retraction is a left inverse. -/
def Retraction {Domain Codomain : Type u}
    (retractionMap : Codomain -> Domain)
    (map : Domain -> Codomain) : Prop :=
  LeftInverse retractionMap map

end LRA.VolumeI.Functions
