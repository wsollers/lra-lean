
import LRA.NumberSystems.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings

open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

/--
`EmbeddingPreservesOrderedRing` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
        source.le first second (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

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

/--
`EmbeddingPreservesOrderedField` TODO

Predicate logic:

  structure EmbeddingPreservesOrderedField
    (source target : OrderedFieldSignature)
    (map : source.carrier → target.carrier) : Prop
    extends EmbeddingPreservesOrderedRing
      source.toOrderedRingSignature target.toOrderedRingSignature map where
  PreservesInverse :
    ∀ value,
      value ≠ source.zero →
        map (source.inv value) = target.inv (map value)

Predicate logic (unfolded):

  structure EmbeddingPreservesOrderedField
    (source target : OrderedFieldSignature)
    (map : source.carrier → target.carrier) : Prop
    extends EmbeddingPreservesOrderedRing
      source.toOrderedRingSignature target.toOrderedRingSignature map where
  PreservesInverse :
    ∀ value,
      value ≠ source.zero →
        map (source.inv value) = target.inv (map value) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure EmbeddingPreservesOrderedField
    (source target : OrderedFieldSignature)
    (map : source.carrier → target.carrier) : Prop
    extends EmbeddingPreservesOrderedRing
      source.toOrderedRingSignature target.toOrderedRingSignature map where
  PreservesInverse :
    ∀ value,
      value ≠ source.zero →
        map (source.inv value) = target.inv (map value)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
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
`AdjacentTowerEmbeddings` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
      SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

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
`CompositeIntegerToReal` TODO

Predicate logic:

  def CompositeIntegerToReal
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel}
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel) :
    SelectedIntegerModel.signature.carrier → SelectedCofinalRealExtension.RealModel.signature.carrier :=
  fun value =>
    SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal
      (SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.ToField value)

Predicate logic (unfolded):

  def CompositeIntegerToReal
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel}
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel) :
    SelectedIntegerModel.signature.carrier → SelectedCofinalRealExtension.RealModel.signature.carrier :=
  fun value =>
    SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal
      (SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.ToField value) (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

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
`CompositeIntegerToRealIsEmbedding` TODO

Predicate logic:

  EmbeddingPreservesOrderedRing SelectedIntegerModel.signature SelectedCofinalRealExtension.RealModel.signature.toOrderedRingSignature (CompositeIntegerToReal SelectedArchimedeanDenseOrderedFieldExtension SelectedCofinalRealExtension)

Predicate logic (unfolded):

  ∀ {SelectedIntegerModel : LRA.NumberSystems.Interface.ModelTheory.DiscretelyOrderedIntegralDomainModel} (SelectedArchimedeanDenseOrderedFieldExtension : LRA.NumberSystems.Interface.ModelTheory.ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel) (SelectedCofinalRealExtension : LRA.NumberSystems.Interface.ModelTheory.CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.1), LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings.AdjacentTowerEmbeddings SelectedIntegerModel SelectedArchimedeanDenseOrderedFieldExtension SelectedCofinalRealExtension → LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings.EmbeddingPreservesOrderedRing { carrier := SelectedIntegerModel.1, zero := SelectedIntegerModel.zeroInst.1, one := SelectedIntegerModel.oneInst.1, add := fun x1 x2 => instHAdd.1 x1 x2, multiply := fun x1 x2 => instHMul.1 x1 x2, neg := fun x => SelectedIntegerModel.negInst.1 x, le := fun x1 x2 => SelectedIntegerModel.leInst.1 x1 x2, StrictOrder := fun x1 x2 => SelectedIntegerModel.ltInst.1 x1 x2 } SelectedCofinalRealExtension.RealModel.signature.1 fun value => SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.1 (SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.1 value)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

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

end LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings
