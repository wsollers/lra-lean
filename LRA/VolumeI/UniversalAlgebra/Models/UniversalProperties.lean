-- LRA/VolumeI/UniversalAlgebra/Models/UniversalProperties.lean
-- Universal properties for Z, Q, and R.

import LRA.VolumeI.UniversalAlgebra.Models.CanonicalEmbeddings

namespace LRA.UniversalAlgebra.Models.UniversalProperties

universe u

/-!
Volume II label: universal-properties
Lean module: LRA.UniversalAlgebra.Models.UniversalProperties
Source: docs/number-systems/gpt-00c-universal-properties.md
Verification status: statement-accepted-proof-pending
-/
/--
`IntegerUniversalProperty` exposes this formal declaration.

Logical form:

```lean
structure IntegerUniversalProperty (SelectedIntegerModel : IntegerModel.{u}) : Prop where
  InitialForDiscreteOrderedRings :
    ∀ target : IntegerModel.{u},
      ∃ map : SelectedIntegerModel.signature.carrier → target.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedRing
          SelectedIntegerModel.signature target.signature map
```
-/

structure IntegerUniversalProperty (SelectedIntegerModel : IntegerModel.{u}) : Prop where
  InitialForDiscreteOrderedRings :
    ∀ target : IntegerModel.{u},
      ∃ map : SelectedIntegerModel.signature.carrier → target.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedRing
          SelectedIntegerModel.signature target.signature map
/--
`RationalUniversalProperty` exposes this formal declaration.

Logical form:

```lean
structure RationalUniversalProperty
    (SelectedIntegerModel : IntegerModel.{u})
    (SelectedRationalExtension : RationalExtension SelectedIntegerModel) : Prop where
  FractionFieldProperty :
    ∀ target : RationalModel.{u},
      ∀ IntegerMap :
        SelectedIntegerModel.signature.carrier → target.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedRing
          SelectedIntegerModel.signature target.signature.toOrderedRingSignature IntegerMap →
        ∃ RationalMap :
          SelectedRationalExtension.RationalModel.signature.carrier → target.signature.carrier,
          CanonicalEmbeddings.EmbeddingPreservesOrderedField
            SelectedRationalExtension.RationalModel.signature target.signature RationalMap
```
-/

structure RationalUniversalProperty
    (SelectedIntegerModel : IntegerModel.{u})
    (SelectedRationalExtension : RationalExtension SelectedIntegerModel) : Prop where
  FractionFieldProperty :
    ∀ target : RationalModel.{u},
      ∀ IntegerMap :
        SelectedIntegerModel.signature.carrier → target.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedRing
          SelectedIntegerModel.signature target.signature.toOrderedRingSignature IntegerMap →
        ∃ RationalMap :
          SelectedRationalExtension.RationalModel.signature.carrier → target.signature.carrier,
          CanonicalEmbeddings.EmbeddingPreservesOrderedField
            SelectedRationalExtension.RationalModel.signature target.signature RationalMap
/--
`CompleteOrderedFieldCharacterization` exposes this formal declaration.

Logical form:

```lean
structure CompleteOrderedFieldCharacterization (SelectedRealModel : RealModel.{u}) : Prop where
  UniqueUpToOrderedFieldIsomorphism :
    ∀ other : RealModel.{u},
      ∃ comparison : SelectedRealModel.signature.carrier → other.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedField
          SelectedRealModel.signature other.signature comparison
```
-/

structure CompleteOrderedFieldCharacterization (SelectedRealModel : RealModel.{u}) : Prop where
  UniqueUpToOrderedFieldIsomorphism :
    ∀ other : RealModel.{u},
      ∃ comparison : SelectedRealModel.signature.carrier → other.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedField
          SelectedRealModel.signature other.signature comparison

end LRA.UniversalAlgebra.Models.UniversalProperties
