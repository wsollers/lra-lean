
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Carrier

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadic_data : RationalDyadicApproximationData)

/--
`dyadic_subring` TODO

Predicate logic:

  IsDyadicRational dyadic_data dyadic_data.RationalSystem.FieldModel.signature.zero ∧ IsDyadicRational dyadic_data dyadic_data.RationalSystem.FieldModel.signature.one ∧ ∀ first second ∈ Rational dyadic_data, IsDyadicRational dyadic_data first → IsDyadicRational dyadic_data second → IsDyadicRational dyadic_data (dyadic_data.RationalSystem.FieldModel.signature.add first second) ∧ ∀ value ∈ Rational dyadic_data, IsDyadicRational dyadic_data value → IsDyadicRational dyadic_data (dyadic_data.RationalSystem.FieldModel.signature.neg value) ∧ ∀ first second ∈ Rational dyadic_data, IsDyadicRational dyadic_data first → IsDyadicRational dyadic_data second → IsDyadicRational dyadic_data (dyadic_data.RationalSystem.FieldModel.signature.multiply first second)

Predicate logic (unfolded):

  ∀ (dyadic_data : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData), (Exists fun numerator => Exists fun exponent => dyadic_data.RationalSystem.FieldModel.signature.toZeroOneBundle.2 = instHMul.1 (dyadic_data.RationalSystem.IntegerEmbedding.1 numerator) (dyadic_data.RationalSystem.FieldModel.invInst.1 (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadic_data.1 exponent)) ∧ (Exists fun numerator => Exists fun exponent => dyadic_data.RationalSystem.FieldModel.signature.toZeroOneBundle.3 = instHMul.1 (dyadic_data.RationalSystem.IntegerEmbedding.1 numerator) (dyadic_data.RationalSystem.FieldModel.invInst.1 (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadic_data.1 exponent)) ∧ (∀ (first second : dyadic_data.RationalSystem.FieldModel.1), (Exists fun numerator => Exists fun exponent => first = instHMul.1 (dyadic_data.RationalSystem.IntegerEmbedding.1 numerator) (dyadic_data.RationalSystem.FieldModel.invInst.1 (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadic_data.1 exponent))) → (Exists fun numerator => Exists fun exponent => second = instHMul.1 (dyadic_data.RationalSystem.IntegerEmbedding.1 numerator) (dyadic_data.RationalSystem.FieldModel.invInst.1 (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadic_data.1 exponent))) → Exists fun numerator => Exists fun exponent => dyadic_data.RationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 first second = instHMul.1 (dyadic_data.RationalSystem.IntegerEmbedding.1 numerator) (dyadic_data.RationalSystem.FieldModel.invInst.1 (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadic_data.1 exponent)) ∧ (∀ (value : dyadic_data.RationalSystem.FieldModel.1), (Exists fun numerator => Exists fun exponent => value = instHMul.1 (dyadic_data.RationalSystem.IntegerEmbedding.1 numerator) (dyadic_data.RationalSystem.FieldModel.invInst.1 (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadic_data.1 exponent))) → Exists fun numerator => Exists fun exponent => dyadic_data.RationalSystem.FieldModel.signature.toRingConceptSignature.2 value = instHMul.1 (dyadic_data.RationalSystem.IntegerEmbedding.1 numerator) (dyadic_data.RationalSystem.FieldModel.invInst.1 (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadic_data.1 exponent)) ∧ ∀ (first second : dyadic_data.RationalSystem.FieldModel.1), (Exists fun numerator => Exists fun exponent => first = instHMul.1 (dyadic_data.RationalSystem.IntegerEmbedding.1 numerator) (dyadic_data.RationalSystem.FieldModel.invInst.1 (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadic_data.1 exponent))) → (Exists fun numerator => Exists fun exponent => second = instHMul.1 (dyadic_data.RationalSystem.IntegerEmbedding.1 numerator) (dyadic_data.RationalSystem.FieldModel.invInst.1 (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadic_data.1 exponent))) → Exists fun numerator => Exists fun exponent => dyadic_data.RationalSystem.FieldModel.signature.toBooleanRingOperationBundle.3 first second = instHMul.1 (dyadic_data.RationalSystem.IntegerEmbedding.1 numerator) (dyadic_data.RationalSystem.FieldModel.invInst.1 (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadic_data.1 exponent))))))

Logical form (Lean):

```lean
theorem dyadic_subring :
    IsDyadicRational dyadic_data dyadic_data.RationalSystem.FieldModel.signature.zero ∧
    IsDyadicRational dyadic_data dyadic_data.RationalSystem.FieldModel.signature.one ∧
    (∀ first second : Rational dyadic_data,
      IsDyadicRational dyadic_data first →
      IsDyadicRational dyadic_data second →
      IsDyadicRational dyadic_data
        (dyadic_data.RationalSystem.FieldModel.signature.add first second)) ∧
    (∀ value : Rational dyadic_data,
      IsDyadicRational dyadic_data value →
      IsDyadicRational dyadic_data
        (dyadic_data.RationalSystem.FieldModel.signature.neg value)) ∧
    (∀ first second : Rational dyadic_data,
      IsDyadicRational dyadic_data first →
      IsDyadicRational dyadic_data second →
      IsDyadicRational dyadic_data
        (dyadic_data.RationalSystem.FieldModel.signature.multiply first second))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem dyadic_subring :
    IsDyadicRational dyadic_data dyadic_data.RationalSystem.FieldModel.signature.zero ∧
    IsDyadicRational dyadic_data dyadic_data.RationalSystem.FieldModel.signature.one ∧
    (∀ first second : Rational dyadic_data,
      IsDyadicRational dyadic_data first →
      IsDyadicRational dyadic_data second →
      IsDyadicRational dyadic_data
        (dyadic_data.RationalSystem.FieldModel.signature.add first second)) ∧
    (∀ value : Rational dyadic_data,
      IsDyadicRational dyadic_data value →
      IsDyadicRational dyadic_data
        (dyadic_data.RationalSystem.FieldModel.signature.neg value)) ∧
    (∀ first second : Rational dyadic_data,
      IsDyadicRational dyadic_data first →
      IsDyadicRational dyadic_data second →
      IsDyadicRational dyadic_data
        (dyadic_data.RationalSystem.FieldModel.signature.multiply first second)) := by
  sorry
/--
`dyadic_rationals_are_dense` TODO

Predicate logic:

  ∃ dyadic ∈ Rational dyadic_data, IsDyadicRational dyadic_data dyadic ∧ dyadic_data.RationalSystem.FieldModel.signature.StrictOrder first dyadic ∧ dyadic_data.RationalSystem.FieldModel.signature.StrictOrder dyadic second

Predicate logic (unfolded):

  ∀ (dyadic_data : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (first second : dyadic_data.RationalSystem.FieldModel.1), dyadic_data.RationalSystem.FieldModel.signature.toOrderedRingSignature.2 first second → Exists fun dyadic => (Exists fun numerator => Exists fun exponent => dyadic = instHMul.1 (dyadic_data.RationalSystem.IntegerEmbedding.1 numerator) (dyadic_data.RationalSystem.FieldModel.invInst.1 (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadic_data.1 exponent)) ∧ (dyadic_data.RationalSystem.FieldModel.signature.toOrderedRingSignature.2 first dyadic ∧ dyadic_data.RationalSystem.FieldModel.signature.toOrderedRingSignature.2 dyadic second))

Logical form (Lean):

```lean
theorem dyadic_rationals_are_dense
    (first second : Rational dyadic_data)
    (first_lt_second :
      dyadic_data.RationalSystem.FieldModel.signature.StrictOrder first second) :
    ∃ dyadic : Rational dyadic_data,
      IsDyadicRational dyadic_data dyadic ∧
      dyadic_data.RationalSystem.FieldModel.signature.StrictOrder first dyadic ∧
      dyadic_data.RationalSystem.FieldModel.signature.StrictOrder dyadic second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem dyadic_rationals_are_dense
    (first second : Rational dyadic_data)
    (first_lt_second :
      dyadic_data.RationalSystem.FieldModel.signature.StrictOrder first second) :
    ∃ dyadic : Rational dyadic_data,
      IsDyadicRational dyadic_data dyadic ∧
      dyadic_data.RationalSystem.FieldModel.signature.StrictOrder first dyadic ∧
      dyadic_data.RationalSystem.FieldModel.signature.StrictOrder dyadic second := by
  sorry
end LRA.NumberSystems.RealNumbers.Dyadic
