-- LRA/VolumeI/Algebra/Laws.lean
--
-- Generic, carrier-independent law predicates over operations. Each is a
-- PROPERTY a binary operation may or may not have — `IsAssociative operation`
-- reads literally "operation is associative". The PROOF that a specific
-- operation has the property (e.g. NaturalNumberAdditionIsAssociative) is a
-- certificate proved per-carrier in VolumeII, and travels into a structure
-- field when a number system is bundled.

import LRA.VolumeI.Algebra.Operations

namespace LRA.VolumeI.Algebra.Laws

open LRA.VolumeI.Algebra.Operations

/-- `(a ∘ b) ∘ c = a ∘ (b ∘ c)` — grouping does not matter. -/
def IsAssociative {α : Type} (operation : BinaryOperation α) : Prop :=
  ∀ first second third : α,
    ApplyBinaryOperation operation (ApplyBinaryOperation operation first second) third =
    ApplyBinaryOperation operation first (ApplyBinaryOperation operation second third)

/-- `a ∘ b = b ∘ a` — order does not matter. -/
def IsCommutative {α : Type} (operation : BinaryOperation α) : Prop :=
  ∀ first second : α,
    ApplyBinaryOperation operation first second =
    ApplyBinaryOperation operation second first

/-- `e ∘ a = a` — the element acts as a left identity. -/
def IsLeftIdentity {α : Type} (operation : BinaryOperation α) (identityElement : α) : Prop :=
  ∀ element : α, ApplyBinaryOperation operation identityElement element = element

/-- `a ∘ e = a` — the element acts as a right identity. -/
def IsRightIdentity {α : Type} (operation : BinaryOperation α) (identityElement : α) : Prop :=
  ∀ element : α, ApplyBinaryOperation operation element identityElement = element

/-- A two-sided identity: both a left and a right identity. -/
def IsIdentity {α : Type} (operation : BinaryOperation α) (identityElement : α) : Prop :=
  IsLeftIdentity operation identityElement ∧ IsRightIdentity operation identityElement

/-- `a ∘ a = a` — every element is its own combination with itself. -/
def IsIdempotent {α : Type} (operation : BinaryOperation α) : Prop :=
  ∀ element : α, ApplyBinaryOperation operation element element = element

/-- `a ∘ (inverse a) = e` — the unary `inverseOperation` cancels each element
    to the identity under `operation`. -/
def IsInverse {α : Type} (operation : BinaryOperation α) (identityElement : α)
    (inverseOperation : UnaryOperation α) : Prop :=
  ∀ element : α,
    ApplyBinaryOperation operation element (ApplyUnaryOperation inverseOperation element) =
      identityElement

/-- `a · (b + c) = a·b + a·c` — left distributivity of the first operation over
    the second. -/
def LeftDistributesOver {α : Type} (multiplication addition : BinaryOperation α) : Prop :=
  ∀ first second third : α,
    ApplyBinaryOperation multiplication first (ApplyBinaryOperation addition second third) =
    ApplyBinaryOperation addition
      (ApplyBinaryOperation multiplication first second)
      (ApplyBinaryOperation multiplication first third)

/-- `(a + b) · c = a·c + b·c` — right distributivity. -/
def RightDistributesOver {α : Type} (multiplication addition : BinaryOperation α) : Prop :=
  ∀ first second third : α,
    ApplyBinaryOperation multiplication (ApplyBinaryOperation addition first second) third =
    ApplyBinaryOperation addition
      (ApplyBinaryOperation multiplication first third)
      (ApplyBinaryOperation multiplication second third)

/-- Two-sided distributivity of the first operation over the second. -/
def DistributesOver {α : Type} (multiplication addition : BinaryOperation α) : Prop :=
  LeftDistributesOver multiplication addition ∧ RightDistributesOver multiplication addition

end LRA.VolumeI.Algebra.Laws
