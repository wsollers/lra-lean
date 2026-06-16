import LRA.VolumeI.Foundations.Tuple

namespace LRA.VolumeI.Algebra.Operations

open LRA.VolumeI.Foundations

abbrev Operation (α : Type) (n : Nat) : Type := Tuple α n → α

abbrev BinaryOperation (α : Type) : Type := Operation α 2

abbrev UnaryOperation (α : Type) : Type := Operation α 1

def ApplyBinaryOperation {α : Type}
    (operation : BinaryOperation α) (first second : α) : α :=
  operation (pair first second)

def ApplyUnaryOperation {α : Type}
    (operation : UnaryOperation α) (element : α) : α :=
  operation (fun _ => element)

end LRA.VolumeI.Algebra.Operations
