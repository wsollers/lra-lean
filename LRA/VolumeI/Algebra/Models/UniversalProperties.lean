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
    ∀ TargetValue : target.carrier,
      ∀ ε : ℝ,
        0 < ε →
        letI := target.metric
        ∃ ApproximatingSource : source.carrier,
          dist (ToTarget ApproximatingSource) TargetValue < ε

structure MetricCompletionUniversalProperty
    (source : MetricSpaceModel.{u})
    (completion : MetricSpaceModel.{v}) where
  embedding : DenseIsometricEmbedding source completion
  complete :
    ∀ CauchySequence : Nat → completion.carrier,
      ∃ limit : completion.carrier,
        ∀ neighborhood : completion.carrier → Prop,
          neighborhood limit → ∃ index : Nat, neighborhood (CauchySequence index)
  UniversalExtension :
    ∀ target : MetricSpaceModel.{w},
      ∀ DenseMap : DenseIsometricEmbedding source target,
        ∃ comparison : completion.carrier → target.carrier,
          ∀ SourceValue,
            comparison (embedding.ToTarget SourceValue) =
              DenseMap.ToTarget SourceValue

structure CompleteOrderedFieldCharacterization (SelectedRealModel : RealModel) : Prop where
  RealLaws : RealLaws SelectedRealModel.signature
  UniqueUpToOrderedFieldIsomorphism :
    ∀ other : RealModel,
      ∃ comparison : SelectedRealModel.signature.carrier → other.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedField
          SelectedRealModel.signature other.signature comparison

end LRA.VolumeI.Algebra.Models.UniversalProperties
