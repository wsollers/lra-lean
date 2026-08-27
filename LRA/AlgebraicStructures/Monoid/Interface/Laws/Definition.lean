import LRA.AlgebraicStructures.Semigroup.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-- Two-sided identity: `1 * a = a` and `a * 1 = a`. -/
class MultiplicativeIdentityLaws (R : Type u) [Mul R] [OfNat R 1] : Prop where
  OneMul :
    LRA.Operation.Laws.Identity.LeftIdentity (fun a b : R => a * b) 1
  MulOne :
    LRA.Operation.Laws.Identity.RightIdentity (fun a b : R => a * b) 1

/-- A monoid: `(R, *, 1)` — associative, closed (free from `Mul`), nonempty
(ambient `[Nonempty R]`, per `MagmaLaws`'s doc comment / D7), with a two-sided
identity `1`. Combines `MultiplicativeSemigroupLaws` (closure + associativity +
nonemptiness) with `MultiplicativeIdentityLaws` (the identity axiom) — matches
the user's `(M, *, e)` definition exactly, with `e` realized as `OfNat R 1`. -/
class abbrev MonoidLaws (R : Type u) [Mul R] [OfNat R 1] [Nonempty R] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R

section Wrappers

variable {R : Type u}

theorem OneMul [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, 1 * a = a :=
  sorry

theorem MulOne [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, a * 1 = a :=
  sorry

end Wrappers

end LRA.AlgebraicStructures
