import LRA.Relation.Definition

namespace LRA.Relation
universe u

                              
def RelationUnion {α : Type u} (R S : Endorelation α) : Endorelation α := fun x y => R x y ∨ S x y
                                     
def RelationIntersection {α : Type u} (R S : Endorelation α) : Endorelation α := fun x y => R x y ∧ S x y
                                                               
def RelationComplement {α : Type u} (R : Endorelation α) : Endorelation α := fun x y => ¬ R x y
                                   
def RelationDifference {α : Type u} (R S : Endorelation α) : Endorelation α := fun x y => R x y ∧ ¬ S x y
                                             
def RelationSymmetricDifference {α : Type u} (R S : Endorelation α) : Endorelation α :=
  fun x y => (R x y ∧ ¬ S x y) ∨ (S x y ∧ ¬ R x y)

end LRA.Relation
