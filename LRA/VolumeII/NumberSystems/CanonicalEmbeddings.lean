-- LRA/VolumeII/NumberSystems/CanonicalEmbeddings.lean
-- Canonical embeddings across the constructed number-system tower.

import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.Models.CanonicalEmbeddings

open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

/-!
Volume II label: canonical-embeddings
Lean module: LRA.NumberSystems.Models.CanonicalEmbeddings
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
      map (source.add first second) =
        target.add (map first) (map second)
  PreservesNegation :
    ∀ value, map (source.neg value) = target.neg (map value)
  PreservesMultiplication :
    ∀ first second,
      map (source.multiply first second) =
        target.multiply (map first) (map second)
  PreservesAndReflectsOrder :
    ∀ first second,
      target.le (map first) (map second) ↔
        source.le first second
structure EmbeddingPreservesOrderedField
    (source target : OrderedFieldSignature)
    (map : source.carrier → target.carrier) : Prop
    extends EmbeddingPreservesOrderedRing
      source.toOrderedRingSignature target.toOrderedRingSignature map where
  PreservesInverse :
    ∀ value,
      value ≠ source.zero →
        map (source.inv value) = target.inv (map value)
/--
`AdjacentTowerEmbeddings` exposes this formal declaration.

Logical form:

```lean
structure AdjacentTowerEmbeddings
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedRationalExtension : RationalExtension SelectedIntegerModel)
    (SelectedRealExtension : RealExtension SelectedRationalExtension.DenselyOrderedFieldModel) : Prop where
  IntegerToRationalPreserves :
    EmbeddingPreservesOrderedRing
      SelectedIntegerModel.signature
      SelectedRationalExtension.DenselyOrderedFieldModel.signature.toOrderedRingSignature
      SelectedRationalExtension.IntegerEmbedding.ToRational
  RationalToRealPreserves :
    EmbeddingPreservesOrderedField
      SelectedRationalExtension.DenselyOrderedFieldModel.signature
      SelectedRealExtension.RealModel.signature
      SelectedRealExtension.RationalEmbedding.ToReal
```
-/

structure AdjacentTowerEmbeddings
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedRationalExtension : RationalExtension SelectedIntegerModel)
    (SelectedRealExtension : RealExtension SelectedRationalExtension.DenselyOrderedFieldModel) : Prop where
  IntegerToRationalPreserves :
    EmbeddingPreservesOrderedRing
      SelectedIntegerModel.signature
      SelectedRationalExtension.DenselyOrderedFieldModel.signature.toOrderedRingSignature
      SelectedRationalExtension.IntegerEmbedding.ToRational
  RationalToRealPreserves :
    EmbeddingPreservesOrderedField
      SelectedRationalExtension.DenselyOrderedFieldModel.signature
      SelectedRealExtension.RealModel.signature
      SelectedRealExtension.RationalEmbedding.ToReal
/--
`CompositeIntegerToReal` exposes this formal declaration.

Logical form:

```lean
def CompositeIntegerToReal
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel}
    (SelectedRationalExtension : RationalExtension SelectedIntegerModel)
    (SelectedRealExtension : RealExtension SelectedRationalExtension.DenselyOrderedFieldModel) :
    SelectedIntegerModel.signature.carrier → SelectedRealExtension.RealModel.signature.carrier :=
  fun value =>
    SelectedRealExtension.RationalEmbedding.ToReal
      (SelectedRationalExtension.IntegerEmbedding.ToRational value)
```
-/

def CompositeIntegerToReal
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel}
    (SelectedRationalExtension : RationalExtension SelectedIntegerModel)
    (SelectedRealExtension : RealExtension SelectedRationalExtension.DenselyOrderedFieldModel) :
    SelectedIntegerModel.signature.carrier → SelectedRealExtension.RealModel.signature.carrier :=
  fun value =>
    SelectedRealExtension.RationalEmbedding.ToReal
      (SelectedRationalExtension.IntegerEmbedding.ToRational value)
/--
`CompositeIntegerToRealIsEmbedding` exposes this formal declaration.

Logical form:

```lean
theorem CompositeIntegerToRealIsEmbedding
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel}
    (SelectedRationalExtension : RationalExtension SelectedIntegerModel)
    (SelectedRealExtension : RealExtension SelectedRationalExtension.DenselyOrderedFieldModel)
    (AdjacentEmbeddings :
      AdjacentTowerEmbeddings SelectedIntegerModel SelectedRationalExtension SelectedRealExtension) :
    EmbeddingPreservesOrderedRing
      SelectedIntegerModel.signature
      SelectedRealExtension.RealModel.signature.toOrderedRingSignature
      (CompositeIntegerToReal SelectedRationalExtension SelectedRealExtension)
```
-/

theorem CompositeIntegerToRealIsEmbedding
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel}
    (SelectedRationalExtension : RationalExtension SelectedIntegerModel)
    (SelectedRealExtension : RealExtension SelectedRationalExtension.DenselyOrderedFieldModel)
    (AdjacentEmbeddings :
      AdjacentTowerEmbeddings SelectedIntegerModel SelectedRationalExtension SelectedRealExtension) :
    EmbeddingPreservesOrderedRing
      SelectedIntegerModel.signature
      SelectedRealExtension.RealModel.signature.toOrderedRingSignature
      (CompositeIntegerToReal SelectedRationalExtension SelectedRealExtension) := by
  sorry

end LRA.NumberSystems.Models.CanonicalEmbeddings
