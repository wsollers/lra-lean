import LRA.VolumeI.Order.Morphisms.Monotone.Definition

namespace LRA.Order

universe u v w

/-- Monotone maps compose. -/
theorem MonotoneComp
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsMonotone : Monotone sourceRelation middleRelation firstMap)
    (secondMapIsMonotone : Monotone middleRelation targetRelation secondMap) :
    Monotone sourceRelation targetRelation (fun x => secondMap (firstMap x)) := by
  sorry

end LRA.Order
