import LRA.Order.Relation.Comparable.Definition

namespace LRA.Order

universe u v

                                                                         
                                           
def Chain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall first second,
    first ∈ subset ->
      second ∈ subset ->
        Comparable relation first second

end LRA.Order
