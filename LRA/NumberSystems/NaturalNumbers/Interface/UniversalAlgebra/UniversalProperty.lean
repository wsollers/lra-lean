import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.NaturalNumbers.Interface.Satisfy_ModelTheory
import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Definitions.ConceptSignature
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra

open LRA.AlgebraicStructures (CommutativeSemiringWithoutZeroConceptSignature)
open LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

/-- A positive commutative semiring realizing the ℕ signature: a
`CommutativeSemiringWithoutZeroConceptSignature` together with a proof that it
satisfies `NaturalNumbersTheory`. -/
abbrev PositiveCommutativeSemiring :=
  {signature : CommutativeSemiringWithoutZeroConceptSignature //
    NaturalNumbersTheory signature}

/-- Structure-preserving maps between positive commutative semirings, realized
as homomorphisms between the first-order models each signature induces. -/
abbrev PositiveCommutativeSemiringArrow
    (source target : PositiveCommutativeSemiring) :=
  LRA.UniversalAlgebra.Homomorphism
    (naturalNumbersModel source.val) (naturalNumbersModel target.val)

/-- ℕ (realized here by Mathlib's `Nat`) is the initial positive commutative
semiring: every positive commutative semiring `A` receives exactly one
homomorphism from ℕ, namely `n ↦ n • 1_A`.

Logical form:

```lean
theorem NaturalNumbersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      PositiveCommutativeSemiring
      PositiveCommutativeSemiringArrow
      ⟨mathlibNaturalNumberModel.signature,
        satisfiesModelTheory mathlibNaturalNumberModel⟩
```
-/
theorem NaturalNumbersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      PositiveCommutativeSemiring
      PositiveCommutativeSemiringArrow
      ⟨mathlibNaturalNumberModel.signature,
        satisfiesModelTheory mathlibNaturalNumberModel⟩ := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra
