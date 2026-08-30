import LRA.Set.Constructions.GrothendieckUniverse.Axioms

namespace LRA.Set.Constructions.GrothendieckUniverse

universe u

variable {SetObject : Type u} [Membership SetObject SetObject]

theorem GrothendieckUniverseExists
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    ∃ U : SetObject, IsGrothendieckUniverseFor A U := by
  sorry

noncomputable def TheGrothendieckUniverse
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) : SetObject :=
  Classical.choose (GrothendieckUniverseExists A)

theorem TheGrothendieckUniverseIsGrothendieckUniverseFor
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    IsGrothendieckUniverseFor A (TheGrothendieckUniverse A) := by
  sorry

theorem GrothendieckUniverseContainsBase
    {A U : SetObject}
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    A ∈ U := by
  sorry

theorem GrothendieckUniverseIsTransitive
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsTransitiveUniverse U := by
  sorry

theorem GrothendieckUniverseClosedUnderPairing
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsClosedUnderPairing U := by
  sorry

theorem GrothendieckUniverseClosedUnderPowerSet
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsClosedUnderPowerSet U := by
  sorry

theorem GrothendieckUniverseClosedUnderIndexedUnion
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsClosedUnderIndexedUnion U := by
  sorry

theorem GrothendieckUniverseContainsInductiveSet
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    ContainsInductiveSet U := by
  sorry

theorem GrothendieckUniverseContainsEmptySet
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    ∃ empty : SetObject, empty ∈ U ∧ IsEmptySet empty := by
  sorry

end LRA.Set.Constructions.GrothendieckUniverse
