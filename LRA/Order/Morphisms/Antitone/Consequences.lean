import LRA.Order.Morphisms.Antitone.Definition
import LRA.Order.Morphisms.Monotone.Definition

namespace LRA.Order

universe u v w

                                                      
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
