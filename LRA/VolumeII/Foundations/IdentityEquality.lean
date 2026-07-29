/-!
TeX-facing identity and equality foundations for Volume II.

These declarations model the formal environments in
`identity-equality-equivalence/notes/equality` and
`identity-equality-equivalence/notes/substitution`. Equality itself is Lean's
ambient propositional equality; the TeX axioms become reusable theorems about
that equality.
-/

namespace LRA
namespace VolumeII
namespace Foundations
namespace IdentityEquality

universe u v

/-- TeX label: `def:identity-relation`. -/
def IdentityRelation {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right

/-- TeX label: `ax:leibniz-law`. -/
theorem LeibnizLaw {Carrier : Type u} {left right : Carrier}
    (objects_are_identical : left = right) :
    ∀ property : Carrier -> Prop, property left ↔ property right := by
  subst objects_are_identical
  intro property
  exact Iff.rfl

/-- TeX label: `def:equality-relation`. -/
def EqualityRelation (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  Eq

/-- TeX label: `def:definitional-propositional-equality`. -/
def PropositionalEquality {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right

/-- TeX label: `ax:equality-substitution`. -/
theorem EqualitySubstitution {Carrier : Type u} {left right : Carrier}
    (objects_are_equal : left = right)
    (formula : Carrier -> Prop) :
    formula left ↔ formula right :=
  LeibnizLaw objects_are_equal formula

/-- TeX label: `prop:substitution-preserves-predicates`. -/
theorem SubstitutionPreservesPredicates {Carrier : Type u}
    {left right : Carrier}
    (objects_are_equal : left = right)
    (predicate : Carrier -> Prop) :
    predicate left ↔ predicate right :=
  EqualitySubstitution objects_are_equal predicate

/-- TeX label: `prop:substitution-preserves-relations-left`. -/
theorem SubstitutionPreservesRelationsLeft {Carrier : Type u}
    {left right fixed : Carrier}
    (objects_are_equal : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation left fixed ↔ relation right fixed := by
  subst objects_are_equal
  exact Iff.rfl

/-- TeX label: `prop:substitution-preserves-relations-right`. -/
theorem SubstitutionPreservesRelationsRight {Carrier : Type u}
    {left right fixed : Carrier}
    (objects_are_equal : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation fixed left ↔ relation fixed right := by
  subst objects_are_equal
  exact Iff.rfl

/-- TeX label: `prop:substitution-preserves-relations-full`. -/
theorem SubstitutionPreservesRelations {Carrier : Type u}
    {left left' right right' : Carrier}
    (lefts_are_equal : left = left')
    (rights_are_equal : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right' := by
  subst lefts_are_equal
  subst rights_are_equal
  exact Iff.rfl

/-- TeX label: `prop:substitution-preserves-functions`. -/
theorem SubstitutionPreservesFunctions {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (objects_are_equal : left = right)
    (function : Domain -> Codomain) :
    function left = function right := by
  subst objects_are_equal
  rfl

/-- TeX label: `prop:substitution-preserves-operations-left`. -/
theorem SubstitutionPreservesOperationsLeft {Carrier : Type u}
    {left left' right : Carrier}
    (lefts_are_equal : left = left')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right := by
  subst lefts_are_equal
  rfl

/-- TeX label: `prop:substitution-preserves-operations-right`. -/
theorem SubstitutionPreservesOperationsRight {Carrier : Type u}
    {left right right' : Carrier}
    (rights_are_equal : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left right' := by
  subst rights_are_equal
  rfl

/-- TeX label: `prop:substitution-preserves-operations-full`. -/
theorem SubstitutionPreservesOperations {Carrier : Type u}
    {left left' right right' : Carrier}
    (lefts_are_equal : left = left')
    (rights_are_equal : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right' := by
  subst lefts_are_equal
  subst rights_are_equal
  rfl

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
  constructor
  · intro predicate
    exact SubstitutionPreservesPredicates lefts_are_equal predicate
  constructor
  · intro relation
    exact SubstitutionPreservesRelations lefts_are_equal rights_are_equal relation
  · intro operation
    exact SubstitutionPreservesOperations lefts_are_equal rights_are_equal operation

end IdentityEquality
end Foundations
end VolumeII
end LRA
