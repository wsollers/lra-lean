import LRA.Foundation.Operations

namespace LRA.Foundation
namespace Algebra

universe u

def associative {α : LRACarrier} (operation : BinaryOperation α) : Prop :=
  Operation.associative operation

def commutative {α : LRACarrier} (operation : BinaryOperation α) : Prop :=
  Operation.commutative operation

def leftIdentity {α : LRACarrier} (operation : BinaryOperation α) (identity : α) : Prop :=
  Operation.leftIdentity operation identity

def rightIdentity {α : LRACarrier} (operation : BinaryOperation α) (identity : α) : Prop :=
  Operation.rightIdentity operation identity

def identity {α : LRACarrier} (operation : BinaryOperation α) (identity : α) : Prop :=
  Operation.identity operation identity

def leftInverse
    {α : LRACarrier} (operation : BinaryOperation α) (identity : α)
    (inverse : UnaryOperation α) : Prop :=
  Operation.leftInverse operation identity inverse

def rightInverse
    {α : LRACarrier} (operation : BinaryOperation α) (identity : α)
    (inverse : UnaryOperation α) : Prop :=
  Operation.rightInverse operation identity inverse

def idempotent {α : LRACarrier} (operation : BinaryOperation α) : Prop :=
  Operation.idempotent operation

def leftDistributive
    {α : LRACarrier} (mul add : BinaryOperation α) : Prop :=
  Operation.leftDistributive mul add

def rightDistributive
    {α : LRACarrier} (mul add : BinaryOperation α) : Prop :=
  Operation.rightDistributive mul add

def leftAbsorbing {α : LRACarrier} (operation : BinaryOperation α) (absorber : α) : Prop :=
  ∀ element, operation absorber element = absorber

def rightAbsorbing {α : LRACarrier} (operation : BinaryOperation α) (absorber : α) : Prop :=
  ∀ element, operation element absorber = absorber

def leftCancellative {α : LRACarrier} (operation : BinaryOperation α) : Prop :=
  ∀ ⦃left right₁ right₂⦄,
    operation left right₁ = operation left right₂ → right₁ = right₂

def rightCancellative {α : LRACarrier} (operation : BinaryOperation α) : Prop :=
  ∀ ⦃left₁ left₂ right⦄,
    operation left₁ right = operation left₂ right → left₁ = left₂

end Algebra
end LRA.Foundation
