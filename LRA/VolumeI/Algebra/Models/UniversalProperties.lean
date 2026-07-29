-- LRA/VolumeI/Algebra/Models/UniversalProperties.lean
-- Universal properties for Z, Q, and R.

import Mathlib.Topology.MetricSpace.Basic
import LRA.VolumeI.Algebra.Models.CanonicalEmbeddings

namespace LRA.VolumeI.Algebra.Models.UniversalProperties

universe u v w

/-!
Volume II label: universal-properties
Lean module: LRA.VolumeI.Algebra.Models.UniversalProperties
Source: docs/number-systems/gpt-00c-universal-properties.md
Verification status: statement-accepted-proof-pending
-/

structure IntegerUniversalProperty (integer_model : IntegerModel) : Prop where
  InitialForDiscreteOrderedRings :
    ∀ target : IntegerModel,
      ∃ map : integer_model.signature.carrier → target.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedRing
          integer_model.signature target.signature map

structure RationalUniversalProperty
    (integer_model : IntegerModel)
    (rational_extension : RationalExtension integer_model) : Prop where
  FractionFieldProperty :
    ∀ target : RationalModel,
      ∀ integer_map :
        integer_model.signature.carrier → target.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedRing
          integer_model.signature target.signature.toOrderedRingSignature integer_map →
        ∃ rational_map :
          rational_extension.RationalModel.signature.carrier → target.signature.carrier,
          CanonicalEmbeddings.EmbeddingPreservesOrderedField
            rational_extension.RationalModel.signature target.signature rational_map

structure MetricSpaceModel where
  carrier : Type u
  metric : _root_.MetricSpace carrier

structure DenseIsometricEmbedding
    (source : MetricSpaceModel.{u})
    (target : MetricSpaceModel.{v}) where
  ToTarget : source.carrier → target.carrier
  PreservesDistance :
    ∀ first second : source.carrier,
      letI := source.metric
      letI := target.metric
      dist (ToTarget first) (ToTarget second) = dist first second
  DenseImage :
    ∀ target_value : target.carrier,
      ∀ ε : ℝ,
        0 < ε →
        letI := target.metric
        ∃ approximating_source : source.carrier,
          dist (ToTarget approximating_source) target_value < ε

structure MetricCompletionUniversalProperty
    (source : MetricSpaceModel.{u})
    (completion : MetricSpaceModel.{v}) where
  embedding : DenseIsometricEmbedding source completion
  complete :
    ∀ cauchy_sequence : Nat → completion.carrier,
      ∃ limit : completion.carrier,
        ∀ neighborhood : completion.carrier → Prop,
          neighborhood limit → ∃ index : Nat, neighborhood (cauchy_sequence index)
  UniversalExtension :
    ∀ target : MetricSpaceModel.{w},
      ∀ dense_map : DenseIsometricEmbedding source target,
        ∃ comparison : completion.carrier → target.carrier,
          ∀ source_value,
            comparison (embedding.ToTarget source_value) =
              dense_map.ToTarget source_value

structure CompleteOrderedFieldCharacterization (real_model : RealModel) : Prop where
  RealLaws : RealLaws real_model.signature
  UniqueUpToOrderedFieldIsomorphism :
    ∀ other : RealModel,
      ∃ comparison : real_model.signature.carrier → other.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedField
          real_model.signature other.signature comparison

end LRA.VolumeI.Algebra.Models.UniversalProperties
