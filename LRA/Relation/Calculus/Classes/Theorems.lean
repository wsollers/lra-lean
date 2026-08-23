import LRA.Relation.Calculus.Classes.Definition

namespace LRA.Relation

open LRA.Set
universe u v

                                                         
theorem PointImageClassIsSingletonImage {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (x : X) :
    ImageClass R (fun z => z = x) = PointImageClass R x := by
  sorry

                                                      
theorem FiberClassIsSingletonPreimage {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (y : Y) :
    PreimageClass R (fun z => z = y) = FiberClass R y := by
  sorry

end LRA.Relation
