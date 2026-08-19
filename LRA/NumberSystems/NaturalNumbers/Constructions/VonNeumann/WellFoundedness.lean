import LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Carrier
import LRA.NumberSystems.PeanoSystem.Definition

/-!
The three Peano properties of `NaturalElement`/`NaturalZero`/`NaturalSuccessor`,
and their packaging into a `LRA.NumberSystems.PeanoSystem.PeanoSystem` value --
the proof that this construction actually realizes the generic interface.

Every theorem below is `sorry`. `NaturalSuccessorInjective` is the one that
needs the Foundation prerequisite from `LRA/NumberSystems/NaturalNumbers/ProofOrder.md`
section 1; the rest need only what `Carrier.lean` already states (also
`sorry`, per the same order).
-/

namespace LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann

open LRA.Set.ZFC

/-- ∅ is not the von Neumann successor of any natural element: every
successor contains its predecessor, so it is never empty. Does not need
Foundation. -/
theorem NaturalZeroIsNotSuccessor :
    ∀ element : NaturalElement, NaturalSuccessor element ≠ NaturalZero := by
  sorry

/-- The von Neumann successor is injective on natural elements. Needs
`LRA.Set.ZFC.NoSetIsMemberOfItself`/`FoundationWitnessExists` (still `sorry`
themselves, per the ZFC prerequisites) to rule out the 2-cycle
`x ∈ y ∧ y ∈ x`. -/
theorem NaturalSuccessorInjective :
    ∀ first second : NaturalElement,
      NaturalSuccessor first = NaturalSuccessor second → first = second := by
  sorry

/-- Induction on the natural elements: any `ZFCSet` containing `NaturalZero`
and closed under `NaturalSuccessor` contains every natural element. This is
`Omega`'s minimality (`Carrier.lean`'s `TheSeparatedSubset` characterization)
restated in `PeanoSystem`'s own shape. -/
theorem NaturalInductionPrinciple :
    ∀ subset : LRA.Set.ZFCSet,
      NaturalZero ∈ subset →
      (∀ element : NaturalElement, element ∈ subset → NaturalSuccessor element ∈ subset) →
      ∀ element : NaturalElement, element ∈ subset := by
  sorry

/-- The von Neumann construction, packaged as a `PeanoSystem` over its own
carrier and `ZFCSet` subsets -- the same shape
`PresburgerModel.toPeanoSystem` already uses for Presburger's own backend. -/
noncomputable def VonNeumannPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem NaturalElement LRA.Set.ZFCSet where
  one := NaturalZero
  successor := NaturalSuccessor
  one_not_successor := NaturalZeroIsNotSuccessor
  successor_injective := NaturalSuccessorInjective
  induction := NaturalInductionPrinciple

end LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
