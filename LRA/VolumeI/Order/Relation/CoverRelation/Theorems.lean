import LRA.VolumeI.Order.Relation.CoverRelation.Definition

namespace LRA.Order

universe u

/-- Every cover pair is related by the underlying strict relation. -/
theorem CoverRelationImpliesStrictRelation
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    {lower upper : Alpha}
    (lowerIsCoveredByUpper : CoverRelation strictRelation lower upper) :
    strictRelation lower upper :=
  lowerIsCoveredByUpper.1

/-!
For finite posets, the order is the reflexive-transitive closure of its cover
relation. That theorem is deferred until the planned finite-carrier interface
is available.
-/

end LRA.Order
