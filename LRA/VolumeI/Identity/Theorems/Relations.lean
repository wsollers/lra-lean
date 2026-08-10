import LRA.VolumeI.Identity.Theorems.Core
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.VolumeI.Identity

universe u

/-- TeX label: `def:identity-relation`. -/
abbrev IdentityRelation {Carrier : Type u} (left right : Carrier) : Prop :=
  LRA.VolumeI.Relations.IdentityRelation Carrier left right

/-- TeX label: `def:equality-relation`. -/
abbrev EqualityRelation (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  LRA.VolumeI.Relations.IdentityRelation Carrier

/-- Equality is reflexive as a named binary-relation predicate. -/
theorem EqualityRelationIsReflexive (Carrier : Type u) :
    LRA.VolumeI.Relations.Reflexive (EqualityRelation Carrier) := by
  intro element
  exact EqualityReflexivity element

/-- Equality is symmetric as a named binary-relation predicate. -/
theorem EqualityRelationIsSymmetric (Carrier : Type u) :
    LRA.VolumeI.Relations.Symmetric (EqualityRelation Carrier) := by
  intro left right ObjectsAreEqual
  exact EqualitySymmetry ObjectsAreEqual

/-- Equality is transitive as a named binary-relation predicate. -/
theorem EqualityRelationIsTransitive (Carrier : Type u) :
    LRA.VolumeI.Relations.Transitive (EqualityRelation Carrier) := by
  intro first second third FirstEqualsSecond SecondEqualsThird
  exact EqualityTransitivity FirstEqualsSecond SecondEqualsThird

/-- Equality is an equivalence relation. -/
theorem EqualityRelationIsEquivalence (Carrier : Type u) :
    LRA.VolumeI.Relations.Equivalence (EqualityRelation Carrier) := by
  exact ⟨
    EqualityRelationIsReflexive Carrier,
    EqualityRelationIsSymmetric Carrier,
    EqualityRelationIsTransitive Carrier⟩

end LRA.VolumeI.Identity
