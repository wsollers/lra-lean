import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.RationalNumbers.Interface.Satisfy_ModelTheory
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.RationalNumbers

open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

/-- A densely-ordered field realizing the ℚ signature: an
`OrderedFieldSignature` together with a proof that it satisfies
`RationalNumbersTheory`. -/
abbrev DenselyOrderedField :=
  {signature : OrderedFieldSignature // RationalNumbersTheory signature}

/-- Structure-preserving maps between densely-ordered fields, realized as
homomorphisms between the first-order models each signature induces. -/
abbrev DenselyOrderedFieldArrow (source target : DenselyOrderedField) :=
  LRA.UniversalAlgebra.Homomorphism
    (BuildOrderedFieldModel source.val) (BuildOrderedFieldModel target.val)

/-- ℚ (realized here by Mathlib's `Rat`) is the initial densely-ordered
field of characteristic zero: every densely-ordered field `A` receives
exactly one homomorphism from ℚ, namely `p/q ↦ p_A * q_A⁻¹`.

Logical form:

```lean
theorem RationalNumbersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      DenselyOrderedField
      DenselyOrderedFieldArrow
      ⟨mathlibRationalModel.signature, satisfiesModelTheory mathlibRationalModel⟩
```
-/
theorem RationalNumbersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      DenselyOrderedField
      DenselyOrderedFieldArrow
      ⟨mathlibRationalModel.signature, satisfiesModelTheory mathlibRationalModel⟩ := by
  sorry
end LRA.NumberSystems.RationalNumbers
