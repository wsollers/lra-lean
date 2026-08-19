import LRA.NaturalNumbers.Constructions.Landau.Carrier
import LRA.NumberSystems.PeanoSystem.Definition

/-!
The three Peano properties of the Landau carrier -- postulated directly as
axioms here, not proved, per this construction's whole point (see
`Carrier.lean`). `Membership LandauElement (PredicateSet LandauElement)`
comes from `PredicateSet.Definition`, the same as `Presburger`'s.
-/

namespace LRA.NaturalNumbers.Constructions.Landau

open LRA.Set

/-- The distinguished element is not a successor. -/
axiom LandauBaseNotSuccessor :
    ∀ element : LandauElement, LandauSuccessor element ≠ LandauOne

/-- The successor operation is injective. -/
axiom LandauSuccessorInjective :
    ∀ first second : LandauElement,
      LandauSuccessor first = LandauSuccessor second → first = second

/-- Induction. -/
axiom LandauInduction :
    ∀ subset : PredicateSet LandauElement,
      LandauOne ∈ subset →
      (∀ element : LandauElement, element ∈ subset → LandauSuccessor element ∈ subset) →
      ∀ element : LandauElement, element ∈ subset

/-- The Landau construction, packaged as a `PeanoSystem` over its own
postulated carrier and `PredicateSet` subsets -- built directly from the
axioms above, with no proof obligation of its own. -/
noncomputable def LandauPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      LandauElement (PredicateSet LandauElement) where
  one := LandauOne
  successor := LandauSuccessor
  one_not_successor := LandauBaseNotSuccessor
  successor_injective := LandauSuccessorInjective
  induction := LandauInduction

end LRA.NaturalNumbers.Constructions.Landau
