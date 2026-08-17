import LRA.Identity.Equality
import LRA.Relation.Canonical.IdentityRelation.Definition
import LRA.Relation.Structures.Definition

namespace LRA.Relation

universe u

/-- The identity relation is an equivalence relation.

This is a relation-theoretic classification of equality. Raw equality laws are
owned by `LRA.Identity`; `LRA.Relation` owns the classification in relational
vocabulary.
-/
theorem IdentityRelationIsEquivalenceRelation {α : Type u} :
    EquivalenceRelation (IdentityRelation α) := by
  constructor
  · intro x
    exact LRA.Identity.EqualityReflexivity x
  constructor
  · intro x y h
    exact LRA.Identity.EqualitySymmetry h
  · intro x y z hxy hyz
    exact LRA.Identity.EqualityTransitivity hxy hyz

end LRA.Relation
