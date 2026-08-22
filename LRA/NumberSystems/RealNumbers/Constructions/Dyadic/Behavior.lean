-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Behavior.lean
-- Canonical-form uniqueness for binary expansions.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Laws

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

/-- Every eventually-one fractional tail has a unique equivalent terminating
canonical expansion. -/
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

/-- Canonical fractional binary expansions are unique. -/
theorem CanonicalFractionalUniqueness
    (first second : CanonicalFraction) :
    FractionalValue dyadicData first = FractionalValue dyadicData second ↔
      first = second := by
  sorry

/-!
Completeness is deliberately not represented by a standalone proposition in
this package. The construction-level statement is
`DyadicExpansionRealModelExists` in `Instances.lean`, which ties the
`RealModel` carrier to `Expansion` itself.
-/

end LRA.NumberSystems.RealNumbers.Dyadic
