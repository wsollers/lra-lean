-- LRA/VolumeI/Algebra/Models/UniversalProperties.lean
-- Universal properties for Z, Q, and R.

import Mathlib.Topology.MetricSpace.Basic
import LRA.VolumeI.Algebra.Models.CanonicalEmbeddings

namespace LRA
namespace VolumeI
namespace Algebra
namespace Models
namespace UniversalProperties

universe u v w

/-!
Volume II label: universal-properties
Lean module: LRA.VolumeI.Algebra.Models.UniversalProperties
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

structure MetricSpaceModel where
  carrier : Type u
  metric : _root_.MetricSpace carrier

structure DenseIsometricEmbedding
    (source : MetricSpaceModel.{u})
    (target : MetricSpaceModel.{v}) where
  to_target : source.carrier → target.carrier
  preserves_distance :
    ∀ first second : source.carrier,
      letI := source.metric
      letI := target.metric
      dist (to_target first) (to_target second) = dist first second
  dense_image :
    ∀ target_value : target.carrier,
      ∀ ε : ℝ,
        0 < ε →
        letI := target.metric
        ∃ approximating_source : source.carrier,
          dist (to_target approximating_source) target_value < ε

structure MetricCompletionUniversalProperty
    (source : MetricSpaceModel.{u})
    (completion : MetricSpaceModel.{v}) where
  embedding : DenseIsometricEmbedding source completion
  complete :
    ∀ cauchy_sequence : Nat → completion.carrier,
      ∃ limit : completion.carrier,
        ∀ neighborhood : completion.carrier → Prop,
          neighborhood limit → ∃ index : Nat, neighborhood (cauchy_sequence index)
  universal_extension :
    ∀ target : MetricSpaceModel.{w},
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
end Models
end Algebra
end VolumeI
end LRA
