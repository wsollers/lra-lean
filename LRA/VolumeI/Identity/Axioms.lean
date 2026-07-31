import LRA.VolumeI.Relations.Basic.Properties

/-!
Identity, equality, and substitution foundations.

Lean's ambient equality is the implementation of equality. These declarations
name the source-facing equality axioms and substitution principles so later
modules can cite them without treating equality as a Volume II structure.
-/

namespace LRA.VolumeI.Identity

universe u v

/-- TeX label: `def:identity-relation`. -/
abbrev IdentityRelation {Carrier : Type u} (left right : Carrier) : Prop :=
  LRA.VolumeI.Relations.IdentityRelation Carrier left right

/-- TeX label: `def:equality-relation`. -/
abbrev EqualityRelation (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  LRA.VolumeI.Relations.IdentityRelation Carrier

/-- Equality axiom: every object is equal to itself. -/
theorem EqualityReflexivity {Carrier : Type u} (element : Carrier) :
    element = element := by
  sorry

/-- Equality axiom: equality is symmetric. -/
theorem EqualitySymmetry {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right) :
    right = left := by
  sorry

/-- Equality axiom: equality is transitive. -/
theorem EqualityTransitivity {Carrier : Type u} {first second third : Carrier}
    (FirstEqualsSecond : first = second)
    (SecondEqualsThird : second = third) :
    first = third := by
  sorry

/-- Equality is reflexive as a named binary-relation predicate. -/
theorem EqualityRelationIsReflexive (Carrier : Type u) :
    LRA.VolumeI.Relations.Reflexive (EqualityRelation Carrier) := by
  sorry

/-- Equality is symmetric as a named binary-relation predicate. -/
theorem EqualityRelationIsSymmetric (Carrier : Type u) :
    LRA.VolumeI.Relations.Symmetric (EqualityRelation Carrier) := by
  sorry

/-- Equality is transitive as a named binary-relation predicate. -/
theorem EqualityRelationIsTransitive (Carrier : Type u) :
    LRA.VolumeI.Relations.Transitive (EqualityRelation Carrier) := by
  sorry

/-- Equality is an equivalence relation. -/
theorem EqualityRelationIsEquivalence (Carrier : Type u) :
    LRA.VolumeI.Relations.Equivalence (EqualityRelation Carrier) := by
  sorry

/-- TeX label: `ax:leibniz-law`. -/
theorem LeibnizLaw {Carrier : Type u} {left right : Carrier}
    (ObjectsAreIdentical : left = right) :
    ∀ property : Carrier -> Prop, property left ↔ property right := by
  sorry

/-- TeX label: `def:definitional-propositional-equality`. -/
def PropositionalEquality {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right

/-- TeX label: `ax:equality-substitution`. -/
theorem EqualitySubstitution {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (formula : Carrier -> Prop) :
    formula left ↔ formula right :=
  by
    sorry

/-- TeX label: `prop:substitution-preserves-predicates`. -/
theorem SubstitutionPreservesPredicates {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (predicate : Carrier -> Prop) :
    predicate left ↔ predicate right :=
  by
    sorry

/-- TeX label: `prop:substitution-preserves-relations-left`. -/
theorem SubstitutionPreservesRelationsLeft {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation left fixed ↔ relation right fixed := by
  sorry

/-- TeX label: `prop:substitution-preserves-relations-right`. -/
theorem SubstitutionPreservesRelationsRight {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation fixed left ↔ relation fixed right := by
  sorry

/-- TeX label: `prop:substitution-preserves-relations-full`. -/
theorem SubstitutionPreservesRelations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right' := by
  sorry

/-- TeX label: `prop:substitution-preserves-functions`. -/
theorem SubstitutionPreservesFunctions {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right := by
  sorry

/-- TeX label: `prop:substitution-preserves-operations-left`. -/
theorem SubstitutionPreservesOperationsLeft {Carrier : Type u}
    {left left' right : Carrier}
    (LeftsAreEqual : left = left')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right := by
  sorry

/-- TeX label: `prop:substitution-preserves-operations-right`. -/
theorem SubstitutionPreservesOperationsRight {Carrier : Type u}
    {left right right' : Carrier}
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left right' := by
  sorry

/-- TeX label: `prop:substitution-preserves-operations-full`. -/
theorem SubstitutionPreservesOperations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right' := by
  sorry

/-- TeX label: `prop:congruence-with-respect-to-equality-is-automatic`. -/
theorem CongruenceWithRespectToEqualityIsAutomatic {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right') :
    (∀ predicate : Carrier -> Prop, predicate left ↔ predicate left') ∧
      (∀ relation : Carrier -> Carrier -> Prop,
        relation left right ↔ relation left' right') ∧
      (∀ operation : Carrier -> Carrier -> Carrier,
        operation left right = operation left' right') := by
  sorry

end LRA.VolumeI.Identity
