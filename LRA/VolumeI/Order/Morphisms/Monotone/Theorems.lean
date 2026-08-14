import LRA.VolumeI.Order.Morphisms.Monotone.Definition

namespace LRA.VolumeI.Order

universe u v w

/-- Monotone maps compose. -/
theorem MonotoneComp
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    {middleRelation : LRA.VolumeI.Relations.Endorelation Beta}
    {targetRelation : LRA.VolumeI.Relations.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsMonotone : Monotone sourceRelation middleRelation firstMap)
    (secondMapIsMonotone : Monotone middleRelation targetRelation secondMap) :
    Monotone sourceRelation targetRelation (fun x => secondMap (firstMap x)) := by
  sorry

end LRA.VolumeI.Order
