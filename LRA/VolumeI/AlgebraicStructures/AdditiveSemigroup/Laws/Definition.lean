import LRA.VolumeI.Operations.Laws.Associative.Definition

namespace LRA.AlgebraicStructures

universe u

/-!
Additive semigroup law certificates.

This file owns the additive associativity certificate and its direct
wrapper theorem. Stronger additive structures import this certificate
rather than redefining associativity.
-/

/-- Addition specializes the canonical operation associativity law. -/
class AdditiveSemigroupLaws (R : Type u) [Add R] : Prop where
  AddAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a + b)

section Wrappers

variable {R : Type u}

/-- Addition is associative. -/
theorem AddAssociative [Add R] [AdditiveSemigroupLaws R] :
    ∀ a b c : R, (a + b) + c = a + (b + c) :=
  AdditiveSemigroupLaws.AddAssociative

end Wrappers

end LRA.AlgebraicStructures
