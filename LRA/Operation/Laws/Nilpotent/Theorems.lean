import LRA.Operation.Laws.Nilpotent.Definition

namespace LRA.Operation.Laws.Nilpotent

open LRA.Operation

universe u

theorem NilpotentElement.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {zero element : Carrier}
    (law : NilpotentElement operation zero element) :
    ∃ positiveExponent : Nat,
      PositivePower operation element positiveExponent = zero := by
  sorry

theorem PositivePower.first {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier) :
    PositivePower operation element 0 = element := by
  sorry

theorem PositivePower.succ {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier)
    (exponent : Nat) :
    PositivePower operation element (Nat.succ exponent) =
      operation (PositivePower operation element exponent) element := by
  sorry

theorem OperationPower.one {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier) :
    OperationPower operation identity element 1 = operation identity element := by
  sorry

theorem OperationPower.succ {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier)
    (exponent : Nat) :
    OperationPower operation identity element (Nat.succ exponent) =
      operation (OperationPower operation identity element exponent) element := by
  sorry

end LRA.Operation.Laws.Nilpotent
