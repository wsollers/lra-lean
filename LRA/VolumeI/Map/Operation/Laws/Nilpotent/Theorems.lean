import LRA.VolumeI.Map.Operation.Laws.Nilpotent.Definition

namespace LRA.Map.Operation.Laws.Nilpotent

open LRA.Map.Operation

universe u

/-- Apply a nilpotence witness. -/
theorem NilpotentElement.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {zero element : Carrier}
    (law : NilpotentElement operation zero element) :
    exists positiveExponent : Nat,
      PositivePower operation element positiveExponent = zero := by
  sorry

/-- The first positive power is the element itself. -/
theorem PositivePower.first {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier) :
    PositivePower operation element 0 = element := by
  sorry

/-- The successor positive power unfolds by one operation step. -/
theorem PositivePower.succ {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier)
    (exponent : Nat) :
    PositivePower operation element (Nat.succ exponent) =
      operation (PositivePower operation element exponent) element := by
  sorry

/-- The first positive power is one multiplication-step from the identity. -/
theorem OperationPower.one {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier) :
    OperationPower operation identity element 1 = operation identity element := by
  sorry

/-- The successor power unfolds by one operation step. -/
theorem OperationPower.succ {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier)
    (exponent : Nat) :
    OperationPower operation identity element (Nat.succ exponent) =
      operation (OperationPower operation identity element exponent) element := by
  sorry

end LRA.Map.Operation.Laws.Nilpotent
