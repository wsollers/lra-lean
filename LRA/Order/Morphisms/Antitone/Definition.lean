import LRA.Morphism.Properties.PreservesRelation.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Order

universe u v

/-- A function is antitone when it reverses the displayed relations.

Reversing the target relation is the same as preserving its converse, so this
is again a specialization of `LRA.Morphism.PreservesRelation` rather than a
fresh quantifier. -/
def Antitone
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesRelation map sourceRelation
    (LRA.Relation.Converse targetRelation)

end LRA.Order
