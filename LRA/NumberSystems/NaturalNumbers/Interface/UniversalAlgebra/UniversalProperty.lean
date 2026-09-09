import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.NaturalNumbers.Interface.Satisfy_ModelTheory
import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Definitions.ConceptSignature
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra

open LRA.AlgebraicStructures (CommutativeSemiringWithoutZeroConceptSignature)
open LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

/--
`PositiveCommutativeSemiring` A positive commutative semiring realizing the ℕ signature: a `CommutativeSemiringWithoutZeroConceptSignature` together with a proof that it satisfies `NaturalNumbersTheory`.

Predicate logic:

  abbrev PositiveCommutativeSemiring :=
    {signature : CommutativeSemiringWithoutZeroConceptSignature //
      NaturalNumbersTheory signature}

Predicate logic (unfolded):

  abbrev PositiveCommutativeSemiring :=
    {signature : CommutativeSemiringWithoutZeroConceptSignature //
      NaturalNumbersTheory signature} (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PositiveCommutativeSemiring :=
  {signature : CommutativeSemiringWithoutZeroConceptSignature //
    NaturalNumbersTheory signature}
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev PositiveCommutativeSemiring :=
  {signature : CommutativeSemiringWithoutZeroConceptSignature //
    NaturalNumbersTheory signature}

/--
`PositiveCommutativeSemiringArrow` Structure-preserving maps between positive commutative semirings, realized as homomorphisms between the first-order models each signature induces.

Predicate logic:

  abbrev PositiveCommutativeSemiringArrow
      (source target : PositiveCommutativeSemiring) :=
    LRA.UniversalAlgebra.Homomorphism
      (naturalNumbersModel source.val) (naturalNumbersModel target.val)

Predicate logic (unfolded):

  abbrev PositiveCommutativeSemiringArrow
      (source target : PositiveCommutativeSemiring) :=
    LRA.UniversalAlgebra.Homomorphism
      (naturalNumbersModel source.val) (naturalNumbersModel target.val) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PositiveCommutativeSemiringArrow
    (source target : PositiveCommutativeSemiring) :=
  LRA.UniversalAlgebra.Homomorphism
    (naturalNumbersModel source.val) (naturalNumbersModel target.val)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev PositiveCommutativeSemiringArrow
    (source target : PositiveCommutativeSemiring) :=
  LRA.UniversalAlgebra.Homomorphism
    (naturalNumbersModel source.val) (naturalNumbersModel target.val)

/--
`NaturalNumbersInitial` ℕ (realized here by Mathlib's `Nat`) is the initial positive commutative semiring: every positive commutative semiring `A` receives exactly one homomorphism from ℕ, namely `n ↦ n • 1_A`.

Predicate logic:

  LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra.PositiveCommutativeSemiring LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra.PositiveCommutativeSemiringArrow ⟨LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.mathlibNaturalNumberModel.signature, ⋯⟩

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra.PositiveCommutativeSemiring LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra.PositiveCommutativeSemiringArrow ⟨{ carrier := LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.mathlibNaturalNumberModel.1, add := LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.mathlibNaturalNumberModel.addition.realization.spec.1, multiply := LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.mathlibNaturalNumberModel.multiplication.realization.spec.1, one := 1 }, ⋯⟩

Logical form (Lean):

```lean
theorem NaturalNumbersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      PositiveCommutativeSemiring
      PositiveCommutativeSemiringArrow
      ⟨mathlibNaturalNumberModel.signature,
        satisfiesModelTheory mathlibNaturalNumberModel⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem NaturalNumbersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      PositiveCommutativeSemiring
      PositiveCommutativeSemiringArrow
      ⟨mathlibNaturalNumberModel.signature,
        satisfiesModelTheory mathlibNaturalNumberModel⟩ := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra
