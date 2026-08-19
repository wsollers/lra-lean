import LRA.Operation.Definition

namespace LRA.Operation.Laws.Nilpotent

open LRA.Operation

universe u

def OperationPower {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier) : Nat → Carrier
  | 0 => identity
  | Nat.succ exponent => operation (OperationPower operation identity element exponent) element

def PositivePower {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier) : Nat → Carrier
  | 0 => element
  | Nat.succ exponent => operation (PositivePower operation element exponent) element

def NilpotentElement {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (zero element : Carrier) : Prop :=
  ∃ positiveExponent : Nat,
    PositivePower operation element positiveExponent = zero

end LRA.Operation.Laws.Nilpotent
