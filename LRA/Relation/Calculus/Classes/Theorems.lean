import LRA.Relation.Calculus.Classes.Definition

namespace LRA.Relation

open LRA.Set
universe u v

/-- A point image is the image of the singleton class. -/
theorem PointImageClassIsSingletonImage {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (x : X) :
    ImageClass R (fun z => z = x) = PointImageClass R x := by
  funext y
  apply propext
  constructor
  · rintro ⟨z, rfl, h⟩
    exact h
  · intro h
    exact ⟨x, rfl, h⟩

/-- A fiber is the preimage of the singleton class. -/
theorem FiberClassIsSingletonPreimage {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (y : Y) :
    PreimageClass R (fun z => z = y) = FiberClass R y := by
  funext x
  apply propext
  constructor
  · rintro ⟨z, rfl, h⟩
    exact h
  · intro h
    exact ⟨y, rfl, h⟩

end LRA.Relation
