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
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel) : Prop where
  IntegerToFieldPreserves :
    EmbeddingPreservesOrderedRing
      SelectedIntegerModel.signature
      SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel.signature.toOrderedRingSignature
      SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.ToField
  RationalToRealPreserves :
    EmbeddingPreservesOrderedField
      SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel.signature
      SelectedCofinalRealExtension.RealModel.signature
      SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal
```
-/

structure AdjacentTowerEmbeddings
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel) : Prop where
  IntegerToFieldPreserves :
    EmbeddingPreservesOrderedRing
      SelectedIntegerModel.signature
      SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel.signature.toOrderedRingSignature
      SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.ToField
  RationalToRealPreserves :
    EmbeddingPreservesOrderedField
      SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel.signature
      SelectedCofinalRealExtension.RealModel.signature
      SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal
/--
`CompositeIntegerToReal` exposes this formal declaration.

Logical form:

```lean
def CompositeIntegerToReal
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel}
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel) :
    SelectedIntegerModel.signature.carrier → SelectedCofinalRealExtension.RealModel.signature.carrier :=
  fun value =>
    SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal
      (SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.ToField value)
```
-/

def CompositeIntegerToReal
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel}
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel) :
    SelectedIntegerModel.signature.carrier → SelectedCofinalRealExtension.RealModel.signature.carrier :=
  fun value =>
    SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal
      (SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.ToField value)
/--
`CompositeIntegerToRealIsEmbedding` exposes this formal declaration.

Logical form:

```lean
theorem CompositeIntegerToRealIsEmbedding
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel}
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel)
    (AdjacentEmbeddings :
      AdjacentTowerEmbeddings SelectedIntegerModel SelectedArchimedeanDenseOrderedFieldExtension SelectedCofinalRealExtension) :
    EmbeddingPreservesOrderedRing
      SelectedIntegerModel.signature
      SelectedCofinalRealExtension.RealModel.signature.toOrderedRingSignature
      (CompositeIntegerToReal SelectedArchimedeanDenseOrderedFieldExtension SelectedCofinalRealExtension)
```
-/

theorem CompositeIntegerToRealIsEmbedding
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel}
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel)
    (AdjacentEmbeddings :
      AdjacentTowerEmbeddings SelectedIntegerModel SelectedArchimedeanDenseOrderedFieldExtension SelectedCofinalRealExtension) :
    EmbeddingPreservesOrderedRing
      SelectedIntegerModel.signature
      SelectedCofinalRealExtension.RealModel.signature.toOrderedRingSignature
      (CompositeIntegerToReal SelectedArchimedeanDenseOrderedFieldExtension SelectedCofinalRealExtension) := by
  sorry

end LRA.NumberSystems.Models.CanonicalEmbeddings
