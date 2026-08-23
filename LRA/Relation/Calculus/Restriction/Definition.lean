import LRA.Relation.Definition
import LRA.Set.SetClass.Definition

namespace LRA.Relation

open LRA.Set
universe u v

                                                         
def RestrictDomain {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (A : SetClass X) :
    HeterogeneousBinaryRelation X Y :=
  fun x y => A x ∧ R x y

                                                         
def RestrictCodomain {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (B : SetClass Y) :
    HeterogeneousBinaryRelation X Y :=
  fun x y => R x y ∧ B y

                                                                       
def Restrict {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (A : SetClass X) (B : SetClass Y) :
    HeterogeneousBinaryRelation X Y :=
  fun x y => A x ∧ R x y ∧ B y

end LRA.Relation
