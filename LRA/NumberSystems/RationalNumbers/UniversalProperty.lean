import LRA.NumberSystems.RationalNumbers.Definition
import LRA.VolumeII.NumberSystems.CanonicalEmbeddings

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.Models
open LRA.NumberSystems.Models.CanonicalEmbeddings

universe u

/-- The rational number system has the fraction-field universal property.

Given a densely ordered field receiving an ordered-ring embedding of the
selected integer number system, there is a unique ordered-field embedding from
the rational field that extends the supplied integer embedding.

Logical form:

```lean
theorem FractionFieldUniversalProperty
    (rationalSystem : RationalNumberSystem.{u})
    (target : DenselyOrderedFieldModel.{u})
    (integerMap : rationalSystem.IntegerSystem.Model.Carrier → target.Carrier)
    (integerMapIsEmbedding :
      EmbeddingPreservesOrderedRing
        rationalSystem.IntegerSystem.Model.signature
        target.signature.toOrderedRingSignature
        integerMap) :
    ∃! rationalMap : rationalSystem.FieldModel.Carrier → target.Carrier,
      EmbeddingPreservesOrderedField
          rationalSystem.FieldModel.signature target.signature rationalMap ∧
        ∀ integerValue : rationalSystem.IntegerSystem.Model.Carrier,
          rationalMap
              (rationalSystem.IntegerEmbedding.ToRational integerValue) =
            integerMap integerValue
```
-/
theorem FractionFieldUniversalProperty
    (rationalSystem : RationalNumberSystem.{u})
    (target : DenselyOrderedFieldModel.{u})
    (integerMap : rationalSystem.IntegerSystem.Model.Carrier → target.Carrier)
    (integerMapIsEmbedding :
      EmbeddingPreservesOrderedRing
        rationalSystem.IntegerSystem.Model.signature
        target.signature.toOrderedRingSignature
        integerMap) :
    ∃! rationalMap : rationalSystem.FieldModel.Carrier → target.Carrier,
      EmbeddingPreservesOrderedField
          rationalSystem.FieldModel.signature target.signature rationalMap ∧
        ∀ integerValue : rationalSystem.IntegerSystem.Model.Carrier,
          rationalMap
              (rationalSystem.IntegerEmbedding.ToRational integerValue) =
            integerMap integerValue := by
  sorry

end LRA.NumberSystems.RationalNumbers
