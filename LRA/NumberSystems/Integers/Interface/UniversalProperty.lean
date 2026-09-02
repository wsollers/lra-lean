import LRA.NumberSystems.Integers.Interface.ModelTheory.Theory
import LRA.NumberSystems.Integers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.Integers.Interface.Satisfy_ModelTheory
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.Integers

open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory
open LRA.NumberSystems.Integers.Interface.ModelTheory

/-- A discretely-ordered integral domain realizing the ℤ signature: an
`OrderedRingSignature` together with a proof that it satisfies
`IntegersTheory`. -/
abbrev DiscretelyOrderedIntegralDomain :=
  {signature : OrderedRingSignature // IntegersTheory signature}

/-- Structure-preserving maps between discretely-ordered integral domains,
realized as homomorphisms between the first-order models each signature
induces. -/
abbrev DiscretelyOrderedIntegralDomainArrow
    (source target : DiscretelyOrderedIntegralDomain) :=
  LRA.UniversalAlgebra.Homomorphism
    (BuildOrderedRingModel source.val) (BuildOrderedRingModel target.val)

/-- ℤ (realized here by Mathlib's `Int`) is the initial discretely-ordered
integral domain: every discretely-ordered integral domain `A` receives
exactly one homomorphism from ℤ, namely `n ↦ n • 1_A`.

Logical form:

```lean
theorem IntegersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      DiscretelyOrderedIntegralDomain
      DiscretelyOrderedIntegralDomainArrow
      ⟨mathlibIntegerModel.signature, satisfiesModelTheory mathlibIntegerModel⟩
```
-/
theorem IntegersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      DiscretelyOrderedIntegralDomain
      DiscretelyOrderedIntegralDomainArrow
      ⟨mathlibIntegerModel.signature, satisfiesModelTheory mathlibIntegerModel⟩ := by
  sorry
end LRA.NumberSystems.Integers
