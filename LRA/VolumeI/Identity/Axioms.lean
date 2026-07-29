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
def IdentityRelation {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right

/-- TeX label: `def:equality-relation`. -/
def EqualityRelation (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  Eq

/-- Equality axiom: every object is equal to itself. -/
theorem EqualityReflexivity {Carrier : Type u} (element : Carrier) :
    element = element := by
  sorry

/-- Equality axiom: equality is symmetric. -/
theorem EqualitySymmetry {Carrier : Type u} {left right : Carrier}
    (objects_are_equal : left = right) :
    right = left := by
  sorry

/-- Equality axiom: equality is transitive. -/
theorem EqualityTransitivity {Carrier : Type u} {first second third : Carrier}
    (first_equals_second : first = second)
    (second_equals_third : second = third) :
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
    (objects_are_identical : left = right) :
    ∀ property : Carrier -> Prop, property left ↔ property right := by
  sorry

/-- TeX label: `def:definitional-propositional-equality`. -/
def PropositionalEquality {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right

/-- TeX label: `ax:equality-substitution`. -/
theorem EqualitySubstitution {Carrier : Type u} {left right : Carrier}
    (objects_are_equal : left = right)
    (formula : Carrier -> Prop) :
    formula left ↔ formula right :=
  by
    sorry

/-- TeX label: `prop:substitution-preserves-predicates`. -/
theorem SubstitutionPreservesPredicates {Carrier : Type u}
    {left right : Carrier}
    (objects_are_equal : left = right)
    (predicate : Carrier -> Prop) :
    predicate left ↔ predicate right :=
  by
    sorry

/-- TeX label: `prop:substitution-preserves-relations-left`. -/
theorem SubstitutionPreservesRelationsLeft {Carrier : Type u}
    {left right fixed : Carrier}
    (objects_are_equal : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation left fixed ↔ relation right fixed := by
  sorry

/-- TeX label: `prop:substitution-preserves-relations-right`. -/
theorem SubstitutionPreservesRelationsRight {Carrier : Type u}
    {left right fixed : Carrier}
    (objects_are_equal : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation fixed left ↔ relation fixed right := by
  sorry

/-- TeX label: `prop:substitution-preserves-relations-full`. -/
theorem SubstitutionPreservesRelations {Carrier : Type u}
    {left left' right right' : Carrier}
    (lefts_are_equal : left = left')
    (rights_are_equal : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right' := by
  sorry

/-- TeX label: `prop:substitution-preserves-functions`. -/
theorem SubstitutionPreservesFunctions {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (objects_are_equal : left = right)
    (function : Domain -> Codomain) :
    function left = function right := by
  sorry

/-- TeX label: `prop:substitution-preserves-operations-left`. -/
theorem SubstitutionPreservesOperationsLeft {Carrier : Type u}
    {left left' right : Carrier}
    (lefts_are_equal : left = left')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right := by
  sorry

/-- TeX label: `prop:substitution-preserves-operations-right`. -/
theorem SubstitutionPreservesOperationsRight {Carrier : Type u}
    {left right right' : Carrier}
    (rights_are_equal : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left right' := by
  sorry

/-- TeX label: `prop:substitution-preserves-operations-full`. -/
theorem SubstitutionPreservesOperations {Carrier : Type u}
    {left left' right right' : Carrier}
    (lefts_are_equal : left = left')
    (rights_are_equal : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right' := by
  sorry

/-- TeX label: `prop:congruence-with-respect-to-equality-is-automatic`. -/
theorem CongruenceWithRespectToEqualityIsAutomatic {Carrier : Type u}
    {left left' right right' : Carrier}
    (lefts_are_equal : left = left')
    (rights_are_equal : right = right') :
    (∀ predicate : Carrier -> Prop, predicate left ↔ predicate left') ∧
      (∀ relation : Carrier -> Carrier -> Prop,
        relation left right ↔ relation left' right') ∧
      (∀ operation : Carrier -> Carrier -> Carrier,
        operation left right = operation left' right') := by
  sorry

end LRA.VolumeI.Identity
