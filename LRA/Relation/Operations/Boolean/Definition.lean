import LRA.Relation.Definition

namespace LRA.Relation
universe u

/-- Union of endorelations. -/
def RelationUnion {α : Type u} (R S : Endorelation α) : Endorelation α := fun x y => R x y ∨ S x y
/-- Intersection of endorelations. -/
def RelationIntersection {α : Type u} (R S : Endorelation α) : Endorelation α := fun x y => R x y ∧ S x y
/-- Complement inside the universal relation on the carrier. -/
def RelationComplement {α : Type u} (R : Endorelation α) : Endorelation α := fun x y => ¬ R x y
/-- Difference of endorelations. -/
def RelationDifference {α : Type u} (R S : Endorelation α) : Endorelation α := fun x y => R x y ∧ ¬ S x y
/-- Symmetric difference of endorelations. -/
def RelationSymmetricDifference {α : Type u} (R S : Endorelation α) : Endorelation α :=
  fun x y => (R x y ∧ ¬ S x y) ∨ (S x y ∧ ¬ R x y)

end LRA.Relation
