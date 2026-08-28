import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.WholeNumbers.Interface.Satisfy_ModelTheory
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.WholeNumbers.Interface.UniversalAlgebra

open LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory
open LRA.NumberSystems.WholeNumbers.Interface.ModelTheory

/-- A commutative semiring realizing the 𝕎 signature: an
`OrderedSemiringSignature` together with a proof that it satisfies
`WholeNumbersTheory`. -/
abbrev CommutativeSemiring :=
  {signature : OrderedSemiringSignature // WholeNumbersTheory signature}

/-- Structure-preserving maps between commutative semirings, realized as
homomorphisms between the first-order models each signature induces. -/
abbrev CommutativeSemiringArrow (source target : CommutativeSemiring) :=
  LRA.UniversalAlgebra.Homomorphism
    (BuildOrderedSemiringModel source.val) (BuildOrderedSemiringModel target.val)

/-- 𝕎 (realized here by Mathlib's `Nat`) is the initial commutative semiring:
every commutative semiring `A` receives exactly one homomorphism from 𝕎,
namely `n ↦ n • 1_A`.

Logical form:

```lean
theorem WholeNumbersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      CommutativeSemiring
      CommutativeSemiringArrow
      ⟨mathlibWholeNumberModel.signature,
        satisfiesModelTheory mathlibWholeNumberModel⟩
```
-/
theorem WholeNumbersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      CommutativeSemiring
      CommutativeSemiringArrow
      ⟨mathlibWholeNumberModel.signature,
        satisfiesModelTheory mathlibWholeNumberModel⟩ := by
  sorry

end LRA.NumberSystems.WholeNumbers.Interface.UniversalAlgebra
