import LRA.NumberSystems.RationalNumbers.Interface.Definition
import LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings

universe u

/--
`FractionFieldUniversalProperty` TODO

Predicate logic:

  (rationalSystem.IntegerSystem.Model.Carrier → target.Carrier) → ∃! rationalMap : rationalSystem.FieldModel.Carrier → target.Carrier, EmbeddingPreservesOrderedField rationalSystem.FieldModel.signature target.signature rationalMap ∧ ∀ integerValue : rationalSystem.IntegerSystem.Model.Carrier, rationalMap (rationalSystem.IntegerEmbedding.ToField integerValue) = integerMap integerValue

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (target : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (integerMap : rationalSystem.IntegerSystem.Model.1 → target.1), LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings.EmbeddingPreservesOrderedRing { carrier := rationalSystem.IntegerSystem.Model.1, zero := rationalSystem.IntegerSystem.Model.zeroInst.1, one := rationalSystem.IntegerSystem.Model.oneInst.1, add := fun x1 x2 => instHAdd.1 x1 x2, multiply := fun x1 x2 => instHMul.1 x1 x2, neg := fun x => rationalSystem.IntegerSystem.Model.negInst.1 x, le := fun x1 x2 => rationalSystem.IntegerSystem.Model.leInst.1 x1 x2, StrictOrder := fun x1 x2 => rationalSystem.IntegerSystem.Model.ltInst.1 x1 x2 } target.signature.1 integerMap → Exists fun x => ((fun rationalMap => (LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings.EmbeddingPreservesOrderedField { carrier := rationalSystem.FieldModel.1, zero := rationalSystem.FieldModel.zeroInst.1, one := rationalSystem.FieldModel.oneInst.1, add := fun x1 x2 => instHAdd.1 x1 x2, multiply := fun x1 x2 => instHMul.1 x1 x2, neg := fun x => rationalSystem.FieldModel.negInst.1 x, le := fun x1 x2 => rationalSystem.FieldModel.leInst.1 x1 x2, StrictOrder := fun x1 x2 => rationalSystem.FieldModel.ltInst.1 x1 x2, inv := fun x => rationalSystem.FieldModel.invInst.1 x } { carrier := target.1, zero := target.zeroInst.1, one := target.oneInst.1, add := fun x1 x2 => instHAdd.1 x1 x2, multiply := fun x1 x2 => instHMul.1 x1 x2, neg := fun x => target.negInst.1 x, le := fun x1 x2 => target.leInst.1 x1 x2, StrictOrder := fun x1 x2 => target.ltInst.1 x1 x2, inv := fun x => target.invInst.1 x } rationalMap ∧ ∀ (integerValue : rationalSystem.IntegerSystem.Model.1), rationalMap (rationalSystem.IntegerEmbedding.1 integerValue) = integerMap integerValue)) x ∧ ∀ (y : rationalSystem.FieldModel.1 → target.1), (LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings.EmbeddingPreservesOrderedField { carrier := rationalSystem.FieldModel.1, zero := rationalSystem.FieldModel.zeroInst.1, one := rationalSystem.FieldModel.oneInst.1, add := fun x1 x2 => instHAdd.1 x1 x2, multiply := fun x1 x2 => instHMul.1 x1 x2, neg := fun x => rationalSystem.FieldModel.negInst.1 x, le := fun x1 x2 => rationalSystem.FieldModel.leInst.1 x1 x2, StrictOrder := fun x1 x2 => rationalSystem.FieldModel.ltInst.1 x1 x2, inv := fun x => rationalSystem.FieldModel.invInst.1 x } { carrier := target.1, zero := target.zeroInst.1, one := target.oneInst.1, add := fun x1 x2 => instHAdd.1 x1 x2, multiply := fun x1 x2 => instHMul.1 x1 x2, neg := fun x => target.negInst.1 x, le := fun x1 x2 => target.leInst.1 x1 x2, StrictOrder := fun x1 x2 => target.ltInst.1 x1 x2, inv := fun x => target.invInst.1 x } y ∧ ∀ (integerValue : rationalSystem.IntegerSystem.Model.1), y (rationalSystem.IntegerEmbedding.1 integerValue) = integerMap integerValue) → y = x)

Logical form (Lean):

```lean
theorem FractionFieldUniversalProperty
    (rationalSystem : RationalNumberSystem.{u})
    (target : DenselyOrderedFieldModel.{u})
    (integerMap : rationalSystem.IntegerSystem.Model.Carrier → target.Carrier)
    (integerMapIsEmbedding :
      EmbeddingPreservesOrderedRing
        rationalSystem.IntegerSystem.Model.signature
        target.signature.toOrderedRingSignature
        integerMap) :
    ∃! rationalMap : rationalSystem.FieldModel.Carrier → target.Carrier,
      EmbeddingPreservesOrderedField
          rationalSystem.FieldModel.signature target.signature rationalMap ∧
        ∀ integerValue : rationalSystem.IntegerSystem.Model.Carrier,
          rationalMap
              (rationalSystem.IntegerEmbedding.ToField integerValue) =
            integerMap integerValue
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem FractionFieldUniversalProperty
    (rationalSystem : RationalNumberSystem.{u})
    (target : DenselyOrderedFieldModel.{u})
    (integerMap : rationalSystem.IntegerSystem.Model.Carrier → target.Carrier)
    (integerMapIsEmbedding :
      EmbeddingPreservesOrderedRing
        rationalSystem.IntegerSystem.Model.signature
        target.signature.toOrderedRingSignature
        integerMap) :
    ∃! rationalMap : rationalSystem.FieldModel.Carrier → target.Carrier,
      EmbeddingPreservesOrderedField
          rationalSystem.FieldModel.signature target.signature rationalMap ∧
        ∀ integerValue : rationalSystem.IntegerSystem.Model.Carrier,
          rationalMap
              (rationalSystem.IntegerEmbedding.ToField integerValue) =
            integerMap integerValue := by
  sorry

end LRA.NumberSystems.RationalNumbers
