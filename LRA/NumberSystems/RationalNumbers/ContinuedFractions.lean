
import LRA.Arithmetic.ContinuedFractions
import LRA.NumberSystems.RationalNumbers.Interface.Definition

namespace LRA.NumberSystems.RationalNumbers.ContinuedFractions

open LRA.Arithmetic.ContinuedFractions

universe u

/--
`EmbedIntegerCoefficient` TODO

Predicate logic:

  def EmbedIntegerCoefficient
    (rationalSystem : RationalNumberSystem.{u})
    (coefficient : rationalSystem.IntegerSystem.Model.Carrier) :
    rationalSystem.FieldModel.Carrier :=
  rationalSystem.IntegerEmbedding.ToField coefficient

Predicate logic (unfolded):

  def EmbedIntegerCoefficient
    (rationalSystem : RationalNumberSystem.{u})
    (coefficient : rationalSystem.IntegerSystem.Model.Carrier) :
    rationalSystem.FieldModel.Carrier :=
  rationalSystem.IntegerEmbedding.ToField coefficient (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def EmbedIntegerCoefficient
    (rationalSystem : RationalNumberSystem.{u})
    (coefficient : rationalSystem.IntegerSystem.Model.Carrier) :
    rationalSystem.FieldModel.Carrier :=
  rationalSystem.IntegerEmbedding.ToField coefficient
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def EmbedIntegerCoefficient
    (rationalSystem : RationalNumberSystem.{u})
    (coefficient : rationalSystem.IntegerSystem.Model.Carrier) :
    rationalSystem.FieldModel.Carrier :=
  rationalSystem.IntegerEmbedding.ToField coefficient

/--
`CoefficientsEvaluateTo` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (a : List rationalSystem.IntegerSystem.Model.Carrier) (a_1 : rationalSystem.FieldModel.Carrier), (List.brecOn.go (motive := fun x => rationalSystem.FieldModel.Carrier → Prop) a (LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo._f rationalSystem)).1 a_1

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (a : List rationalSystem.IntegerSystem.Model.1) (a_1 : rationalSystem.FieldModel.1), (List.brecOn.go (motive := fun x => rationalSystem.FieldModel.Carrier → Prop) a (LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo._f rationalSystem)).1 a_1

Logical form (Lean):

```lean
def CoefficientsEvaluateTo
    (rationalSystem : RationalNumberSystem.{u}) :
    List rationalSystem.IntegerSystem.Model.Carrier →
      rationalSystem.FieldModel.Carrier → Prop
  | [], _ => False
  | [coefficient], value =>
      value = EmbedIntegerCoefficient rationalSystem coefficient
  | coefficient :: next :: rest, value =>
      ∃ tailValue : rationalSystem.FieldModel.Carrier,
        CoefficientsEvaluateTo rationalSystem (next :: rest) tailValue ∧
          tailValue ≠ 0 ∧
          value =
            EmbedIntegerCoefficient rationalSystem coefficient + tailValue⁻¹
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def CoefficientsEvaluateTo
    (rationalSystem : RationalNumberSystem.{u}) :
    List rationalSystem.IntegerSystem.Model.Carrier →
      rationalSystem.FieldModel.Carrier → Prop
  | [], _ => False
  | [coefficient], value =>
      value = EmbedIntegerCoefficient rationalSystem coefficient
  | coefficient :: next :: rest, value =>
      ∃ tailValue : rationalSystem.FieldModel.Carrier,
        CoefficientsEvaluateTo rationalSystem (next :: rest) tailValue ∧
          tailValue ≠ 0 ∧
          value =
            EmbedIntegerCoefficient rationalSystem coefficient + tailValue⁻¹

/--
`FiniteSimpleContinuedFractionEvaluatesTo` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (fraction : LRA.Arithmetic.ContinuedFractions.FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model) (value : rationalSystem.FieldModel.Carrier), LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo rationalSystem (List.cons fraction.Head fraction.Tail) value

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (fraction : LRA.Arithmetic.ContinuedFractions.FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.1) (value : rationalSystem.FieldModel.1), LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo rationalSystem (List.cons fraction.1 fraction.2) value

Logical form (Lean):

```lean
def FiniteSimpleContinuedFractionEvaluatesTo
    (rationalSystem : RationalNumberSystem.{u})
    (fraction :
      FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (value : rationalSystem.FieldModel.Carrier) : Prop :=
  CoefficientsEvaluateTo rationalSystem
    (fraction.Head :: fraction.Tail) value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FiniteSimpleContinuedFractionEvaluatesTo
    (rationalSystem : RationalNumberSystem.{u})
    (fraction :
      FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (value : rationalSystem.FieldModel.Carrier) : Prop :=
  CoefficientsEvaluateTo rationalSystem
    (fraction.Head :: fraction.Tail) value

/--
`EveryRationalHasUniqueCanonicalFiniteSimpleContinuedFraction` TODO

Predicate logic:

  (∀ value ∈ rationalSystem.FieldModel.Carrier), ∃ fraction ∈ FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model, IsCanonicalSimpleContinuedFraction fraction ∧ FiniteSimpleContinuedFractionEvaluatesTo rationalSystem fraction value ∧ ∀ other : FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model, IsCanonicalSimpleContinuedFraction other → FiniteSimpleContinuedFractionEvaluatesTo rationalSystem other value → other = fraction

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (value : rationalSystem.FieldModel.1), Exists fun fraction => ((∀ (coefficient : rationalSystem.IntegerSystem.Model.1), List.instMembership.1 fraction.2 coefficient → rationalSystem.IntegerSystem.Model.ltInst.1 rationalSystem.IntegerSystem.Model.zeroInst.1 coefficient ∧ Or (fraction.2 = List.nil) (Exists fun initialSegment => Exists fun last => (fraction.2 = instHAppendOfAppend.1 initialSegment (List.cons last List.nil) ∧ rationalSystem.IntegerSystem.Model.ltInst.1 rationalSystem.IntegerSystem.Model.oneInst.1 last))) ∧ (LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo rationalSystem (List.cons fraction.1 fraction.2) value ∧ ∀ (other : LRA.Arithmetic.ContinuedFractions.FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.1), (∀ (coefficient : rationalSystem.IntegerSystem.Model.1), List.instMembership.1 other.2 coefficient → rationalSystem.IntegerSystem.Model.ltInst.1 rationalSystem.IntegerSystem.Model.zeroInst.1 coefficient ∧ Or (other.2 = List.nil) (Exists fun initialSegment => Exists fun last => (other.2 = instHAppendOfAppend.1 initialSegment (List.cons last List.nil) ∧ rationalSystem.IntegerSystem.Model.ltInst.1 rationalSystem.IntegerSystem.Model.oneInst.1 last))) → LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo rationalSystem (List.cons other.1 other.2) value → other = fraction))

Logical form (Lean):

```lean
theorem EveryRationalHasUniqueCanonicalFiniteSimpleContinuedFraction
    (rationalSystem : RationalNumberSystem.{u})
    (value : rationalSystem.FieldModel.Carrier) :
    ∃ fraction :
        FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
      IsCanonicalSimpleContinuedFraction fraction ∧
        FiniteSimpleContinuedFractionEvaluatesTo
          rationalSystem fraction value ∧
        ∀ other :
            FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
          IsCanonicalSimpleContinuedFraction other →
          FiniteSimpleContinuedFractionEvaluatesTo
            rationalSystem other value →
          other = fraction
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
theorem EveryRationalHasUniqueCanonicalFiniteSimpleContinuedFraction
    (rationalSystem : RationalNumberSystem.{u})
    (value : rationalSystem.FieldModel.Carrier) :
    ∃ fraction :
        FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
      IsCanonicalSimpleContinuedFraction fraction ∧
        FiniteSimpleContinuedFractionEvaluatesTo
          rationalSystem fraction value ∧
        ∀ other :
            FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
          IsCanonicalSimpleContinuedFraction other →
          FiniteSimpleContinuedFractionEvaluatesTo
            rationalSystem other value →
          other = fraction := by
  sorry

end LRA.NumberSystems.RationalNumbers.ContinuedFractions
