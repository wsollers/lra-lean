import LRA.Set.ZFCSet.Primitives
import LRA.Identity.ExistenceAndUniqueness

/-!
Canonical predicates used by the ZFC set-theory development.

`LRA.Set.ZFC` is the single owner of every predicate declared here.
-/

namespace LRA.Set.ZFC

abbrev Set := LRA.Set.ZFCSet

/-- Existence and uniqueness for a predicate on ZFC sets. -/
abbrev ExistsAndUnique (property : Set → Prop) : Prop :=
  LRA.Identity.ExistsAndUnique property

/-- A set is empty exactly when it has no members. -/
def IsEmptySet (A : Set) : Prop :=
  ∀ x : Set, x ∉ A

/-- `P` is the pair set of `x1` and `x2`. -/
def IsPairSet (x1 x2 P : Set) : Prop :=
  ∀ w : Set, w ∈ P ↔ w = x1 ∨ w = x2

/-- `S` is the singleton set of `x`. -/
def IsSingletonSet (x S : Set) : Prop :=
  ∀ w : Set, w ∈ S ↔ w = x

/-- `U` is the union over the set of sets `A`. -/
def IsUnionOf (A U : Set) : Prop :=
  ∀ x : Set, x ∈ U ↔ ∃ B : Set, B ∈ A ∧ x ∈ B

/-- `P` is the power set of `A`. -/
def IsPowerSetOf (A P : Set) : Prop :=
  ∀ x : Set, x ∈ P ↔ ∀ y : Set, y ∈ x → y ∈ A

/-- `B` is the subset of `A` separated by `property`. -/
def IsSeparatedSubset (A : Set) (property : Set → Prop) (B : Set) : Prop :=
  ∀ x : Set, x ∈ B ↔ x ∈ A ∧ property x

/-- `D` is the relative complement of `B` in `A`. -/
def IsRelativeComplementOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∉ B

/-- `D` is the intersection of `A` and `B`. -/
def IsIntersectionOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∈ B

/-- `D` is the symmetric difference of `A` and `B`. -/
def IsSymmetricDifferenceOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

/-- `A` is a subset of `B`. -/
def Subset (A B : Set) : Prop :=
  ∀ x : Set, x ∈ A → x ∈ B

/-- `relation` assigns at most one output to each member of `A`. -/
def IsFunctionalOn (A : Set) (relation : Set → Set → Prop) : Prop :=
  ∀ x : Set, x ∈ A →
    ∃ y : Set,
      relation x y ∧
      ∀ other : Set, relation x other → other = y

/-- `B` is the replacement image of `A` under `relation`. -/
def IsReplacementImageOf
    (A : Set) (relation : Set → Set → Prop) (B : Set) : Prop :=
  ∀ y : Set, y ∈ B ↔ ∃ x : Set, x ∈ A ∧ relation x y

/-- `successor` is the successor of `x`. -/
def IsSuccessorOf (x successor : Set) : Prop :=
  ∀ w : Set, w ∈ successor ↔ w ∈ x ∨ w = x

/-- `A` is an inductive set. -/
def IsInductiveSet (A : Set) : Prop :=
  (∃ empty : Set, empty ∈ A ∧ IsEmptySet empty) ∧
  ∀ x : Set, x ∈ A → ∃ successor : Set, successor ∈ A ∧ IsSuccessorOf x successor

/-- `x` is a Foundation witness for `A`. -/
def IsFoundationWitness (A x : Set) : Prop :=
  x ∈ A ∧ ∀ y : Set, y ∈ x → y ∉ A

/-- `choiceSet` is a choice set for the family `A`. -/
def IsChoiceSetFor (A choiceSet : Set) : Prop :=
  ∀ B : Set, B ∈ A →
    ∃ x : Set,
      (x ∈ B ∧ x ∈ choiceSet) ∧
      ∀ other : Set, (other ∈ B ∧ other ∈ choiceSet) → other = x

end LRA.Set.ZFC
