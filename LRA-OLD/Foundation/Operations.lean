import LRA.Foundation.Functions
import LRA.Foundation.Relations

namespace LRA.Foundation

universe u

/--
A nullary operation on a carrier is a distinguished element of that carrier.
This gives constants such as `0` and `1` the same operation vocabulary as
unary and binary operations.
-/
abbrev NullaryOperation (α : LRACarrier) := α

/-- Compatibility name for nullary operations viewed as constants. -/
abbrev ConstantOperation (α : LRACarrier) := NullaryOperation α

abbrev UnaryOperation (α : LRACarrier) := α → α

abbrev BinaryOperation (α : LRACarrier) := α → α → α

abbrev ExternalBinaryOperation (scalar carrier : LRACarrier) := scalar → carrier → carrier

/--
A partial unary operation is defined only on inputs satisfying its domain
predicate. Reciprocal away from zero is the main number-system example.
-/
structure PartialUnaryOperation (α : LRACarrier) where
  domain : α → Prop
  apply : (input : α) → domain input → α

/--
A partial binary operation is defined only on input pairs satisfying its domain
predicate. Division and interval division are the main number-system examples.
-/
structure PartialBinaryOperation (α : LRACarrier) where
  domain : α → α → Prop
  apply : (left right : α) → domain left right → α

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

namespace PartialUnaryOperation

def definedAt {α : LRACarrier} (operation : PartialUnaryOperation α) (input : α) : Prop :=
  operation.domain input

def respects
    {α : LRACarrier}
    (relation : Endorelation α)
    (operation : PartialUnaryOperation α) : Prop :=
  ∀ first second
    (first_in_domain : operation.domain first)
    (second_in_domain : operation.domain second),
      relation first second →
        relation
          (operation.apply first first_in_domain)
          (operation.apply second second_in_domain)

end PartialUnaryOperation

namespace PartialBinaryOperation

def definedAt {α : LRACarrier} (operation : PartialBinaryOperation α) (left right : α) : Prop :=
  operation.domain left right

def respects
    {α : LRACarrier}
    (relation : Endorelation α)
    (operation : PartialBinaryOperation α) : Prop :=
  ∀ left₁ left₂ right₁ right₂
    (first_in_domain : operation.domain left₁ right₁)
    (second_in_domain : operation.domain left₂ right₂),
      relation left₁ left₂ →
        relation right₁ right₂ →
          relation
            (operation.apply left₁ right₁ first_in_domain)
            (operation.apply left₂ right₂ second_in_domain)

end PartialBinaryOperation

end LRA.Foundation
