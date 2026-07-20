-- LRA/VolumeII/NumberSystems/UniversalProperties.lean
-- Universal properties for Z, Q, and R.

import LRA.VolumeII.NumberSystems.CanonicalEmbeddings

namespace LRA
namespace VolumeII
namespace NumberSystems
namespace UniversalProperties

/-!
Volume II label: universal-properties
Lean module: LRA.VolumeII.NumberSystems.UniversalProperties
Source: docs/number-systems/gpt-00c-universal-properties.md
Verification status: statement-accepted-proof-pending
-/

structure IntegerUniversalProperty (integer_model : IntegerModel) : Prop where
  initial_for_discrete_ordered_rings :
    ∀ target : IntegerModel,
      ∃ map : integer_model.signature.carrier → target.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedRing
          integer_model.signature target.signature map

structure RationalUniversalProperty
    (integer_model : IntegerModel)
    (rational_extension : RationalExtension integer_model) : Prop where
  fraction_field_property :
    ∀ target : RationalModel,
      ∀ integer_map :
        integer_model.signature.carrier → target.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedRing
          integer_model.signature target.signature.toOrderedRingSignature integer_map →
        ∃ rational_map :
          rational_extension.rational_model.signature.carrier → target.signature.carrier,
          CanonicalEmbeddings.EmbeddingPreservesOrderedField
            rational_extension.rational_model.signature target.signature rational_map

structure MetricSpace where
  carrier : Type u
  distance : carrier → carrier → Prop

structure DenseIsometricEmbedding (source target : MetricSpace) where
  to_target : source.carrier → target.carrier
  preserves_distance :
    ∀ first second : source.carrier,
      source.distance first second ↔
        target.distance (to_target first) (to_target second)
  dense_image :
    ∀ target_value : target.carrier,
      ∃ approximating_source : source.carrier,
        target.distance (to_target approximating_source) target_value

structure MetricCompletionUniversalProperty (source completion : MetricSpace) where
  embedding : DenseIsometricEmbedding source completion
  complete :
    ∀ cauchy_sequence : Nat → completion.carrier,
      ∃ limit : completion.carrier,
        ∀ neighborhood : completion.carrier → Prop,
          neighborhood limit → ∃ index : Nat, neighborhood (cauchy_sequence index)
  universal_extension :
    ∀ target : MetricSpace,
      ∀ dense_map : DenseIsometricEmbedding source target,
        ∃ comparison : completion.carrier → target.carrier,
          ∀ source_value,
            comparison (embedding.to_target source_value) =
              dense_map.to_target source_value

structure CompleteOrderedFieldCharacterization (real_model : RealModel) : Prop where
  real_laws : RealLaws real_model.signature
  unique_up_to_ordered_field_isomorphism :
    ∀ other : RealModel,
      ∃ comparison : real_model.signature.carrier → other.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedField
          real_model.signature other.signature comparison

end UniversalProperties
end NumberSystems
end VolumeII
end LRA
