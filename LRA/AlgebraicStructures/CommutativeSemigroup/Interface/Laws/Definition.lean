import LRA.Operation
import LRA.AlgebraicStructures.Semigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-- Commutativity of `*`, on its own — an atomic mixin, reused across every
subject in the tree that needs "commutative" (`CommutativeMonoidLaws`,
`CommutativeRingLaws`, `Field`, ... all list it alongside their own
associativity/identity/etc. mixins). Kept atomic and unchanged: this is not the
place to fold in associativity, since that would duplicate `MulAssociative`
across every downstream combining class that already brings it in separately.
Doesn't need `[Nonempty R]` itself — nothing about "commutative" requires it,
unlike `MultiplicativeSemigroupLaws`/`AdditiveSemigroupLaws`, which have no
identity/zero constant to derive it from. -/
class MultiplicativeCommutativeLaws (R : Type u) [Mul R] : Prop where
  MulCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a * b)

section Wrappers

variable {R : Type u}

theorem MulCommutative [Mul R] [MultiplicativeCommutativeLaws R] :
    ∀ a b : R, a * b = b * a := by
  sorry
end Wrappers

/-- A commutative semigroup: `(R, *)` where `*` is both associative and
commutative, and `R` is nonempty. This is the combining class this subject was
missing — `MultiplicativeCommutativeLaws` alone only states commutativity, and
nothing upstream forced it together with `MultiplicativeSemigroupLaws`
(associativity + nonemptiness). A `class abbrev` combining two already-existing
LRA classes derives its instances automatically from instances of its parts, so
no separate combinator proof is needed here — see
`Constructions/Mathlib/Laws.lean` for a bridge instance from Mathlib's
`CommSemigroup`. Needs `[Nonempty R]` in its own header because
`MultiplicativeSemigroupLaws R` does — see `MagmaLaws`'s doc comment. -/
class abbrev CommutativeSemigroupLaws (R : Type u) [Mul R] [Nonempty R] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeCommutativeLaws R

end LRA.AlgebraicStructures
