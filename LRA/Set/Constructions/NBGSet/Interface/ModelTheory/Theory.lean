import LRA.Set.Constructions.NBGSet.Axioms

namespace LRA.Set.Constructions.NBG.Interface.ModelTheory

open LRA.Set.Constructions.NBG.Axioms

abbrev SetObject := LRA.Set.Constructions.NBGSet

abbrev ClassObject := LRA.Set.Constructions.NBGClass

inductive FiniteNBGAxiomName where
  | classExtensionality
  | classRegularity
  | pairing
  | union
  | powerSet
  | infinity
  | universalClass
  | elementhoodClass
  | intersectionClass
  | complementClass
  | domainClass
  | cartesianExtensionClass
  | permutationClass
  | transpositionClass
  | replacement
  | globalChoice
  deriving DecidableEq

def SupportsSingleSortedPresentation : Prop :=
  ∀ A x : SetObject, x ∈ LRA.Set.Constructions.NBG.ClassOfSet A ↔ x ∈ A

structure SupportsTwoSortedPresentation : Prop where
  classOfSetMembership :
    ∀ A x : SetObject, x ∈ LRA.Set.Constructions.NBG.ClassOfSet A ↔ x ∈ A

def SupportsClassExtensionality : Prop :=
  ∀ X Y : ClassObject,
    (∀ x : SetObject, x ∈ X ↔ x ∈ Y) →
      X = Y

def SupportsClassRegularity : Prop :=
  ∀ X : ClassObject,
    (∃ x : SetObject, x ∈ X) →
      ∃ y : SetObject, y ∈ X ∧ ∀ z : SetObject, z ∈ y → z ∉ X

def SupportsPairing : Prop :=
  ∀ x y : SetObject,
    ∃ P : SetObject, IsPairSet x y P

def SupportsUnion : Prop :=
  ∀ A : SetObject,
    ∃ U : SetObject, IsUnionOf A U

def SupportsPowerSet : Prop :=
  ∀ A : SetObject,
    ∃ P : SetObject, IsPowerSetOf A P

def SupportsInfinity : Prop :=
  ∃ A : SetObject, IsInductiveSet A

def SupportsUniversalClass : Prop :=
  ∃ V : ClassObject, IsUniversalClass V

def SupportsElementhoodClass : Prop :=
  ∃ E : ClassObject, IsElementhoodClass E

def SupportsIntersectionClass : Prop :=
  ∀ X Y : ClassObject,
    ∃ Z : ClassObject, IsIntersectionClass X Y Z

def SupportsComplementClass : Prop :=
  ∀ X : ClassObject,
    ∃ Z : ClassObject, IsComplementClass X Z

def SupportsDomainClass : Prop :=
  ∀ X : ClassObject,
    ∃ D : ClassObject, IsDomainClass X D

def SupportsCartesianExtensionClass : Prop :=
  ∀ X : ClassObject,
    ∃ Z : ClassObject, IsCartesianExtensionClass X Z

def SupportsPermutationClass : Prop :=
  ∀ X : ClassObject,
    ∃ Z : ClassObject, IsPermutationClass X Z

def SupportsTranspositionClass : Prop :=
  ∀ X : ClassObject,
    ∃ Z : ClassObject, IsTranspositionClass X Z

def SupportsReplacement : Prop :=
  ∀ (A : SetObject) (relation : SetObject → SetObject → Prop),
    IsFunctionalOn A relation →
      ∃ B : SetObject, IsReplacementImageOf A relation B

def SupportsGlobalChoice : Prop :=
  ∃ G : ClassObject, IsGlobalChoiceClass G

def FiniteNBGAxiomHolds : FiniteNBGAxiomName → Prop
  | .classExtensionality => SupportsClassExtensionality
  | .classRegularity => SupportsClassRegularity
  | .pairing => SupportsPairing
  | .union => SupportsUnion
  | .powerSet => SupportsPowerSet
  | .infinity => SupportsInfinity
  | .universalClass => SupportsUniversalClass
  | .elementhoodClass => SupportsElementhoodClass
  | .intersectionClass => SupportsIntersectionClass
  | .complementClass => SupportsComplementClass
  | .domainClass => SupportsDomainClass
  | .cartesianExtensionClass => SupportsCartesianExtensionClass
  | .permutationClass => SupportsPermutationClass
  | .transpositionClass => SupportsTranspositionClass
  | .replacement => SupportsReplacement
  | .globalChoice => SupportsGlobalChoice

def SatisfiesFiniteNBGAxiomatization : Prop :=
  ∀ axiomName : FiniteNBGAxiomName, FiniteNBGAxiomHolds axiomName

def SatisfiesNBG : Prop :=
  SupportsSingleSortedPresentation ∧
  SupportsTwoSortedPresentation ∧
  SatisfiesFiniteNBGAxiomatization

theorem nbgSupportsSingleSortedPresentation : SupportsSingleSortedPresentation := by
  sorry

theorem nbgSupportsTwoSortedPresentation : SupportsTwoSortedPresentation := by
  sorry

theorem nbgSupportsClassExtensionality : SupportsClassExtensionality := by
  sorry

theorem nbgSupportsClassRegularity : SupportsClassRegularity := by
  sorry

theorem nbgSupportsPairing : SupportsPairing := by
  sorry

theorem nbgSupportsUnion : SupportsUnion := by
  sorry

theorem nbgSupportsPowerSet : SupportsPowerSet := by
  sorry

theorem nbgSupportsInfinity : SupportsInfinity := by
  sorry

theorem nbgSupportsUniversalClass : SupportsUniversalClass := by
  sorry

theorem nbgSupportsElementhoodClass : SupportsElementhoodClass := by
  sorry

theorem nbgSupportsIntersectionClass : SupportsIntersectionClass := by
  sorry

theorem nbgSupportsComplementClass : SupportsComplementClass := by
  sorry

theorem nbgSupportsDomainClass : SupportsDomainClass := by
  sorry

theorem nbgSupportsCartesianExtensionClass : SupportsCartesianExtensionClass := by
  sorry

theorem nbgSupportsPermutationClass : SupportsPermutationClass := by
  sorry

theorem nbgSupportsTranspositionClass : SupportsTranspositionClass := by
  sorry

theorem nbgSupportsReplacement : SupportsReplacement := by
  sorry

theorem nbgSupportsGlobalChoice : SupportsGlobalChoice := by
  sorry

theorem nbgFiniteNBGAxiomHolds
    (axiomName : FiniteNBGAxiomName) :
    FiniteNBGAxiomHolds axiomName := by
  sorry

theorem nbgSatisfiesFiniteNBGAxiomatization : SatisfiesFiniteNBGAxiomatization := by
  sorry

theorem nbgSatisfiesNBG : SatisfiesNBG := by
  sorry

end LRA.Set.Constructions.NBG.Interface.ModelTheory
