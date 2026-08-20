import LRA.Set.TGSet.Primitives
import LRA.Identity.ExistenceAndUniqueness

/-! Canonical predicates used by the TG set-theory development. -/

namespace LRA.Set.TG

abbrev Set := LRA.Set.TGSet

/-- Existence and uniqueness for a predicate on TG sets. -/
abbrev ExistsAndUnique (property : Set -> Prop) : Prop :=
  LRA.Identity.ExistsAndUnique property

/-- A set is empty exactly when it has no members. -/
def IsEmptySet (A : Set) : Prop := forall x : Set, x ∉ A

/-- `P` is the pair set of `x1` and `x2`. -/
def IsPairSet (x1 x2 P : Set) : Prop :=
  forall w : Set, w ∈ P <-> w = x1 \/ w = x2

/-- `S` is the singleton set of `x`. -/
def IsSingletonSet (x S : Set) : Prop :=
  forall w : Set, w ∈ S <-> w = x

/-- `U` is the union over the set of sets `A`. -/
def IsUnionOf (A U : Set) : Prop :=
  forall x : Set, x ∈ U <-> exists B : Set, B ∈ A /\ x ∈ B

/-- `P` is the power set of `A`. -/
def IsPowerSetOf (A P : Set) : Prop :=
  forall x : Set, x ∈ P <-> forall y : Set, y ∈ x -> y ∈ A

/-- `B` is the subset of `A` separated by `property`. -/
def IsSeparatedSubset (A : Set) (property : Set -> Prop) (B : Set) : Prop :=
  forall x : Set, x ∈ B <-> x ∈ A /\ property x

/-- `D` is the relative complement of `B` in `A`. -/
def IsRelativeComplementOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> x ∈ A /\ x ∉ B

/-- `D` is the intersection of `A` and `B`. -/
def IsIntersectionOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> x ∈ A /\ x ∈ B

/-- `D` is the symmetric difference of `A` and `B`. -/
def IsSymmetricDifferenceOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> (x ∈ A /\ x ∉ B) \/ (x ∈ B /\ x ∉ A)

/-- `A` is a subset of `B`. -/
def Subset (A B : Set) : Prop := forall x : Set, x ∈ A -> x ∈ B

/-- `relation` assigns at most one output to each member of `A`. -/
def IsFunctionalOn (A : Set) (relation : Set -> Set -> Prop) : Prop :=
  forall x : Set, x ∈ A ->
    exists y : Set,
      relation x y /\
      forall other : Set, relation x other -> other = y

/-- `B` is the replacement image of `A` under `relation`. -/
def IsReplacementImageOf
    (A : Set) (relation : Set -> Set -> Prop) (B : Set) : Prop :=
  forall y : Set, y ∈ B <-> exists x : Set, x ∈ A /\ relation x y

/-- `successor` is the successor of `x`. -/
def IsSuccessorOf (x successor : Set) : Prop :=
  forall w : Set, w ∈ successor <-> w ∈ x \/ w = x

/-- `A` is an inductive set. -/
def IsInductiveSet (A : Set) : Prop :=
  (exists empty : Set, empty ∈ A /\ IsEmptySet empty) /\
  forall x : Set, x ∈ A -> exists successor : Set, successor ∈ A /\ IsSuccessorOf x successor

/-- `x` is a Foundation witness for `A`. -/
def IsFoundationWitness (A x : Set) : Prop :=
  x ∈ A /\ forall y : Set, y ∈ x -> y ∉ A

/-- `choiceSet` is a choice set for the family `A`. -/
def IsChoiceSetFor (A choiceSet : Set) : Prop :=
  forall B : Set, B ∈ A ->
    exists x : Set,
      (x ∈ B /\ x ∈ choiceSet) /\
      forall other : Set, (other ∈ B /\ other ∈ choiceSet) -> other = x

/-- `U` is a Grothendieck universe containing `A`. -/
def IsGrothendieckUniverseFor (A U : Set) : Prop :=
  A ∈ U /\
  (forall x : Set, x ∈ U -> forall y : Set, y ∈ x -> y ∈ U) /\
  (forall x : Set, x ∈ U -> exists P : Set,
    P ∈ U /\ IsPowerSetOf x P) /\
  (forall I : Set, I ∈ U ->
    forall family : Set -> Set,
      (forall i : Set, i ∈ I -> family i ∈ U) ->
        exists image : Set,
          image ∈ U /\
          forall y : Set, y ∈ image <-> exists i : Set, i ∈ I /\ y = family i)

end LRA.Set.TG
