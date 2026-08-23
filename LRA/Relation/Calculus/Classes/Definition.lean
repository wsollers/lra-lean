import LRA.Relation.Definition
import LRA.Set.SetClass.Definition

namespace LRA.Relation

open LRA.Set
universe u v

                                                            
def DomainClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) : SetClass X :=
  fun x => ∃ y, R x y

                                                           
def RangeClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) : SetClass Y :=
  fun y => ∃ x, R x y

                                                           
def PointImageClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (x : X) : SetClass Y :=
  fun y => R x y

                                                          
def ImageClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (A : SetClass X) : SetClass Y :=
  fun y => ∃ x, A x ∧ R x y

                                                             
def PreimageClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (B : SetClass Y) : SetClass X :=
  fun x => ∃ y, B y ∧ R x y

                                                            
def FiberClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (y : Y) : SetClass X :=
  fun x => R x y

                                                                   
abbrev LeftSectionClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (y : Y) : SetClass X := FiberClass R y

                                                  
abbrev RightSectionClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (x : X) : SetClass Y := PointImageClass R x

end LRA.Relation
