import LRA.Set.Constructions.GrothendieckUniverse.Axioms

namespace LRA.Set.Constructions.GrothendieckUniverse

universe u

variable {SetObject : Type u} [Membership SetObject SetObject]

theorem GrothendieckUniverseExists
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    ∃ U : SetObject, IsGrothendieckUniverseFor A U :=
  GrothendieckUniverseAxiom.universeExists A

noncomputable def TheGrothendieckUniverse
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) : SetObject :=
  Classical.choose (GrothendieckUniverseExists A)

theorem TheGrothendieckUniverseIsGrothendieckUniverseFor
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    IsGrothendieckUniverseFor A (TheGrothendieckUniverse A) :=
  Classical.choose_spec (GrothendieckUniverseExists A)

theorem GrothendieckUniverseContainsBase
    {A U : SetObject}
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    A ∈ U :=
  universeHypothesis.1

theorem GrothendieckUniverseIsTransitive
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsTransitiveUniverse U :=
  universeHypothesis.1

theorem GrothendieckUniverseClosedUnderPairing
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsClosedUnderPairing U :=
  universeHypothesis.2.1

theorem GrothendieckUniverseClosedUnderPowerSet
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsClosedUnderPowerSet U :=
  universeHypothesis.2.2.1

theorem GrothendieckUniverseClosedUnderIndexedUnion
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsClosedUnderIndexedUnion U :=
  universeHypothesis.2.2.2.1

theorem GrothendieckUniverseContainsInductiveSet
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    ContainsInductiveSet U :=
  universeHypothesis.2.2.2.2

theorem GrothendieckUniverseContainsEmptySet
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    ∃ empty : SetObject, empty ∈ U ∧ IsEmptySet empty := by
  sorry

end LRA.Set.Constructions.GrothendieckUniverse
