import LRA.AlgebraicStructures.AdditiveSemigroup.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-- Two-sided identity: `0 + a = a` and `a + 0 = a`. -/
class AdditiveIdentityLaws (R : Type u) [Add R] [OfNat R 0] : Prop where
  ZeroAdd :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a + b) 0
  AddZero :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a + b) 0

/-- An additive monoid: `(R, +, 0)` — associative, closed (free from `Add`),
nonempty (ambient `[Nonempty R]`, per `MagmaLaws`'s doc comment / D7), with a
two-sided identity `0`. Combines `AdditiveSemigroupLaws` (closure +
associativity + nonemptiness) with `AdditiveIdentityLaws` (the identity
axiom) — matches the user's `(M, +, 0)` definition exactly, dual to
`MonoidLaws` (`Monoid.Interface.Laws.Definition`). -/
class abbrev AdditiveMonoidLaws (R : Type u) [Add R] [OfNat R 0] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R

section Wrappers

variable {R : Type u}

theorem ZeroAdd [Add R] [OfNat R 0] [AdditiveIdentityLaws R] :
    ∀ a : R, 0 + a = a :=
  sorry

theorem AddZero [Add R] [OfNat R 0] [AdditiveIdentityLaws R] :
    ∀ a : R, a + 0 = a :=
  sorry

end Wrappers

end LRA.AlgebraicStructures
