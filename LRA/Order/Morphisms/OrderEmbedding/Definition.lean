import LRA.Morphism.Properties.RelationEmbedding.Definition
import LRA.Order.Morphisms.Monotone.Definition

namespace LRA.Order

universe u v

/-- An order embedding preserves and reflects the displayed relation.

It preserves two pieces of structure at once and adds no data, so it is the
conjunction of generic predicates supplied by
`LRA.Morphism.PreservesAndReflectsRelation`. Note that it does *not* require
injectivity: injectivity follows once the source relation is antisymmetric,
which is why the generic `LRA.Morphism.RelationEmbedding` asks for it
separately. -/
def OrderEmbedding
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesAndReflectsRelation map sourceRelation targetRelation

end LRA.Order
