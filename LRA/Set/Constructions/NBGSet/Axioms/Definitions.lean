import LRA.Set.Constructions.NBGSet.Definition

namespace LRA.Set.Constructions.NBG.Axioms

open LRA.Set.Constructions
open LRA.Set.Constructions.NBG

noncomputable section

abbrev Set := NBGSet

abbrev Class := NBGClass

abbrev ClassOfSet := LRA.Set.Constructions.NBG.ClassOfSet

abbrev OrderedPair := LRA.Set.Constructions.NBG.OrderedPair

def EncodedTriple (x y z : Set) : Set :=
  OrderedPair x (OrderedPair y z)

def IsSetClass (A : Set) (X : Class) : Prop :=
  ∀ x : Set, x ∈ X ↔ x ∈ A

def IsEmptySet (A : Set) : Prop :=
  ∀ x : Set, x ∉ A

def IsPairSet (x y P : Set) : Prop :=
  ∀ w : Set, w ∈ P ↔ w = x ∨ w = y

def IsUnionOf (A U : Set) : Prop :=
  ∀ x : Set, x ∈ U ↔ ∃ B : Set, B ∈ A ∧ x ∈ B

def IsPowerSetOf (A P : Set) : Prop :=
  ∀ x : Set, x ∈ P ↔ ∀ y : Set, y ∈ x → y ∈ A

def IsSuccessorOf (x successor : Set) : Prop :=
  ∀ w : Set, w ∈ successor ↔ w ∈ x ∨ w = x

def IsInductiveSet (A : Set) : Prop :=
  (∃ empty : Set, empty ∈ A ∧ IsEmptySet empty) ∧
  ∀ x : Set, x ∈ A → ∃ successor : Set, successor ∈ A ∧ IsSuccessorOf x successor

def IsFoundationWitness (A x : Set) : Prop :=
  x ∈ A ∧ ∀ y : Set, y ∈ x → y ∉ A

def IsFunctionalOn (A : Set) (relation : Set → Set → Prop) : Prop :=
  ∀ x : Set, x ∈ A →
    ∃ y : Set, relation x y ∧ ∀ other : Set, relation x other → other = y

def IsReplacementImageOf (A : Set) (relation : Set → Set → Prop) (B : Set) : Prop :=
  ∀ y : Set, y ∈ B ↔ ∃ x : Set, x ∈ A ∧ relation x y

def IsClassComprehension (property : Set → Prop) (C : Class) : Prop :=
  ∀ x : Set, x ∈ C ↔ property x

def IsUniversalClass (V : Class) : Prop :=
  ∀ x : Set, x ∈ V

def IsElementhoodClass (E : Class) : Prop :=
  ∀ x y : Set, OrderedPair x y ∈ E ↔ x ∈ y

def IsIntersectionClass (X Y Z : Class) : Prop :=
  ∀ x : Set, x ∈ Z ↔ x ∈ X ∧ x ∈ Y

def IsComplementClass (X Z : Class) : Prop :=
  ∀ x : Set, x ∈ Z ↔ x ∉ X

def IsDomainClass (X D : Class) : Prop :=
  ∀ x : Set, x ∈ D ↔ ∃ y : Set, OrderedPair x y ∈ X

def IsCartesianExtensionClass (X Z : Class) : Prop :=
  ∀ x y : Set, OrderedPair x y ∈ Z ↔ x ∈ X

def IsPermutationClass (X Z : Class) : Prop :=
  ∀ x y z : Set, EncodedTriple x y z ∈ Z ↔ EncodedTriple y z x ∈ X

def IsTranspositionClass (X Z : Class) : Prop :=
  ∀ x y z : Set, EncodedTriple x y z ∈ Z ↔ EncodedTriple x z y ∈ X

def IsGlobalChoiceClass (G : Class) : Prop :=
  ∀ A : Set, (∃ x : Set, x ∈ A) →
    ∃ y : Set,
      y ∈ A ∧ OrderedPair A y ∈ G ∧
      ∀ other : Set, other ∈ A ∧ OrderedPair A other ∈ G → other = y

end

end LRA.Set.Constructions.NBG.Axioms
