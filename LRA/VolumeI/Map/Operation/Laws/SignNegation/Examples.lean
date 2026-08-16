import LRA.VolumeI.Map.Operation.Laws.SignNegation.Theorems

namespace LRA.Map.Operation.Laws.SignNegation

open LRA.Map.Operation

/-- Integer addition for sign-negation examples. -/
def IntegerAdditionForSignExample : BinaryEndoOperation Int :=
  fun left right => left + right

/-- Integer multiplication for sign-negation examples. -/
def IntegerMultiplicationForSignExample : BinaryEndoOperation Int :=
  fun left right => left * right

/-- Integer subtraction for sign-negation examples. -/
def IntegerSubtractionForSignExample : BinaryEndoOperation Int :=
  fun left right => left - right

/-- Integer negation for sign-negation examples. -/
def IntegerNegationForSignExample : UnaryEndoOperation Int :=
  fun element => -element

/--
**[Example — IntegerSignNegationLaws]**

The usual integer operations satisfy the sign-negation law bundle.
-/
theorem IntegerSignNegationLaws :
    SignNegationLaws
      IntegerAdditionForSignExample
      IntegerMultiplicationForSignExample
      IntegerSubtractionForSignExample
      IntegerNegationForSignExample
      0
      1 := by
  sorry

end LRA.Map.Operation.Laws.SignNegation
