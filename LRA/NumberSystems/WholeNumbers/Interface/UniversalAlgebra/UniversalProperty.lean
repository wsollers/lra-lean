import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.WholeNumbers.Interface.Satisfy_ModelTheory
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.WholeNumbers.Interface.UniversalAlgebra

open LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory
open LRA.NumberSystems.WholeNumbers.Interface.ModelTheory

/--
`CommutativeSemiring` A commutative semiring realizing the 𝕎 signature: an `OrderedSemiringSignature` together with a proof that it satisfies `WholeNumbersTheory`.

Predicate logic:

  abbrev CommutativeSemiring :=
    {signature : OrderedSemiringSignature // WholeNumbersTheory signature}

Predicate logic (unfolded):

  abbrev CommutativeSemiring :=
    {signature : OrderedSemiringSignature // WholeNumbersTheory signature} (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev CommutativeSemiring :=
  {signature : OrderedSemiringSignature // WholeNumbersTheory signature}
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
abbrev CommutativeSemiring :=
  {signature : OrderedSemiringSignature // WholeNumbersTheory signature}

/--
`CommutativeSemiringArrow` Structure-preserving maps between commutative semirings, realized as homomorphisms between the first-order models each signature induces.

Predicate logic:

  abbrev CommutativeSemiringArrow (source target : CommutativeSemiring) :=
    LRA.UniversalAlgebra.Homomorphism
      (BuildOrderedSemiringModel source.val) (BuildOrderedSemiringModel target.val)

Predicate logic (unfolded):

  abbrev CommutativeSemiringArrow (source target : CommutativeSemiring) :=
    LRA.UniversalAlgebra.Homomorphism
      (BuildOrderedSemiringModel source.val) (BuildOrderedSemiringModel target.val) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev CommutativeSemiringArrow (source target : CommutativeSemiring) :=
  LRA.UniversalAlgebra.Homomorphism
    (BuildOrderedSemiringModel source.val) (BuildOrderedSemiringModel target.val)
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
abbrev CommutativeSemiringArrow (source target : CommutativeSemiring) :=
  LRA.UniversalAlgebra.Homomorphism
    (BuildOrderedSemiringModel source.val) (BuildOrderedSemiringModel target.val)

/--
`WholeNumbersInitial` 𝕎 (realized here by Mathlib's `Nat`) is the initial commutative semiring: every commutative semiring `A` receives exactly one homomorphism from 𝕎, namely `n ↦ n • 1_A`.

Predicate logic:

  LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject LRA.NumberSystems.WholeNumbers.Interface.UniversalAlgebra.CommutativeSemiring LRA.NumberSystems.WholeNumbers.Interface.UniversalAlgebra.CommutativeSemiringArrow ⟨LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.mathlibWholeNumberModel.signature, ⋯⟩

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject LRA.NumberSystems.WholeNumbers.Interface.UniversalAlgebra.CommutativeSemiring LRA.NumberSystems.WholeNumbers.Interface.UniversalAlgebra.CommutativeSemiringArrow ⟨{ carrier := LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.mathlibWholeNumberModel.1, zero := 0, one := 1, add := LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.mathlibWholeNumberModel.addition.realization.spec.1, multiply := LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.mathlibWholeNumberModel.multiplication.realization.spec.1, le := fun x1 x2 => LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.mathlibWholeNumberModel.7.le x1 x2, StrictOrder := fun x1 x2 => LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.mathlibWholeNumberModel.6.lt x1 x2 }, ⋯⟩

Logical form (Lean):

```lean
theorem WholeNumbersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      CommutativeSemiring
      CommutativeSemiringArrow
      ⟨mathlibWholeNumberModel.signature,
        satisfiesModelTheory mathlibWholeNumberModel⟩
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
theorem WholeNumbersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      CommutativeSemiring
      CommutativeSemiringArrow
      ⟨mathlibWholeNumberModel.signature,
        satisfiesModelTheory mathlibWholeNumberModel⟩ := by
  sorry
end LRA.NumberSystems.WholeNumbers.Interface.UniversalAlgebra
