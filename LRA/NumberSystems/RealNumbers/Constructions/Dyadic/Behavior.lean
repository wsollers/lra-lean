
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Laws

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

/--
`BinaryTailAmbiguity` TODO

Predicate logic:

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (digits : LRA.NumberSystems.RealNumbers.Dyadic.FractionalDigits), (Exists fun threshold => ∀ (index : Nat), instLENat.le threshold index → digits index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.one) → Exists fun terminating => (LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData terminating = Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData) { sequence := LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData digits, sequence_is_cauchy := ⋯ } ∧ (∀ (other : LRA.NumberSystems.RealNumbers.Dyadic.CanonicalFraction), LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData other = Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData) { sequence := LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData digits, sequence_is_cauchy := ⋯ } → other = terminating))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    dyadicData : RationalDyadicApproximationData
    digits : FractionalDigits
  Prove
    (Exists fun threshold => ∀ (index : Nat), instLENat.le threshold index → digits index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.one) → Exists fun terminating => (Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1 { sequence := LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData terminating.1, sequence_is_cauchy := ⋯ } = Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1 { sequence := LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData digits, sequence_is_cauchy := ⋯ } ∧ (∀ (other : LRA.NumberSystems.RealNumbers.Dyadic.CanonicalFraction), Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1 { sequence := LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData other.1, sequence_is_cauchy := ⋯ } = Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1 { sequence := LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData digits, sequence_is_cauchy := ⋯ } → other = terminating))

Logical form (Lean):

```lean
theorem BinaryTailAmbiguity
    (digits : FractionalDigits)
    (eventuallyOne :
      ∃ threshold,
        ∀ index,
          threshold ≤ index → digits index = Digit.one) :
    ∃ terminating : CanonicalFraction,
      FractionalValue dyadicData terminating =
        Quotient.mk _
          ⟨FractionalPartialSum dyadicData digits,
            FractionalPartialSumsAreCauchy dyadicData digits⟩ ∧
      ∀ other : CanonicalFraction,
        FractionalValue dyadicData other =
            Quotient.mk _
              ⟨FractionalPartialSum dyadicData digits,
                FractionalPartialSumsAreCauchy dyadicData digits⟩ →
        other = terminating
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
theorem BinaryTailAmbiguity
    (digits : FractionalDigits)
    (eventuallyOne :
      ∃ threshold,
        ∀ index,
          threshold ≤ index → digits index = Digit.one) :
    ∃ terminating : CanonicalFraction,
      FractionalValue dyadicData terminating =
        Quotient.mk _
          ⟨FractionalPartialSum dyadicData digits,
            FractionalPartialSumsAreCauchy dyadicData digits⟩ ∧
      ∀ other : CanonicalFraction,
        FractionalValue dyadicData other =
            Quotient.mk _
              ⟨FractionalPartialSum dyadicData digits,
                FractionalPartialSumsAreCauchy dyadicData digits⟩ →
        other = terminating := by
  sorry
/--
`CanonicalFractionalUniqueness` TODO

Predicate logic:

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (first second : LRA.NumberSystems.RealNumbers.Dyadic.CanonicalFraction), LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData first = LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData second ↔ first = second

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    dyadicData : RationalDyadicApproximationData
    first second : CanonicalFraction
  Prove
    LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData first = LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData second ↔ first = second

Logical form (Lean):

```lean
theorem CanonicalFractionalUniqueness
    (first second : CanonicalFraction) :
    FractionalValue dyadicData first = FractionalValue dyadicData second ↔
      first = second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem CanonicalFractionalUniqueness
    (first second : CanonicalFraction) :
    FractionalValue dyadicData first = FractionalValue dyadicData second ↔
      first = second := by
  sorry
end LRA.NumberSystems.RealNumbers.Dyadic
