import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-- A semigroup: `(R, *)` where `*` is associative and `R` is nonempty.
Nonemptiness is an ambient `[Nonempty R]` assumption, not a stored field — see
`MagmaLaws`'s doc comment for why. -/
class MultiplicativeSemigroupLaws (R : Type u) [Mul R] [Nonempty R] : Prop where
  MulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a * b)

section Wrappers

variable {R : Type u}

theorem MulAssociative [Mul R] [Nonempty R] [MultiplicativeSemigroupLaws R] :
    ∀ a b c : R, (a * b) * c = a * (b * c) :=
  sorry

end Wrappers

end LRA.AlgebraicStructures
