
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Laws

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

/--
`BinaryTailAmbiguity` TODO

Predicate logic:

  (∀ digits ∈ FractionalDigits), (∃ threshold, ∀ index, threshold ≤ index → digits index = Digit.one) → ∃ terminating ∈ CanonicalFraction, FractionalValue dyadicData terminating = Quotient.mk _ ⟨FractionalPartialSum dyadicData digits, FractionalPartialSumsAreCauchy dyadicData digits⟩ ∧ ∀ other : CanonicalFraction, FractionalValue dyadicData other = Quotient.mk _ ⟨FractionalPartialSum dyadicData digits, FractionalPartialSumsAreCauchy dyadicData digits⟩ → other = terminating

Predicate logic (unfolded):

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (digits : LRA.NumberSystems.RealNumbers.Dyadic.FractionalDigits), (Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → digits index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.one) → Exists fun terminating => (Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1 { sequence := LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData terminating.1, sequence_is_cauchy := ⋯ } = Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1 { sequence := LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData digits, sequence_is_cauchy := ⋯ } ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dyadic.CanonicalFraction), Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1 { sequence := LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData other.1, sequence_is_cauchy := ⋯ } = Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1 { sequence := LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData digits, sequence_is_cauchy := ⋯ } → other = terminating)

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

  (∀ first second ∈ CanonicalFraction), FractionalValue dyadicData first = FractionalValue dyadicData second ↔ first = second

Predicate logic (unfolded):

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (first second : LRA.NumberSystems.RealNumbers.Dyadic.CanonicalFraction), Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1 { sequence := LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData first.1, sequence_is_cauchy := ⋯ } = Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1 { sequence := LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData second.1, sequence_is_cauchy := ⋯ } ↔ first = second

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
