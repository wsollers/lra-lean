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

theorem nbgSupportsSingleSortedPresentation : SupportsSingleSortedPresentation :=
  ClassOfSetMembership

theorem nbgSupportsTwoSortedPresentation : SupportsTwoSortedPresentation := by
  exact ⟨ClassOfSetMembership⟩

theorem nbgSupportsClassExtensionality : SupportsClassExtensionality :=
  ClassExtensionalityTheorem

theorem nbgSupportsClassRegularity : SupportsClassRegularity :=
  ClassRegularityWitnessExists

theorem nbgSupportsPairing : SupportsPairing :=
  PairSetExists

theorem nbgSupportsUnion : SupportsUnion :=
  UnionOverExists

theorem nbgSupportsPowerSet : SupportsPowerSet :=
  PowerSetOfExists

theorem nbgSupportsInfinity : SupportsInfinity :=
  InductiveSetExists

theorem nbgSupportsUniversalClass : SupportsUniversalClass :=
  UniversalClassExists

theorem nbgSupportsElementhoodClass : SupportsElementhoodClass :=
  ElementhoodClassExists

theorem nbgSupportsIntersectionClass : SupportsIntersectionClass :=
  IntersectionClassExists

theorem nbgSupportsComplementClass : SupportsComplementClass :=
  ComplementClassExists

theorem nbgSupportsDomainClass : SupportsDomainClass :=
  DomainClassExists

theorem nbgSupportsCartesianExtensionClass : SupportsCartesianExtensionClass :=
  CartesianExtensionClassExists

theorem nbgSupportsPermutationClass : SupportsPermutationClass :=
  PermutationClassExists

theorem nbgSupportsTranspositionClass : SupportsTranspositionClass :=
  TranspositionClassExists

theorem nbgSupportsReplacement : SupportsReplacement :=
  ReplacementImageExists

theorem nbgSupportsGlobalChoice : SupportsGlobalChoice :=
  GlobalChoiceClassExists

theorem nbgFiniteNBGAxiomHolds
    (axiomName : FiniteNBGAxiomName) :
    FiniteNBGAxiomHolds axiomName := by
  cases axiomName with
  | classExtensionality => exact nbgSupportsClassExtensionality
  | classRegularity => exact nbgSupportsClassRegularity
  | pairing => exact nbgSupportsPairing
  | union => exact nbgSupportsUnion
  | powerSet => exact nbgSupportsPowerSet
  | infinity => exact nbgSupportsInfinity
  | universalClass => exact nbgSupportsUniversalClass
  | elementhoodClass => exact nbgSupportsElementhoodClass
  | intersectionClass => exact nbgSupportsIntersectionClass
  | complementClass => exact nbgSupportsComplementClass
  | domainClass => exact nbgSupportsDomainClass
  | cartesianExtensionClass => exact nbgSupportsCartesianExtensionClass
  | permutationClass => exact nbgSupportsPermutationClass
  | transpositionClass => exact nbgSupportsTranspositionClass
  | replacement => exact nbgSupportsReplacement
  | globalChoice => exact nbgSupportsGlobalChoice

theorem nbgSatisfiesFiniteNBGAxiomatization : SatisfiesFiniteNBGAxiomatization :=
  nbgFiniteNBGAxiomHolds

theorem nbgSatisfiesNBG : SatisfiesNBG := by
  constructor
  exact nbgSupportsSingleSortedPresentation
  constructor
  exact nbgSupportsTwoSortedPresentation
  exact nbgSatisfiesFiniteNBGAxiomatization

end LRA.Set.Constructions.NBG.Interface.ModelTheory
