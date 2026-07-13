import LRA.Foundation.Functions

namespace LRA.Foundation

universe u

abbrev UnaryOperation (α : LRACarrier) := α → α

abbrev BinaryOperation (α : LRACarrier) := α → α → α

abbrev ExternalBinaryOperation (scalar carrier : LRACarrier) := scalar → carrier → carrier

namespace Operation

def associative {α : LRACarrier} (operation : BinaryOperation α) : Prop :=
  ∀ first second third,
    operation (operation first second) third =
      operation first (operation second third)

def commutative {α : LRACarrier} (operation : BinaryOperation α) : Prop :=
  ∀ first second, operation first second = operation second first

def leftIdentity {α : LRACarrier} (operation : BinaryOperation α) (identity : α) : Prop :=
  ∀ element, operation identity element = element

def rightIdentity {α : LRACarrier} (operation : BinaryOperation α) (identity : α) : Prop :=
  ∀ element, operation element identity = element

def identity {α : LRACarrier} (operation : BinaryOperation α) (identity : α) : Prop :=
  leftIdentity operation identity ∧ rightIdentity operation identity

def leftInverse
    {α : LRACarrier} (operation : BinaryOperation α) (identity : α)
    (inverse : UnaryOperation α) : Prop :=
  ∀ element, operation (inverse element) element = identity

def rightInverse
    {α : LRACarrier} (operation : BinaryOperation α) (identity : α)
    (inverse : UnaryOperation α) : Prop :=
  ∀ element, operation element (inverse element) = identity

def idempotent {α : LRACarrier} (operation : BinaryOperation α) : Prop :=
  ∀ element, operation element element = element

def leftDistributive
    {α : LRACarrier} (mul add : BinaryOperation α) : Prop :=
  ∀ first second third,
    mul first (add second third) =
      add (mul first second) (mul first third)

def rightDistributive
    {α : LRACarrier} (mul add : BinaryOperation α) : Prop :=
  ∀ first second third,
    mul (add first second) third =
      add (mul first third) (mul second third)

end Operation

end LRA.Foundation
