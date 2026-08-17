import LRA.Relation.Definition
import LRA.Set.SetClass.Definition

namespace LRA.Relation

open LRA.Set
universe u v

/-- Domain of a relation, as a backend-neutral set class. -/
def DomainClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) : SetClass X :=
  fun x => ∃ y, R x y

/-- Range of a relation, as a backend-neutral set class. -/
def RangeClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) : SetClass Y :=
  fun y => ∃ x, R x y

/-- Point image (right section) of `x` under a relation. -/
def PointImageClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (x : X) : SetClass Y :=
  fun y => R x y

/-- Image of a class of source points under a relation. -/
def ImageClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (A : SetClass X) : SetClass Y :=
  fun y => ∃ x, A x ∧ R x y

/-- Preimage of a class of target points under a relation. -/
def PreimageClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (B : SetClass Y) : SetClass X :=
  fun x => ∃ y, B y ∧ R x y

/-- Fiber over `y`; equivalently the left section at `y`. -/
def FiberClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (y : Y) : SetClass X :=
  fun x => R x y

/-- Left section is a synonym for the fiber over a target point. -/
abbrev LeftSectionClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (y : Y) : SetClass X := FiberClass R y

/-- Right section is a synonym for point image. -/
abbrev RightSectionClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (x : X) : SetClass Y := PointImageClass R x

end LRA.Relation
