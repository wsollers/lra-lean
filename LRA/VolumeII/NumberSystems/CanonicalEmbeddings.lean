-- LRA/VolumeII/NumberSystems/CanonicalEmbeddings.lean
-- Canonical embeddings across the constructed number-system tower.

import LRA.VolumeII.NumberSystems.Models

namespace LRA
namespace VolumeII
namespace NumberSystems
namespace CanonicalEmbeddings

/-!
Volume II label: canonical-embeddings
Lean module: LRA.VolumeII.NumberSystems.CanonicalEmbeddings
Source: docs/number-systems/gpt-00b-canonical-embeddings.md
Verification status: statement-accepted-proof-pending
-/

structure EmbeddingPreservesOrderedRing
    (source target : OrderedRingSignature)
    (map : source.carrier → target.carrier) : Prop where
  injective : ∀ first second, map first = map second → first = second
  preserves_zero : map source.zero = target.zero
  preserves_one : map source.one = target.one
  preserves_addition :
    ∀ first second,
      map (source.addition first second) =
        target.addition (map first) (map second)
  preserves_negation :
    ∀ value, map (source.negation value) = target.negation (map value)
  preserves_multiplication :
    ∀ first second,
      map (source.multiplication first second) =
        target.multiplication (map first) (map second)
  preserves_and_reflects_order :
    ∀ first second,
      target.nonstrict_order (map first) (map second) ↔
        source.nonstrict_order first second

structure EmbeddingPreservesOrderedField
    (source target : OrderedFieldSignature)
    (map : source.carrier → target.carrier) : Prop
    extends EmbeddingPreservesOrderedRing
      source.toOrderedRingSignature target.toOrderedRingSignature map where
  preserves_inverse :
    ∀ value,
      value ≠ source.zero →
        map (source.inverse value) = target.inverse (map value)

structure AdjacentTowerEmbeddings
    (integer_model : IntegerModel)
    (rational_extension : RationalExtension integer_model)
    (real_extension : RealExtension rational_extension.rational_model) : Prop where
  integer_to_rational_preserves :
    EmbeddingPreservesOrderedRing
      integer_model.signature
      rational_extension.rational_model.signature.toOrderedRingSignature
      rational_extension.integer_embedding.to_rational
  rational_to_real_preserves :
    EmbeddingPreservesOrderedField
      rational_extension.rational_model.signature
      real_extension.real_model.signature
      real_extension.rational_embedding.to_real

def composite_integer_to_real
    {integer_model : IntegerModel}
    (rational_extension : RationalExtension integer_model)
    (real_extension : RealExtension rational_extension.rational_model) :
    integer_model.signature.carrier → real_extension.real_model.signature.carrier :=
  fun value =>
    real_extension.rational_embedding.to_real
      (rational_extension.integer_embedding.to_rational value)

theorem composite_integer_to_real_is_embedding
    {integer_model : IntegerModel}
    (rational_extension : RationalExtension integer_model)
    (real_extension : RealExtension rational_extension.rational_model)
    (adjacent_embeddings :
      AdjacentTowerEmbeddings integer_model rational_extension real_extension) :
    EmbeddingPreservesOrderedRing
      integer_model.signature
      real_extension.real_model.signature.toOrderedRingSignature
      (composite_integer_to_real rational_extension real_extension) := by
  sorry

end CanonicalEmbeddings
end NumberSystems
end VolumeII
end LRA
