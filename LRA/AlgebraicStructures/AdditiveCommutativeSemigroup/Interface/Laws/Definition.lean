import LRA.Operation
import LRA.AlgebraicStructures.AdditiveSemigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-- Commutativity of `+`, on its own — an atomic mixin, reused across every
subject in the tree that needs "additively commutative" (`AbelianGroupLaws`,
`Semiring`/`Ring`/`Field` etc. all list it alongside their own
associativity/identity/etc. mixins). Kept atomic and unchanged: this is not the
place to fold in associativity, since that would duplicate `AddAssociative`
across every downstream combining class that already brings it in separately.
Doesn't need `[Nonempty R]` itself — nothing about "commutative" requires it,
unlike `AdditiveSemigroupLaws`, which has no identity/zero constant to derive
it from. -/
class AdditiveCommutativeLaws (R : Type u) [Add R] : Prop where
  AddCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b : R => a + b)

section Wrappers

variable {R : Type u}

theorem AddCommutative [Add R] [AdditiveCommutativeLaws R] :
    ∀ a b : R, a + b = b + a :=
  sorry

end Wrappers

/-- An additive commutative semigroup: `(R, +)` where `+` is both associative
and commutative, and `R` is nonempty. This is the combining class this subject
was missing — `AdditiveCommutativeLaws` alone only states commutativity, and
nothing upstream forced it together with `AdditiveSemigroupLaws` (associativity
+ nonemptiness); the multiplicative side had the identical gap, fixed in
`CommutativeSemigroup` (as-03). A `class abbrev` combining two already-existing
LRA classes derives its instances automatically from instances of its parts, so
no separate combinator proof is needed here — see
`Constructions/Mathlib/Laws.lean` for a bridge instance from Mathlib's
`AddCommSemigroup`. Needs `[Nonempty R]` in its own header because
`AdditiveSemigroupLaws R` does — see `MagmaLaws`'s doc comment. -/
class abbrev AdditiveCommutativeSemigroupLaws (R : Type u) [Add R] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveCommutativeLaws R

end LRA.AlgebraicStructures
