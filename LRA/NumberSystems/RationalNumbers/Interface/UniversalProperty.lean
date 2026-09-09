import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.RationalNumbers.Interface.Satisfy_ModelTheory
import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObjects

namespace LRA.NumberSystems.RationalNumbers

open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

/--
`DenselyOrderedField` A densely-ordered field realizing the ℚ signature: an `OrderedFieldSignature` together with a proof that it satisfies `RationalNumbersTheory`.

Predicate logic:

  abbrev DenselyOrderedField :=
    {signature : OrderedFieldSignature // RationalNumbersTheory signature}

Predicate logic (unfolded):

  abbrev DenselyOrderedField :=
    {signature : OrderedFieldSignature // RationalNumbersTheory signature} (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev DenselyOrderedField :=
  {signature : OrderedFieldSignature // RationalNumbersTheory signature}
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
abbrev DenselyOrderedField :=
  {signature : OrderedFieldSignature // RationalNumbersTheory signature}

/--
`DenselyOrderedFieldArrow` Structure-preserving maps between densely-ordered fields, realized as homomorphisms between the first-order models each signature induces.

Predicate logic:

  abbrev DenselyOrderedFieldArrow (source target : DenselyOrderedField) :=
    LRA.UniversalAlgebra.Homomorphism
      (BuildOrderedFieldModel source.val) (BuildOrderedFieldModel target.val)

Predicate logic (unfolded):

  abbrev DenselyOrderedFieldArrow (source target : DenselyOrderedField) :=
    LRA.UniversalAlgebra.Homomorphism
      (BuildOrderedFieldModel source.val) (BuildOrderedFieldModel target.val) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev DenselyOrderedFieldArrow (source target : DenselyOrderedField) :=
  LRA.UniversalAlgebra.Homomorphism
    (BuildOrderedFieldModel source.val) (BuildOrderedFieldModel target.val)
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
abbrev DenselyOrderedFieldArrow (source target : DenselyOrderedField) :=
  LRA.UniversalAlgebra.Homomorphism
    (BuildOrderedFieldModel source.val) (BuildOrderedFieldModel target.val)

/--
`RationalNumbersInitial` ℚ (realized here by Mathlib's `Rat`) is the initial densely-ordered field of characteristic zero: every densely-ordered field `A` receives exactly one homomorphism from ℚ, namely `p/q ↦ p_A * q_A⁻¹`.

Predicate logic:

  LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject LRA.NumberSystems.RationalNumbers.DenselyOrderedField LRA.NumberSystems.RationalNumbers.DenselyOrderedFieldArrow ⟨LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.mathlibRationalModel.signature, ⋯⟩

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject LRA.NumberSystems.RationalNumbers.DenselyOrderedField LRA.NumberSystems.RationalNumbers.DenselyOrderedFieldArrow ⟨{ carrier := LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.mathlibRationalModel.1, zero := 0, one := 1, add := fun x1 x2 => { hAdd := fun a b => LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.mathlibRationalModel.2.add a b }.hAdd x1 x2, multiply := fun x1 x2 => { hMul := fun a b => LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.mathlibRationalModel.3.mul a b }.hMul x1 x2, neg := fun x => LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.mathlibRationalModel.4.neg x, le := fun x1 x2 => LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.mathlibRationalModel.9.le x1 x2, StrictOrder := fun x1 x2 => LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.mathlibRationalModel.8.lt x1 x2, inv := fun x => LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.mathlibRationalModel.invInst.1 x }, ⋯⟩

Logical form (Lean):

```lean
theorem RationalNumbersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      DenselyOrderedField
      DenselyOrderedFieldArrow
      ⟨mathlibRationalModel.signature, satisfiesModelTheory mathlibRationalModel⟩
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
theorem RationalNumbersInitial :
    LRA.UniversalAlgebra.UniversalProperties.Basic.InitialObject
      DenselyOrderedField
      DenselyOrderedFieldArrow
      ⟨mathlibRationalModel.signature, satisfiesModelTheory mathlibRationalModel⟩ := by
  sorry
end LRA.NumberSystems.RationalNumbers
