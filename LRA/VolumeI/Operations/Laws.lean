import LRA.VolumeI.Operations.Operations

namespace LRA.VolumeI.Operations

universe u

/-- Associativity of a binary operation. -/
def Associative {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : BinaryOperation alpha) : Prop :=
  forall first second third,
    operation (operation first second) third =
      operation first (operation second third)

/-- Commutativity of a binary operation. -/
def Commutative {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : BinaryOperation alpha) : Prop :=
  forall first second, operation first second = operation second first

/-- Left-identity law for a binary operation. -/
def LeftIdentity {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : BinaryOperation alpha) (identity : alpha) : Prop :=
  forall element, operation identity element = element

/-- Right-identity law for a binary operation. -/
def RightIdentity {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : BinaryOperation alpha) (identity : alpha) : Prop :=
  forall element, operation element identity = element

/-- Two-sided identity law for a binary operation. -/
def Identity {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : BinaryOperation alpha) (identity : alpha) : Prop :=
  LeftIdentity operation identity /\ RightIdentity operation identity

/-- Left-inverse law for a unary inverse relative to a binary operation. -/
def LeftInverse {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : BinaryOperation alpha) (identity : alpha)
    (inverse : UnaryOperation alpha) : Prop :=
  forall element, operation (inverse element) element = identity

/-- Right-inverse law for a unary inverse relative to a binary operation. -/
def RightInverse {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : BinaryOperation alpha) (identity : alpha)
    (inverse : UnaryOperation alpha) : Prop :=
  forall element, operation element (inverse element) = identity

/-- Two-sided inverse law for a unary inverse relative to a binary operation. -/
def Inverse {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : BinaryOperation alpha) (identity : alpha)
    (inverseOperation : UnaryOperation alpha) : Prop :=
  LeftInverse operation identity inverseOperation /\
    RightInverse operation identity inverseOperation

/-- Idempotence of a binary operation. -/
def Idempotent {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : BinaryOperation alpha) : Prop :=
  forall element, operation element element = element

/-- Left-distributivity of one operation over another. -/
def LeftDistributive {alpha : LRA.VolumeI.Set.LRACarrier}
    (mul add : BinaryOperation alpha) : Prop :=
  forall left right third,
    mul left (add right third) = add (mul left right) (mul left third)

/-- Right-distributivity of one operation over another. -/
def RightDistributive {alpha : LRA.VolumeI.Set.LRACarrier}
    (mul add : BinaryOperation alpha) : Prop :=
  forall left right third,
    mul (add left right) third = add (mul left third) (mul right third)

/-- Two-sided distributivity of one operation over another. -/
def Distributive {alpha : LRA.VolumeI.Set.LRACarrier}
    (mul add : BinaryOperation alpha) : Prop :=
  LeftDistributive mul add /\ RightDistributive mul add

/-- A left-absorbing element for a binary operation. -/
def LeftAbsorbing {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : BinaryOperation alpha) (absorber : alpha) : Prop :=
  forall element, operation absorber element = absorber

/-- A right-absorbing element for a binary operation. -/
def RightAbsorbing {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : BinaryOperation alpha) (absorber : alpha) : Prop :=
  forall element, operation element absorber = absorber

/-- A two-sided absorbing element for a binary operation. -/
def Absorbing {alpha : LRA.VolumeI.Set.LRACarrier}
    (operation : BinaryOperation alpha) (absorber : alpha) : Prop :=
  LeftAbsorbing operation absorber /\ RightAbsorbing operation absorber

end LRA.VolumeI.Operations
