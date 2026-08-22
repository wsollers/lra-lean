import LRA.NumberSystems.Integers.Definition
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.Models
open LRA.NumberSystems.Integers

universe u

/-- A rational number system packages an actual integer number system, a
densely ordered field containing it, and the fraction-generation property
saying that every field element is a quotient of embedded integers.

This distinguishes the actual rational-number stage from the broader
`DenselyOrderedFieldModel` class. Its integer source is likewise the
integer-specific `IntegerNumberSystem`, not merely an arbitrary discretely
ordered integral domain.

Logical form:

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
