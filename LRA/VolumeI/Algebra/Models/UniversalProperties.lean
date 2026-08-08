-- LRA/VolumeI/Algebra/Models/UniversalProperties.lean
-- Universal properties for Z, Q, and R.

import LRA.VolumeI.Algebra.Models.CanonicalEmbeddings

namespace LRA.VolumeI.Algebra.Models.UniversalProperties

/-!
Volume II label: universal-properties
Lean module: LRA.VolumeI.Algebra.Models.UniversalProperties
Source: docs/number-systems/gpt-00c-universal-properties.md
Verification status: statement-accepted-proof-pending
-/

structure IntegerUniversalProperty (SelectedIntegerModel : IntegerModel) : Prop where
  InitialForDiscreteOrderedRings :
    ∀ target : IntegerModel,
      ∃ map : SelectedIntegerModel.signature.carrier → target.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedRing
          SelectedIntegerModel.signature target.signature map

structure RationalUniversalProperty
    (SelectedIntegerModel : IntegerModel)
    (SelectedRationalExtension : RationalExtension SelectedIntegerModel) : Prop where
  FractionFieldProperty :
    ∀ target : RationalModel,
      ∀ IntegerMap :
        SelectedIntegerModel.signature.carrier → target.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedRing
          SelectedIntegerModel.signature target.signature.toOrderedRingSignature IntegerMap →
        ∃ RationalMap :
          SelectedRationalExtension.RationalModel.signature.carrier → target.signature.carrier,
          CanonicalEmbeddings.EmbeddingPreservesOrderedField
            SelectedRationalExtension.RationalModel.signature target.signature RationalMap

structure CompleteOrderedFieldCharacterization (SelectedRealModel : RealModel) : Prop where
  RealLaws : RealLaws SelectedRealModel.signature
  UniqueUpToOrderedFieldIsomorphism :
    ∀ other : RealModel,
      ∃ comparison : SelectedRealModel.signature.carrier → other.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedField
          SelectedRealModel.signature other.signature comparison

end LRA.VolumeI.Algebra.Models.UniversalProperties
