import LRA.VolumeI.Algebra.Operations

namespace LRA.VolumeI.Algebra.Laws

open LRA.VolumeI.Algebra.Operations

def IsAssociative {α : Type} (operation : BinaryOperation α) : Prop :=
  ∀ first second third : α,
    ApplyBinaryOperation operation (ApplyBinaryOperation operation first second) third =
    ApplyBinaryOperation operation first (ApplyBinaryOperation operation second third)

def IsCommutative {α : Type} (operation : BinaryOperation α) : Prop :=
  ∀ first second : α,
    ApplyBinaryOperation operation first second =
    ApplyBinaryOperation operation second first

def IsLeftIdentity {α : Type} (operation : BinaryOperation α) (identityElement : α) : Prop :=
  ∀ element : α, ApplyBinaryOperation operation identityElement element = element

def IsRightIdentity {α : Type} (operation : BinaryOperation α) (identityElement : α) : Prop :=
  ∀ element : α, ApplyBinaryOperation operation element identityElement = element

def IsIdentity {α : Type} (operation : BinaryOperation α) (identityElement : α) : Prop :=
  IsLeftIdentity operation identityElement ∧ IsRightIdentity operation identityElement

def IsIdempotent {α : Type} (operation : BinaryOperation α) : Prop :=
  ∀ element : α, ApplyBinaryOperation operation element element = element

def IsInverse {α : Type} (operation : BinaryOperation α) (identityElement : α)
    (inverseOperation : UnaryOperation α) : Prop :=
  ∀ element : α,
    ApplyBinaryOperation operation element (ApplyUnaryOperation inverseOperation element) =
      identityElement

def LeftDistributesOver {α : Type} (multiplication addition : BinaryOperation α) : Prop :=
  ∀ first second third : α,
    ApplyBinaryOperation multiplication first (ApplyBinaryOperation addition second third) =
    ApplyBinaryOperation addition
      (ApplyBinaryOperation multiplication first second)
      (ApplyBinaryOperation multiplication first third)

def RightDistributesOver {α : Type} (multiplication addition : BinaryOperation α) : Prop :=
  ∀ first second third : α,
    ApplyBinaryOperation multiplication (ApplyBinaryOperation addition first second) third =
    ApplyBinaryOperation addition
      (ApplyBinaryOperation multiplication first third)
      (ApplyBinaryOperation multiplication second third)

def DistributesOver {α : Type} (multiplication addition : BinaryOperation α) : Prop :=
  LeftDistributesOver multiplication addition ∧ RightDistributesOver multiplication addition

end LRA.VolumeI.Algebra.Laws
