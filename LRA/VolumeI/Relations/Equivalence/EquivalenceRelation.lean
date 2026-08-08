import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.VolumeI.Relations

universe u

/-- Equivalence-relation laws for an endorelation. -/
def EquivalenceRelation {Alpha : Type u}
    (relation : Endorelation Alpha) : Prop :=
  Reflexive relation /\ Symmetric relation /\ Transitive relation

end LRA.VolumeI.Relations
