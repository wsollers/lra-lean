import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.Models

universe u

/-- A rational number system packages a chosen integer model, a densely ordered
field containing it, and the fraction-generation property saying that every
field element is a quotient of embedded integers.

This distinguishes the actual rational-number stage from the broader
`DenselyOrderedFieldModel` class. In particular, a real model may underlie a
`DenselyOrderedFieldModel`, but it cannot satisfy this fraction-generation
condition over the ordinary integers.

Logical form:

```lean
structure RationalNumberSystem : Type (u + 1) where
  IntegerModel : IntegerModel.{u}
  FieldModel : DenselyOrderedFieldModel.{u}
  IntegerEmbedding :
    IntegerEmbeddingIntoRational IntegerModel FieldModel
  EveryElementIsIntegerFraction :
    ∀ q : FieldModel.Carrier,
      ∃ numerator denominator : IntegerModel.Carrier,
        denominator ≠ 0 ∧
        q =
          IntegerEmbedding.ToRational numerator *
            (IntegerEmbedding.ToRational denominator)⁻¹
```
-/
structure RationalNumberSystem : Type (u + 1) where
  IntegerModel : IntegerModel.{u}
  FieldModel : DenselyOrderedFieldModel.{u}
  IntegerEmbedding :
    IntegerEmbeddingIntoRational IntegerModel FieldModel
  EveryElementIsIntegerFraction :
    ∀ q : FieldModel.Carrier,
      ∃ numerator denominator : IntegerModel.Carrier,
        denominator ≠ 0 ∧
        q =
          IntegerEmbedding.ToRational numerator *
            (IntegerEmbedding.ToRational denominator)⁻¹

end LRA.NumberSystems.RationalNumbers
