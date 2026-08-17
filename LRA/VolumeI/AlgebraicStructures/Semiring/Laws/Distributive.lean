import LRA.VolumeI.Operations.Laws.Distributive.Definition

namespace LRA.AlgebraicStructures

universe u

/-!
Distributivity certificates for semiring-style structures.
-/

/-- Multiplication distributes over addition. -/
class DistributiveLaws (R : Type u) [Add R] [Mul R] : Prop where
  LeftDistributive :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (fun a b : R => a * b) (fun a b : R => a + b)
  RightDistributive :
    LRA.Operation.Laws.Distributive.RightDistributive
      (fun a b : R => a * b) (fun a b : R => a + b)

section Wrappers

variable {R : Type u} [Add R] [Mul R] [DistributiveLaws R]

/-- Multiplication distributes over addition from the left. -/
theorem LeftDistributive : ∀ a b c : R, a * (b + c) = a * b + a * c :=
  DistributiveLaws.LeftDistributive

/-- Multiplication distributes over addition from the right. -/
theorem RightDistributive : ∀ a b c : R, (a + b) * c = a * c + b * c :=
  DistributiveLaws.RightDistributive

end Wrappers

end LRA.AlgebraicStructures
