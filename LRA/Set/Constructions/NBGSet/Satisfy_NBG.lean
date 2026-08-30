import LRA.Set.Constructions.NBGSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.NBGSet.Interface.ModelTheory.LStructure

/-! NBG satisfies its own exported NBG theory. -/

namespace LRA.Set.Constructions.NBG

open LRA.Set.Constructions.NBG.Axioms
open LRA.Set.Constructions.NBG.Interface.ModelTheory

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
    IsStandardModelPair AmbientTwoSortedClassStructure := by
  sorry

theorem ambientStructureSupportsSingleSortedPresentation :
    SupportsSingleSortedPresentation := by
  sorry

theorem ambientStructureSupportsTwoSortedPresentation :
    SupportsTwoSortedPresentation := by
  sorry

theorem ambientStructureSupportsClassExtensionality :
    SupportsClassExtensionality := by
  sorry

theorem ambientStructureSupportsClassRegularity :
    SupportsClassRegularity := by
  sorry

theorem ambientStructureSupportsPairing :
    SupportsPairing := by
  sorry

theorem ambientStructureSupportsUnion :
    SupportsUnion := by
  sorry

theorem ambientStructureSupportsPowerSet :
    SupportsPowerSet := by
  sorry

theorem ambientStructureSupportsInfinity :
    SupportsInfinity := by
  sorry

theorem ambientStructureSupportsUniversalClass :
    SupportsUniversalClass := by
  sorry

theorem ambientStructureSupportsElementhoodClass :
    SupportsElementhoodClass := by
  sorry

theorem ambientStructureSupportsIntersectionClass :
    SupportsIntersectionClass := by
  sorry

theorem ambientStructureSupportsComplementClass :
    SupportsComplementClass := by
  sorry

theorem ambientStructureSupportsDomainClass :
    SupportsDomainClass := by
  sorry

theorem ambientStructureSupportsCartesianExtensionClass :
    SupportsCartesianExtensionClass := by
  sorry

theorem ambientStructureSupportsPermutationClass :
    SupportsPermutationClass := by
  sorry

theorem ambientStructureSupportsTranspositionClass :
    SupportsTranspositionClass := by
  sorry

theorem ambientStructureSupportsReplacement :
    SupportsReplacement := by
  sorry

theorem ambientStructureSupportsGlobalChoice :
    SupportsGlobalChoice := by
  sorry

theorem ambientFiniteNBGAxiomHolds
    (axiomName : FiniteNBGAxiomName) :
    FiniteNBGAxiomHolds axiomName := by
  sorry

theorem ambientStructureSatisfiesFiniteNBGAxiomatization :
    SatisfiesFiniteNBGAxiomatization := by
  sorry

theorem ambientStructureSatisfiesNBG :
    SatisfiesNBG := by
  sorry

end LRA.Set.Constructions.NBG
