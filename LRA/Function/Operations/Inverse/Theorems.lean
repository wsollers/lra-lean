import LRA.Function.Operations.Inverse.Definition

namespace LRA.Function

universe u v

/-- A bijective function has a two-sided inverse.

Stated as existence rather than as a construction: building the inverse arrow
would require a choice principle, and no evaluation in this subject is routed
through `Classical.choose`. -/
theorem BijectiveHasTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (bijective : Bijective function) :
    ∃ inverse : LRA.Function Codomain Domain,
      TwoSidedInverse function inverse := by
  sorry

/-- A function with a two-sided inverse is bijective. -/
theorem TwoSidedInverseGivesBijective
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (twoSided : TwoSidedInverse function inverse) :
    Bijective function := by
  sorry

/-- A two-sided inverse is unique. -/
theorem TwoSidedInverseUnique
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (first second : LRA.Function Codomain Domain)
    (firstIsInverse : TwoSidedInverse function first)
    (secondIsInverse : TwoSidedInverse function second) :
    ∀ output, first output = second output := by
  sorry

end LRA.Function
