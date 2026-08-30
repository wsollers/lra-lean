import LRA.Set.Constructions.NBGSet.Axioms.Definitions

namespace LRA.Set.Constructions.NBG.Axioms

axiom SetExtensionality
    (A B : Set)
    (sameMembers : ∀ x : Set, x ∈ A ↔ x ∈ B) :
    A = B

axiom ClassExtensionalityTheorem
    (A B : Class)
    (sameMembers : ∀ x : Set, x ∈ A ↔ x ∈ B) :
    A = B

axiom ClassOfSetMembership
    (A x : Set) :
    x ∈ ClassOfSet A ↔ x ∈ A

axiom ClassComprehensionExists
    (property : Set → Prop) :
    ∃ C : Class, IsClassComprehension property C

axiom EmptySetExists : ∃ A : Set, IsEmptySet A

noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists

theorem TheEmptySetIsEmpty : IsEmptySet TheEmptySet := by
  sorry

axiom PairSetExists
    (x y : Set) :
    ∃ P : Set, IsPairSet x y P

axiom UnionOverExists
    (A : Set) :
    ∃ U : Set, IsUnionOf A U

axiom PowerSetOfExists
    (A : Set) :
    ∃ P : Set, IsPowerSetOf A P

axiom InductiveSetExists : ∃ A : Set, IsInductiveSet A

axiom ClassRegularityWitnessExists
    (X : Class)
    (nonempty : ∃ x : Set, x ∈ X) :
    ∃ y : Set, y ∈ X ∧ ∀ z : Set, z ∈ y → z ∉ X

axiom UniversalClassExists : ∃ V : Class, IsUniversalClass V

axiom ElementhoodClassExists : ∃ E : Class, IsElementhoodClass E

axiom IntersectionClassExists
    (X Y : Class) :
    ∃ Z : Class, IsIntersectionClass X Y Z

axiom ComplementClassExists
    (X : Class) :
    ∃ Z : Class, IsComplementClass X Z

axiom DomainClassExists
    (X : Class) :
    ∃ D : Class, IsDomainClass X D

axiom CartesianExtensionClassExists
    (X : Class) :
    ∃ Z : Class, IsCartesianExtensionClass X Z

axiom PermutationClassExists
    (X : Class) :
    ∃ Z : Class, IsPermutationClass X Z

axiom TranspositionClassExists
    (X : Class) :
    ∃ Z : Class, IsTranspositionClass X Z

axiom ReplacementImageExists
    (A : Set)
    (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ∃ B : Set, IsReplacementImageOf A relation B

axiom FoundationWitnessExists
    (A : Set)
    (nonempty : ∃ w : Set, w ∈ A) :
    ∃ x : Set, IsFoundationWitness A x

axiom GlobalChoiceClassExists : ∃ G : Class, IsGlobalChoiceClass G

theorem ClassOfSetIsSetClass (A : Set) : IsSetClass A (ClassOfSet A) := by
  sorry

end LRA.Set.Constructions.NBG.Axioms
