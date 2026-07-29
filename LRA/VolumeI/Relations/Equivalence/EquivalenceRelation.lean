import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.VolumeI.Relations

universe u

/-- Equivalence-relation laws for an endorelation. -/
def EquivalenceRelation {Alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation Alpha) : Prop :=
  Reflexive relation /\ Symmetric relation /\ Transitive relation

end LRA.VolumeI.Relations
