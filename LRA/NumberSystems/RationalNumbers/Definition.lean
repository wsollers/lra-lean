import LRA.NumberSystems.Integers.Definition
import LRA.NumberSystems.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.Integers

universe u

/--
`RationalNumberSystem` TODO

Predicate logic:

  structure RationalNumberSystem : Type (u + 1) where
  IntegerSystem : IntegerNumberSystem.{u}
  FieldModel : DenselyOrderedFieldModel.{u}
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
  FieldModel : DenselyOrderedFieldModel.{u}
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
  FieldModel : DenselyOrderedFieldModel.{u}
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
  FieldModel : DenselyOrderedFieldModel.{u}
  IntegerEmbedding :
    OrderedRingEmbeddingIntoDenseOrderedField IntegerSystem.Model FieldModel
  EveryElementIsIntegerFraction :
    ∀ q : FieldModel.Carrier,
      ∃ numerator denominator : IntegerSystem.Model.Carrier,
        denominator ≠ 0 ∧
        q =
          IntegerEmbedding.ToField numerator *
            (IntegerEmbedding.ToField denominator)⁻¹

end LRA.NumberSystems.RationalNumbers
