import LRA.UniversalAlgebra.Congruence.Theorems

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

/-- Natural-number addition as the running equality-compatibility example. -/
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

/-- Same parity on natural numbers, used as a non-equality congruence example. -/
def SameParityForCongruenceExample (left right : Nat) : Prop :=
  left % 2 = right % 2

/--
**[Example — SameParityAdditionCongruence]**

Same parity is a congruence for natural-number addition.
-/
theorem SameParityAdditionCongruence :
    BinaryOperationCongruence SameParityForCongruenceExample NaturalAddition := by
  sorry

end LRA.UniversalAlgebra.Congruence
