import LRA.Set.NBGSet.Primitives
import LRA.Identity.ExistenceAndUniqueness

/-! Canonical predicates used by the NBG set/class-theory development. -/

namespace LRA.Set.NBG

abbrev Set := LRA.Set.NBGSet
abbrev Class := LRA.Set.NBGClass

abbrev ExistsAndUnique (property : Set -> Prop) : Prop :=
  LRA.Identity.ExistsAndUnique property

def IsEmptySet (A : Set) : Prop := forall x : Set, x ∉ A
def IsPairSet (x1 x2 P : Set) : Prop := forall w : Set, w ∈ P <-> w = x1 \/ w = x2
def IsSingletonSet (x S : Set) : Prop := forall w : Set, w ∈ S <-> w = x
def IsUnionOf (A U : Set) : Prop :=
  forall x : Set, x ∈ U <-> exists B : Set, B ∈ A /\ x ∈ B
def IsPowerSetOf (A P : Set) : Prop :=
  forall x : Set, x ∈ P <-> forall y : Set, y ∈ x -> y ∈ A
def IsSeparatedSubset (A : Set) (property : Set -> Prop) (B : Set) : Prop :=
  forall x : Set, x ∈ B <-> x ∈ A /\ property x
def IsRelativeComplementOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> x ∈ A /\ x ∉ B
def IsIntersectionOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> x ∈ A /\ x ∈ B
def IsSymmetricDifferenceOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> (x ∈ A /\ x ∉ B) \/ (x ∈ B /\ x ∉ A)
def Subset (A B : Set) : Prop := forall x : Set, x ∈ A -> x ∈ B
def IsFunctionalOn (A : Set) (relation : Set -> Set -> Prop) : Prop :=
  forall x : Set, x ∈ A ->
    exists y : Set, relation x y /\ forall other : Set, relation x other -> other = y
def IsReplacementImageOf (A : Set) (relation : Set -> Set -> Prop) (B : Set) : Prop :=
  forall y : Set, y ∈ B <-> exists x : Set, x ∈ A /\ relation x y
def IsSuccessorOf (x successor : Set) : Prop :=
  forall w : Set, w ∈ successor <-> w ∈ x \/ w = x
def IsInductiveSet (A : Set) : Prop :=
  (exists empty : Set, empty ∈ A /\ IsEmptySet empty) /\
  forall x : Set, x ∈ A -> exists successor : Set, successor ∈ A /\ IsSuccessorOf x successor
def IsFoundationWitness (A x : Set) : Prop :=
  x ∈ A /\ forall y : Set, y ∈ x -> y ∉ A
def IsChoiceSetFor (A choiceSet : Set) : Prop :=
  forall B : Set, B ∈ A ->
    exists x : Set,
      (x ∈ B /\ x ∈ choiceSet) /\
      forall other : Set, (other ∈ B /\ other ∈ choiceSet) -> other = x

/-- `C` is the class extension cut out by `property`. -/
def IsClassComprehension (property : Set -> Prop) (C : Class) : Prop :=
  forall x : Set, x ∈ C <-> property x

/-- `C` is the class represented by the set `A`. -/
def IsClassOfSet (A : Set) (C : Class) : Prop :=
  forall x : Set, x ∈ C <-> x ∈ A

end LRA.Set.NBG
