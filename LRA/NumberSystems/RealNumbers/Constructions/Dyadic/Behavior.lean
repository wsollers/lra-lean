-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Behavior.lean
-- Canonical-form uniqueness for binary expansions and transported field
-- behavior.

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

/-- The transported binary-expansion structure is a complete Archimedean
ordered field precisely when the selected bridge is an ordered-field
isomorphism and the source Cauchy carrier carries the advertised property. -/
def CompleteArchimedeanOrderedField : Prop :=
  OrderedFieldIsomorphism dyadicData ∧
    dyadicData.cauchy_complete_archimedean_ordered_field

/-- Binary expansions inherit the complete Archimedean ordered-field property
from the selected Cauchy carrier. -/
theorem BinaryExpansionsFormCompleteArchimedeanOrderedField :
    CompleteArchimedeanOrderedField dyadicData := by
  sorry

end LRA.NumberSystems.RealNumbers.Dyadic
