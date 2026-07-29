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
    (integer_model : IntegerModel)
    (rational_extension : RationalExtension integer_model)
    (real_extension : RealExtension rational_extension.RationalModel) : Prop where
  IntegerToRationalPreserves :
    EmbeddingPreservesOrderedRing
      integer_model.signature
      rational_extension.RationalModel.signature.toOrderedRingSignature
      rational_extension.IntegerEmbedding.ToRational
  RationalToRealPreserves :
    EmbeddingPreservesOrderedField
      rational_extension.RationalModel.signature
      real_extension.RealModel.signature
      real_extension.RationalEmbedding.ToReal

def CompositeIntegerToReal
    {integer_model : IntegerModel}
    (rational_extension : RationalExtension integer_model)
    (real_extension : RealExtension rational_extension.RationalModel) :
    integer_model.signature.carrier → real_extension.RealModel.signature.carrier :=
  fun value =>
    real_extension.RationalEmbedding.ToReal
      (rational_extension.IntegerEmbedding.ToRational value)

theorem CompositeIntegerToRealIsEmbedding
    {integer_model : IntegerModel}
    (rational_extension : RationalExtension integer_model)
    (real_extension : RealExtension rational_extension.RationalModel)
    (adjacent_embeddings :
      AdjacentTowerEmbeddings integer_model rational_extension real_extension) :
    EmbeddingPreservesOrderedRing
      integer_model.signature
      real_extension.RealModel.signature.toOrderedRingSignature
      (CompositeIntegerToReal rational_extension real_extension) := by
  sorry

end LRA.VolumeI.Algebra.Models.CanonicalEmbeddings
