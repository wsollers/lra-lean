import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.Integers.Interface.Definition

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.Integers (IntegerNumberSystem)
open LRA.NumberSystems.Integers.Interface.ModelTheory (IntegerModel)

universe u

/--
`OrderedRingEmbeddingIntoDenseOrderedField` An order embedding of an `IntegerModel` into a `RationalModel`: an injective ring homomorphism that also reflects the order — the shape ℚ's "field of fractions of ℤ" embedding takes, owned here by `RationalNumbers` since it is `RationalNumbers` that is being built from `Integers`, not a symmetric relationship between two peer interfaces.

Predicate logic:

  structure OrderedRingEmbeddingIntoDenseOrderedField
      (IntegerSystemModel : IntegerModel) (FieldModel : RationalModel) where
    ToField : IntegerSystemModel.Carrier → FieldModel.Carrier
    injective : ∀ a b, ToField a = ToField b → a = b
    PreservesZero : ToField 0 = 0
    PreservesOne : ToField 1 = 1
    PreservesAddition : ∀ a b, ToField (a + b) = ToField a + ToField b
    PreservesNegation : ∀ a, ToField (-a) = -(ToField a)
    PreservesMultiplication : ∀ a b, ToField (a * b) = ToField a * ToField b
    PreservesAndReflectsOrder : ∀ a b, ToField a ≤ ToField b ↔ a ≤ b

Predicate logic (unfolded):

  structure OrderedRingEmbeddingIntoDenseOrderedField
      (IntegerSystemModel : IntegerModel) (FieldModel : RationalModel) where
    ToField : IntegerSystemModel.Carrier → FieldModel.Carrier
    injective : ∀ a b, ToField a = ToField b → a = b
    PreservesZero : ToField 0 = 0
    PreservesOne : ToField 1 = 1
    PreservesAddition : ∀ a b, ToField (a + b) = ToField a + ToField b
    PreservesNegation : ∀ a, ToField (-a) = -(ToField a)
    PreservesMultiplication : ∀ a b, ToField (a * b) = ToField a * ToField b
    PreservesAndReflectsOrder : ∀ a b, ToField a ≤ ToField b ↔ a ≤ b (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure OrderedRingEmbeddingIntoDenseOrderedField
    (IntegerSystemModel : IntegerModel) (FieldModel : RationalModel) where
  ToField : IntegerSystemModel.Carrier → FieldModel.Carrier
  injective : ∀ a b, ToField a = ToField b → a = b
  PreservesZero : ToField 0 = 0
  PreservesOne : ToField 1 = 1
  PreservesAddition : ∀ a b, ToField (a + b) = ToField a + ToField b
  PreservesNegation : ∀ a, ToField (-a) = -(ToField a)
  PreservesMultiplication : ∀ a b, ToField (a * b) = ToField a * ToField b
  PreservesAndReflectsOrder : ∀ a b, ToField a ≤ ToField b ↔ a ≤ b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
structure OrderedRingEmbeddingIntoDenseOrderedField
    (IntegerSystemModel : IntegerModel) (FieldModel : RationalModel) where
  ToField : IntegerSystemModel.Carrier → FieldModel.Carrier
  injective : ∀ a b, ToField a = ToField b → a = b
  PreservesZero : ToField 0 = 0
  PreservesOne : ToField 1 = 1
  PreservesAddition : ∀ a b, ToField (a + b) = ToField a + ToField b
  PreservesNegation : ∀ a, ToField (-a) = -(ToField a)
  PreservesMultiplication : ∀ a b, ToField (a * b) = ToField a * ToField b
  PreservesAndReflectsOrder : ∀ a b, ToField a ≤ ToField b ↔ a ≤ b

/--
`RationalNumberSystem` A `RationalNumberSystem` bundles an `IntegerNumberSystem` (ℤ), a `RationalModel` (the field it embeds into), and a witness that the field embedding realizes ℚ as the field of fractions of that copy of ℤ: every element is `ToField numerator * (ToField denominator)⁻¹` for some nonzero integer `denominator`.

Predicate logic:

  structure RationalNumberSystem : Type (u + 1) where
    IntegerSystem : IntegerNumberSystem.{u}
    FieldModel : RationalModel.{u}
    IntegerEmbedding :
      OrderedRingEmbeddingIntoDenseOrderedField IntegerSystem.Model FieldModel
    EveryElementIsIntegerFraction :
      ∀ q : FieldModel.Carrier,
        ∃ numerator denominator : IntegerSystem.Model.Carrier,
          denominator ≠ 0 ∧
          q =
            IntegerEmbedding.ToField numerator *
              (IntegerEmbedding.ToField denominator)⁻¹

Predicate logic (unfolded):

  structure RationalNumberSystem : Type (u + 1) where
    IntegerSystem : IntegerNumberSystem.{u}
    FieldModel : RationalModel.{u}
    IntegerEmbedding :
      OrderedRingEmbeddingIntoDenseOrderedField IntegerSystem.Model FieldModel
    EveryElementIsIntegerFraction :
      ∀ q : FieldModel.Carrier,
        ∃ numerator denominator : IntegerSystem.Model.Carrier,
          denominator ≠ 0 ∧
          q =
            IntegerEmbedding.ToField numerator *
              (IntegerEmbedding.ToField denominator)⁻¹ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RationalNumberSystem : Type (u + 1) where
  IntegerSystem : IntegerNumberSystem.{u}
  FieldModel : RationalModel.{u}
  IntegerEmbedding :
    OrderedRingEmbeddingIntoDenseOrderedField IntegerSystem.Model FieldModel
  EveryElementIsIntegerFraction :
    ∀ q : FieldModel.Carrier,
      ∃ numerator denominator : IntegerSystem.Model.Carrier,
        denominator ≠ 0 ∧
        q =
          IntegerEmbedding.ToField numerator *
            (IntegerEmbedding.ToField denominator)⁻¹
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
structure RationalNumberSystem : Type (u + 1) where
  IntegerSystem : IntegerNumberSystem.{u}
  FieldModel : RationalModel.{u}
  IntegerEmbedding :
    OrderedRingEmbeddingIntoDenseOrderedField IntegerSystem.Model FieldModel
  EveryElementIsIntegerFraction :
    ∀ q : FieldModel.Carrier,
      ∃ numerator denominator : IntegerSystem.Model.Carrier,
        denominator ≠ 0 ∧
        q =
          IntegerEmbedding.ToField numerator *
            (IntegerEmbedding.ToField denominator)⁻¹

/--
`ArchimedeanDenseOrderedFieldExtension` An `ArchimedeanDenseOrderedFieldExtension` witnesses that a `RationalModel` extends a given `IntegerModel` order-preservingly — the shape ℚ's embedding of ℤ realizes when treated as the Archimedean ground floor a real extension is later built above.

Predicate logic:

  structure ArchimedeanDenseOrderedFieldExtension
      (IntegerSystemModel : IntegerModel.{u}) where
    RationalModel : RationalModel.{u}
    IntegerEmbedding :
      OrderedRingEmbeddingIntoDenseOrderedField IntegerSystemModel RationalModel

Predicate logic (unfolded):

  structure ArchimedeanDenseOrderedFieldExtension
      (IntegerSystemModel : IntegerModel.{u}) where
    RationalModel : RationalModel.{u}
    IntegerEmbedding :
      OrderedRingEmbeddingIntoDenseOrderedField IntegerSystemModel RationalModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure ArchimedeanDenseOrderedFieldExtension
    (IntegerSystemModel : IntegerModel.{u}) where
  RationalModel : RationalModel.{u}
  IntegerEmbedding :
    OrderedRingEmbeddingIntoDenseOrderedField IntegerSystemModel RationalModel
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
structure ArchimedeanDenseOrderedFieldExtension
    (IntegerSystemModel : IntegerModel.{u}) where
  RationalModel : RationalModel.{u}
  IntegerEmbedding :
    OrderedRingEmbeddingIntoDenseOrderedField IntegerSystemModel RationalModel

end LRA.NumberSystems.RationalNumbers
