import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-- An additive semigroup: `(R, +)` where `+` is associative and `R` is
nonempty. Formally identical to `MultiplicativeSemigroupLaws`, just under
additive notation — nonemptiness is an ambient `[Nonempty R]` assumption, not a
stored field, for the same reason: see `MagmaLaws`'s doc comment for the
concrete failure a stored field caused here (this class's `CarrierNonempty`
collided with `MultiplicativeSemigroupLaws`'s the moment `SemiringLaws` and
friends combined both sides — fixed by moving nonemptiness to a parameter for
every subject in the tree that needs it, rather than by picking yet another
field name). -/
class AdditiveSemigroupLaws (R : Type u) [Add R] [Nonempty R] : Prop where
  AddAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b : R => a + b)

section Wrappers

variable {R : Type u}

theorem AddAssociative [Add R] [Nonempty R] [AdditiveSemigroupLaws R] :
    ∀ a b c : R, (a + b) + c = a + (b + c) := by
  sorry
end Wrappers

end LRA.AlgebraicStructures
