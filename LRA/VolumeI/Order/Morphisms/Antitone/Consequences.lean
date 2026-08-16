import LRA.VolumeI.Order.Morphisms.Antitone.Definition
import LRA.VolumeI.Order.Morphisms.Monotone.Definition

namespace LRA.Order

universe u v w

/-- The composite of two antitone maps is monotone. -/
theorem Antitone.comp_antitone_is_monotone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {first : Alpha -> Beta}
    {second : Beta -> Gamma}
    (firstAntitone : Antitone sourceRelation middleRelation first)
    (secondAntitone : Antitone middleRelation targetRelation second) :
    Monotone sourceRelation targetRelation
      (fun input => second (first input)) := by
  sorry

end LRA.Order
