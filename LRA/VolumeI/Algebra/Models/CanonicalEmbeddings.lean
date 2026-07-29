-- LRA/VolumeI/Algebra/Models/CanonicalEmbeddings.lean
-- Canonical embeddings across the constructed number-system tower.

import LRA.VolumeI.Algebra.Models.Models

namespace LRA.VolumeI.Algebra.Models.CanonicalEmbeddings

/-!
Volume II label: canonical-embeddings
Lean module: LRA.VolumeI.Algebra.Models.CanonicalEmbeddings
Source: docs/number-systems/gpt-00b-canonical-embeddings.md
Verification status: statement-accepted-proof-pending
-/

structure EmbeddingPreservesOrderedRing
    (source target : OrderedRingSignature)
    (map : source.carrier → target.carrier) : Prop where
  injective : ∀ first second, map first = map second → first = second
  PreservesZero : map source.zero = target.zero
  PreservesOne : map source.one = target.one
  PreservesAddition :
    ∀ first second,
      map (source.addition first second) =
        target.addition (map first) (map second)
  PreservesNegation :
    ∀ value, map (source.negation value) = target.negation (map value)
  PreservesMultiplication :
    ∀ first second,
      map (source.multiplication first second) =
        target.multiplication (map first) (map second)
  PreservesAndReflectsOrder :
    ∀ first second,
      target.NonstrictOrder (map first) (map second) ↔
        source.NonstrictOrder first second

structure EmbeddingPreservesOrderedField
    (source target : OrderedFieldSignature)
    (map : source.carrier → target.carrier) : Prop
    extends EmbeddingPreservesOrderedRing
      source.toOrderedRingSignature target.toOrderedRingSignature map where
  PreservesInverse :
    ∀ value,
      value ≠ source.zero →
        map (source.inverse value) = target.inverse (map value)

structure AdjacentTowerEmbeddings
    (SelectedIntegerModel : IntegerModel)
    (SelectedRationalExtension : RationalExtension SelectedIntegerModel)
    (SelectedRealExtension : RealExtension SelectedRationalExtension.RationalModel) : Prop where
  IntegerToRationalPreserves :
    EmbeddingPreservesOrderedRing
      SelectedIntegerModel.signature
      SelectedRationalExtension.RationalModel.signature.toOrderedRingSignature
      SelectedRationalExtension.IntegerEmbedding.ToRational
  RationalToRealPreserves :
    EmbeddingPreservesOrderedField
      SelectedRationalExtension.RationalModel.signature
      SelectedRealExtension.RealModel.signature
      SelectedRealExtension.RationalEmbedding.ToReal

def CompositeIntegerToReal
    {SelectedIntegerModel : IntegerModel}
    (SelectedRationalExtension : RationalExtension SelectedIntegerModel)
    (SelectedRealExtension : RealExtension SelectedRationalExtension.RationalModel) :
    SelectedIntegerModel.signature.carrier → SelectedRealExtension.RealModel.signature.carrier :=
  fun value =>
    SelectedRealExtension.RationalEmbedding.ToReal
      (SelectedRationalExtension.IntegerEmbedding.ToRational value)

theorem CompositeIntegerToRealIsEmbedding
    {SelectedIntegerModel : IntegerModel}
    (SelectedRationalExtension : RationalExtension SelectedIntegerModel)
    (SelectedRealExtension : RealExtension SelectedRationalExtension.RationalModel)
    (AdjacentEmbeddings :
      AdjacentTowerEmbeddings SelectedIntegerModel SelectedRationalExtension SelectedRealExtension) :
    EmbeddingPreservesOrderedRing
      SelectedIntegerModel.signature
      SelectedRealExtension.RealModel.signature.toOrderedRingSignature
      (CompositeIntegerToReal SelectedRationalExtension SelectedRealExtension) := by
  sorry

end LRA.VolumeI.Algebra.Models.CanonicalEmbeddings
