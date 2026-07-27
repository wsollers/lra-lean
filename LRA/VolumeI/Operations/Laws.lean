import LRA.VolumeI.Operations.Operations

namespace LRA.VolumeI.Algebra

universe u

/-- Associativity of a binary operation. -/
def associative {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : Operations.BinaryOperation alpha) : Prop :=
  forall first second third,
    operation (operation first second) third =
      operation first (operation second third)

/-- Commutativity of a binary operation. -/
def commutative {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : Operations.BinaryOperation alpha) : Prop :=
  forall first second, operation first second = operation second first

/-- Left-identity law for a binary operation. -/
def leftIdentity {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : Operations.BinaryOperation alpha) (identity : alpha) : Prop :=
  forall element, operation identity element = element

/-- Right-identity law for a binary operation. -/
def rightIdentity {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : Operations.BinaryOperation alpha) (identity : alpha) : Prop :=
  forall element, operation element identity = element

/-- Two-sided identity law for a binary operation. -/
def identity {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : Operations.BinaryOperation alpha) (identity : alpha) : Prop :=
  leftIdentity operation identity /\ rightIdentity operation identity

/-- Left-inverse law for a unary inverse relative to a binary operation. -/
def leftInverse {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : Operations.BinaryOperation alpha) (identity : alpha)
    (inverse : Operations.UnaryOperation alpha) : Prop :=
  forall element, operation (inverse element) element = identity

/-- Right-inverse law for a unary inverse relative to a binary operation. -/
def rightInverse {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : Operations.BinaryOperation alpha) (identity : alpha)
    (inverse : Operations.UnaryOperation alpha) : Prop :=
  forall element, operation element (inverse element) = identity

/-- Two-sided inverse law for a unary inverse relative to a binary operation. -/
def inverse {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : Operations.BinaryOperation alpha) (identity : alpha)
    (inverseOperation : Operations.UnaryOperation alpha) : Prop :=
  leftInverse operation identity inverseOperation /\
    rightInverse operation identity inverseOperation

/-- Idempotence of a binary operation. -/
def idempotent {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : Operations.BinaryOperation alpha) : Prop :=
  forall element, operation element element = element

/-- Left-distributivity of one operation over another. -/
def leftDistributive {alpha : LRA.VolumeI.Set.LRACarrier}
    (mul add : Operations.BinaryOperation alpha) : Prop :=
  forall left right third,
    mul left (add right third) = add (mul left right) (mul left third)

/-- Right-distributivity of one operation over another. -/
def rightDistributive {alpha : LRA.VolumeI.Set.LRACarrier}
    (mul add : Operations.BinaryOperation alpha) : Prop :=
  forall left right third,
    mul (add left right) third = add (mul left third) (mul right third)

/-- Two-sided distributivity of one operation over another. -/
def distributive {alpha : LRA.VolumeI.Set.LRACarrier}
    (mul add : Operations.BinaryOperation alpha) : Prop :=
  leftDistributive mul add /\ rightDistributive mul add

/-- A left-absorbing element for a binary operation. -/
def leftAbsorbing {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : Operations.BinaryOperation alpha) (absorber : alpha) : Prop :=
  forall element, operation absorber element = absorber

/-- A right-absorbing element for a binary operation. -/
def rightAbsorbing {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : Operations.BinaryOperation alpha) (absorber : alpha) : Prop :=
  forall element, operation element absorber = absorber

/-- A two-sided absorbing element for a binary operation. -/
def absorbing {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : Operations.BinaryOperation alpha) (absorber : alpha) : Prop :=
  leftAbsorbing operation absorber /\ rightAbsorbing operation absorber

end LRA.VolumeI.Algebra
