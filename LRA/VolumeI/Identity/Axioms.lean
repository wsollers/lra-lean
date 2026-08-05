import LRA.VolumeI.Relations.Basic.Properties

/-!
Axiomatic equality foundations.

Lean's ambient equality is the implementation of the pure logical equality
primitive. This chapter treats reflexivity and Leibniz substitution as the
primitive equality principles; symmetry, transitivity, equivalence-relation
status, and congruence are derived interface theorems for later predicate
logic, set theory, and algebra.
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
  rfl

/-- Derived theorem: equality is symmetric. -/
theorem EqualitySymmetry {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right) :
    right = left := by
  exact Eq.symm ObjectsAreEqual

/-- Derived theorem: equality is transitive. -/
theorem EqualityTransitivity {Carrier : Type u} {first second third : Carrier}
    (FirstEqualsSecond : first = second)
    (SecondEqualsThird : second = third) :
    first = third := by
  exact Eq.trans FirstEqualsSecond SecondEqualsThird

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

/-- TeX label: `ax:leibniz-law`. -/
theorem LeibnizLaw {Carrier : Type u} {left right : Carrier}
    (ObjectsAreIdentical : left = right) :
    ∀ property : Carrier -> Prop, property left ↔ property right := by
  intro property
  subst ObjectsAreIdentical
  rfl

/-- TeX label: `def:definitional-propositional-equality`. -/
def PropositionalEquality {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right

/-- TeX label: `ax:equality-substitution`. -/
theorem EqualitySubstitution {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (formula : Carrier -> Prop) :
    formula left ↔ formula right :=
  by
    exact LeibnizLaw ObjectsAreEqual formula

/-- TeX label: `prop:substitution-preserves-predicates`. -/
theorem SubstitutionPreservesPredicates {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (predicate : Carrier -> Prop) :
    predicate left ↔ predicate right :=
  by
    exact EqualitySubstitution ObjectsAreEqual predicate

/-- TeX label: `prop:substitution-preserves-relations-left`. -/
theorem SubstitutionPreservesRelationsLeft {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation left fixed ↔ relation right fixed := by
  exact EqualitySubstitution ObjectsAreEqual (fun value => relation value fixed)

/-- TeX label: `prop:substitution-preserves-relations-right`. -/
theorem SubstitutionPreservesRelationsRight {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation fixed left ↔ relation fixed right := by
  exact EqualitySubstitution ObjectsAreEqual (fun value => relation fixed value)

/-- TeX label: `prop:substitution-preserves-relations-full`. -/
theorem SubstitutionPreservesRelations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right' := by
  subst LeftsAreEqual
  subst RightsAreEqual
  rfl

/-- TeX label: `prop:substitution-preserves-functions`. -/
theorem SubstitutionPreservesFunctions {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right := by
  exact congrArg function ObjectsAreEqual

/-- TeX label: `prop:substitution-preserves-operations-left`. -/
theorem SubstitutionPreservesOperationsLeft {Carrier : Type u}
    {left left' right : Carrier}
    (LeftsAreEqual : left = left')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right := by
  exact congrArg (fun value => operation value right) LeftsAreEqual

/-- TeX label: `prop:substitution-preserves-operations-right`. -/
theorem SubstitutionPreservesOperationsRight {Carrier : Type u}
    {left right right' : Carrier}
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left right' := by
  exact congrArg (operation left) RightsAreEqual

/-- TeX label: `prop:substitution-preserves-operations-full`. -/
theorem SubstitutionPreservesOperations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right' := by
  subst LeftsAreEqual
  subst RightsAreEqual
  rfl

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
  constructor
  · intro predicate
    exact EqualitySubstitution LeftsAreEqual predicate
  constructor
  · intro relation
    exact SubstitutionPreservesRelations LeftsAreEqual RightsAreEqual relation
  · intro operation
    exact SubstitutionPreservesOperations LeftsAreEqual RightsAreEqual operation

end LRA.VolumeI.Identity
