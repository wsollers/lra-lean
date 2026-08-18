import LRA.Order.Morphisms.Monotone.Definition

namespace LRA.Order

universe u v w

/-- The identity map is monotone. -/
theorem MonotoneIdentity
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    Monotone relation relation (fun element => element) := by
  sorry

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
