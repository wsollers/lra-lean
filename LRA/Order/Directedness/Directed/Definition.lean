import LRA.Relation.Definition

namespace LRA.Order

universe u v

                                                                             
                                                                                 
def Directed
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  (exists element : Element, element ∈ subset) /\
    forall first second,
      first ∈ subset ->
        second ∈ subset ->
          exists upper,
            upper ∈ subset /\
              relation first upper /\ relation second upper

end LRA.Order
