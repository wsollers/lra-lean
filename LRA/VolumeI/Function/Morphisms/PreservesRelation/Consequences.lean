import LRA.VolumeI.Function.Morphisms.PreservesRelation.Theorems

namespace LRA.Function.Morphisms

universe u v

/-- Relation preservation is monotonicity for the displayed relations. -/
theorem PreservesRelation.is_monotone
    {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (preserves : PreservesRelation map sourceRelation targetRelation) :
    LRA.Order.Monotone sourceRelation targetRelation map :=
  preserves

end LRA.Function.Morphisms
