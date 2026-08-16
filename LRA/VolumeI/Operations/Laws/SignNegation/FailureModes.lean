import LRA.VolumeI.Operations.Laws.SignNegation.Definition

namespace LRA.Operation.Laws.SignNegation

open LRA.Operation

universe u

/-- Failure of the bundled sign-negation laws. -/
def FailsSignNegationLaws {Carrier : Type u}
    (addition multiplication subtraction : BinaryEndoOperation Carrier)
    (negation : UnaryEndoOperation Carrier)
    (zero one : Carrier) : Prop :=
  Not (SignNegationLaws addition multiplication subtraction negation zero one)

/-- Natural-number addition for sign-negation failures. -/
def NaturalAdditionForSignFailure : BinaryEndoOperation Nat :=
  fun left right => left + right

/-- Natural-number multiplication for sign-negation failures. -/
def NaturalMultiplicationForSignFailure : BinaryEndoOperation Nat :=
  fun left right => left * right

/-- Natural-number truncated subtraction for sign-negation failures. -/
def NaturalSubtractionForSignFailure : BinaryEndoOperation Nat :=
  fun left right => left - right

/-- The identity map as a failed negation candidate on natural numbers. -/
def NaturalIdentityNegationCandidate : UnaryEndoOperation Nat :=
  fun element => element

/--
**[Failure Mode — NaturalIdentityNegationFailsSignNegationLaws]**

The identity map on natural numbers is not a valid sign-negation operation for
the usual multiplication and truncated subtraction.
-/
theorem NaturalIdentityNegationFailsSignNegationLaws :
    FailsSignNegationLaws
      NaturalAdditionForSignFailure
      NaturalMultiplicationForSignFailure
      NaturalSubtractionForSignFailure
      NaturalIdentityNegationCandidate
      0
      1 := by
  sorry

end LRA.Operation.Laws.SignNegation
