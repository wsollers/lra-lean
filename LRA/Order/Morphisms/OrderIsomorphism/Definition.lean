import LRA.Order.Morphisms.OrderEmbedding.Definition

namespace LRA.Order

universe u v

                                                                                                    
def OrderIsomorphism
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (forward : Alpha -> Beta) (inverse : Beta -> Alpha) : Prop :=
  (forall source, inverse (forward source) = source) /\
    (forall target, forward (inverse target) = target) /\
      OrderEmbedding sourceRelation targetRelation forward

end LRA.Order
