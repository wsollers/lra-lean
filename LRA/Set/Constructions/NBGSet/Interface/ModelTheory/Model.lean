import LRA.Set.Constructions.NBGSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.NBGSet.Interface.ModelTheory.LStructure

namespace LRA.Set.Constructions.NBG.Interface.ModelTheory

open LRA.Set.Constructions.NBG.Axioms

noncomputable def AmbientTwoSortedClassStructure : TwoSortedClassStructure where
  setCarrier := LRA.Set.Constructions.NBGSet
  setCarrierNonempty := ⟨TheEmptySet⟩
  classCarrier := LRA.Set.Constructions.NBGClass
  classOfSet := LRA.Set.Constructions.NBG.ClassOfSet
  setMembership := fun x y => x ∈ y
  classMembership := fun x X => x ∈ X
  orderedPair := LRA.Set.Constructions.NBG.OrderedPair

noncomputable def AmbientSingleSortedClassStructure : SingleSortedClassStructure :=
  toSingleSortedClassStructure AmbientTwoSortedClassStructure

@[reducible] noncomputable def AmbientSingleSortedMembershipModel :=
  toFirstOrderModel AmbientSingleSortedClassStructure

theorem ambientStructureIsStandardModelPair :
    IsStandardModelPair AmbientTwoSortedClassStructure :=
  ClassOfSetMembership

theorem ambientStructureSupportsSingleSortedPresentation :
    SupportsSingleSortedPresentation :=
  nbgSupportsSingleSortedPresentation

theorem ambientStructureSupportsTwoSortedPresentation :
    SupportsTwoSortedPresentation :=
  nbgSupportsTwoSortedPresentation

theorem ambientStructureSupportsClassExtensionality :
    SupportsClassExtensionality :=
  nbgSupportsClassExtensionality

theorem ambientStructureSupportsClassRegularity :
    SupportsClassRegularity :=
  nbgSupportsClassRegularity

theorem ambientStructureSupportsPairing :
    SupportsPairing :=
  nbgSupportsPairing

theorem ambientStructureSupportsUnion :
    SupportsUnion :=
  nbgSupportsUnion

theorem ambientStructureSupportsPowerSet :
    SupportsPowerSet :=
  nbgSupportsPowerSet

theorem ambientStructureSupportsInfinity :
    SupportsInfinity :=
  nbgSupportsInfinity

theorem ambientStructureSupportsUniversalClass :
    SupportsUniversalClass :=
  nbgSupportsUniversalClass

theorem ambientStructureSupportsElementhoodClass :
    SupportsElementhoodClass :=
  nbgSupportsElementhoodClass

theorem ambientStructureSupportsIntersectionClass :
    SupportsIntersectionClass :=
  nbgSupportsIntersectionClass

theorem ambientStructureSupportsComplementClass :
    SupportsComplementClass :=
  nbgSupportsComplementClass

theorem ambientStructureSupportsDomainClass :
    SupportsDomainClass :=
  nbgSupportsDomainClass

theorem ambientStructureSupportsCartesianExtensionClass :
    SupportsCartesianExtensionClass :=
  nbgSupportsCartesianExtensionClass

theorem ambientStructureSupportsPermutationClass :
    SupportsPermutationClass :=
  nbgSupportsPermutationClass

theorem ambientStructureSupportsTranspositionClass :
    SupportsTranspositionClass :=
  nbgSupportsTranspositionClass

theorem ambientStructureSupportsReplacement :
    SupportsReplacement :=
  nbgSupportsReplacement

theorem ambientStructureSupportsGlobalChoice :
    SupportsGlobalChoice :=
  nbgSupportsGlobalChoice

theorem ambientFiniteNBGAxiomHolds
    (axiomName : FiniteNBGAxiomName) :
    FiniteNBGAxiomHolds axiomName :=
  nbgFiniteNBGAxiomHolds axiomName

theorem ambientStructureSatisfiesFiniteNBGAxiomatization :
    SatisfiesFiniteNBGAxiomatization :=
  ambientFiniteNBGAxiomHolds

theorem ambientStructureSatisfiesNBG :
    SatisfiesNBG :=
  nbgSatisfiesNBG

end LRA.Set.Constructions.NBG.Interface.ModelTheory
