-- LRA/VolumeII/NumberSystems/UniversalProperties.lean
-- Generic model-level universal properties for reals.

import LRA.VolumeII.NumberSystems.CanonicalEmbeddings

namespace LRA.NumberSystems.Models.UniversalProperties

universe u

/-!
Volume II label: universal-properties
Lean module: LRA.NumberSystems.Models.UniversalProperties
Source: docs/number-systems/gpt-00c-universal-properties.md
Verification status: statement-accepted-proof-pending

Integer initiality is owned by `LRA.NumberSystems.Integers.UniversalProperty`,
because its source must be an actual `IntegerNumberSystem`, not an arbitrary
discretely ordered integral domain. The rational fraction-field universal
property is similarly owned by
`LRA.NumberSystems.RationalNumbers.UniversalProperty`.
-/

/-- Complete ordered fields are unique up to ordered-field isomorphism.

Logical form:

```lean
structure CompleteOrderedFieldCharacterization
    (SelectedRealModel : RealModel.{u}) : Prop where
  UniqueUpToOrderedFieldIsomorphism :
    ∀ other : RealModel.{u},
      ∃ comparison : SelectedRealModel.signature.carrier → other.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedField
          SelectedRealModel.signature other.signature comparison
```
-/
structure CompleteOrderedFieldCharacterization
    (SelectedRealModel : RealModel.{u}) : Prop where
  UniqueUpToOrderedFieldIsomorphism :
    ∀ other : RealModel.{u},
      ∃ comparison : SelectedRealModel.signature.carrier → other.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedField
          SelectedRealModel.signature other.signature comparison

end LRA.NumberSystems.Models.UniversalProperties
