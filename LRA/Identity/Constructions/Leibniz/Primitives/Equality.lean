import LRA.Identity.Constructions.Leibniz.Axioms
import LRA.Identity.Interface.Definitions.Equality
import LRA.Relation.Structures.Definition

namespace LRA.Identity

universe u

theorem EqualitySymmetry {Carrier : Type u} {left right : Carrier}
    (ObjectsAreIdentical : left = right) :
    right = left := by
  symm
  exact ObjectsAreIdentical

theorem EqualityTransitivity {Carrier : Type u} {first second third : Carrier}
    (FirstEqualsSecond : first = second)
    (SecondEqualsThird : second = third) :
    first = third := by
  -- Goal: ⊢ third = first
  symm
  have secondEqualsFirst := FirstEqualsSecond.symm
  exact (LeibnizLaw SecondEqualsThird (fun x => x = first)).mp secondEqualsFirst

theorem EqualityRelationIsReflexive (Carrier : Type u) :
    LRA.Relation.Reflexive (EqualityRelation Carrier) := by
  intro x
  rfl

theorem EqualityRelationIsSymmetric (Carrier : Type u) :
    LRA.Relation.Symmetric (EqualityRelation Carrier) := by
  intro x
  intro z
  intro hypo
  have zEqualsX := hypo.symm
  exact zEqualsX

theorem EqualityRelationIsTransitive (Carrier : Type u) :
    LRA.Relation.Transitive (EqualityRelation Carrier) := by
  intro x
  intro y
  intro z
  intro xEqualsY
  intro yEqualsZ
  exact xEqualsY.trans yEqualsZ

theorem EqualityRelationIsEquivalence (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier) := by
  constructor
  · exact EqualityRelationIsReflexive Carrier
  · constructor
    · exact EqualityRelationIsSymmetric Carrier
    · exact EqualityRelationIsTransitive Carrier

end LRA.Identity
