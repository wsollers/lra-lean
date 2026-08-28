import LRA.NumberSystems.RationalNumbers.Interface.Definition
import LRA.NumberSystems.Integers.Interface.ModelTheory.Model
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

universe u

/-- An order embedding of a `RationalModel` into a `RealModel`: an injective
field homomorphism that also reflects the order — the shape ℝ's completion
of ℚ takes, owned here by `RealNumbers` since it is `RealNumbers` that is
being built from `RationalNumbers`, not a symmetric relationship between two
peer interfaces. -/
structure DenseOrderedFieldEmbeddingIntoReal
    (RationalSystemModel : RationalModel.{u}) (Real : RealModel.{u}) where
  ToReal : RationalSystemModel.Carrier → Real.Carrier
  injective : ∀ a b, ToReal a = ToReal b → a = b
  PreservesZero : ToReal 0 = 0
  PreservesOne : ToReal 1 = 1
  PreservesAddition : ∀ a b, ToReal (a + b) = ToReal a + ToReal b
  PreservesNegation : ∀ a, ToReal (-a) = -(ToReal a)
  PreservesMultiplication : ∀ a b, ToReal (a * b) = ToReal a * ToReal b
  PreservesInverse : ∀ a, a ≠ 0 → ToReal a⁻¹ = (ToReal a)⁻¹
  PreservesAndReflectsOrder : ∀ a b, ToReal a ≤ ToReal b ↔ a ≤ b

/-- A `CofinalRealExtension` witnesses that a `RealModel` completes a given
`RationalModel`: the field embeds into it order-preservingly, and the
embedded copy is cofinal (every real value is bounded above by some embedded
rational) — the shape a Cauchy/Dedekind/interval completion realizes. -/
structure CofinalRealExtension (RationalSystemModel : RationalModel.{u}) where
  RealModel : RealModel.{u}
  DenseOrderedFieldEmbedding :
    DenseOrderedFieldEmbeddingIntoReal RationalSystemModel RealModel
  DenseOrderedFieldEmbeddingIsCofinal :
    ∀ value : RealModel.Carrier,
      ∃ bound : RationalSystemModel.Carrier,
        value < DenseOrderedFieldEmbedding.ToReal bound

/--
`RationalRealExtension` TODO

Predicate logic:

  structure RationalRealExtension
    (RationalSystem : RationalNumberSystem.{u})
    extends CofinalRealExtension RationalSystem.FieldModel

Predicate logic (unfolded):

  structure RationalRealExtension
    (RationalSystem : RationalNumberSystem.{u})
    extends CofinalRealExtension RationalSystem.FieldModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RationalRealExtension
    (RationalSystem : RationalNumberSystem.{u})
    extends CofinalRealExtension RationalSystem.FieldModel
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
structure RationalRealExtension
    (RationalSystem : RationalNumberSystem.{u})
    extends CofinalRealExtension RationalSystem.FieldModel

/--
`RationalRealExtension.EmbedRational` TODO

Predicate logic:

  def RationalRealExtension.EmbedRational
    {RationalSystem : RationalNumberSystem.{u}}
    (Extension : RationalRealExtension RationalSystem) :
    RationalSystem.FieldModel.Carrier → Extension.RealModel.Carrier :=
  Extension.DenseOrderedFieldEmbedding.ToReal

Predicate logic (unfolded):

  def RationalRealExtension.EmbedRational
    {RationalSystem : RationalNumberSystem.{u}}
    (Extension : RationalRealExtension RationalSystem) :
    RationalSystem.FieldModel.Carrier → Extension.RealModel.Carrier :=
  Extension.DenseOrderedFieldEmbedding.ToReal (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalRealExtension.EmbedRational
    {RationalSystem : RationalNumberSystem.{u}}
    (Extension : RationalRealExtension RationalSystem) :
    RationalSystem.FieldModel.Carrier → Extension.RealModel.Carrier :=
  Extension.DenseOrderedFieldEmbedding.ToReal
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RationalRealExtension.EmbedRational
    {RationalSystem : RationalNumberSystem.{u}}
    (Extension : RationalRealExtension RationalSystem) :
    RationalSystem.FieldModel.Carrier → Extension.RealModel.Carrier :=
  Extension.DenseOrderedFieldEmbedding.ToReal

end LRA.NumberSystems.RealNumbers
