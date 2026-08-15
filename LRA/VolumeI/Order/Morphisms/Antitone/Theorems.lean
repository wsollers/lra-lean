import LRA.VolumeI.Order.Morphisms.Antitone.Definition
import LRA.VolumeI.Order.Morphisms.Monotone.Definition

namespace LRA.Order

universe u v w

/-- Composing two antitone maps produces a monotone map. -/
theorem AntitoneCompAntitoneIsMonotone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsAntitone : Antitone sourceRelation middleRelation firstMap)
    (secondMapIsAntitone : Antitone middleRelation targetRelation secondMap) :
    Monotone sourceRelation targetRelation
      (fun element => secondMap (firstMap element)) := by
  sorry

/-- An antitone map followed by a monotone map is antitone. -/
theorem AntitoneThenMonotoneIsAntitone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsAntitone : Antitone sourceRelation middleRelation firstMap)
    (secondMapIsMonotone : Monotone middleRelation targetRelation secondMap) :
    Antitone sourceRelation targetRelation
      (fun element => secondMap (firstMap element)) := by
  sorry

/-- A monotone map followed by an antitone map is antitone. -/
theorem MonotoneThenAntitoneIsAntitone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsMonotone : Monotone sourceRelation middleRelation firstMap)
    (secondMapIsAntitone : Antitone middleRelation targetRelation secondMap) :
    Antitone sourceRelation targetRelation
      (fun element => secondMap (firstMap element)) := by
  sorry

end LRA.Order
