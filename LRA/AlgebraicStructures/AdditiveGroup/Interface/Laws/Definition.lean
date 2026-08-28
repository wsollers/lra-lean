import LRA.AlgebraicStructures.AdditiveMonoid.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-- Two-sided inverse: `-a + a = 0` and `a + -a = 0`, matching the user's
axiom 4 (`x + (-x) = (-x) + x = 0`) exactly — both one-sided cancellations
hold against the *same* element `-a`. Dual to `MultiplicativeGroupInverseLaws`
(`Group.Interface.Laws.Definition`). -/
class AdditiveInverseLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop where
  NegAddCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)
  AddNegCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)

/-- Connects `-` to `+`/negation, matching the user's own convention: "`x - y
:= x + (-y)`, defined globally across `G × G`". -/
class SubtractionCompatibilityLaw (R : Type u)
    [Sub R] [Add R] [Neg R] : Prop where
  SubEqAddNeg : ∀ a b : R, a - b = a + -b

/-- An additive group: `(R, +, 0, -)` — associative, closed (free from
`Add`), nonempty (ambient `[Nonempty R]` per D7), two-sided identity `0`, and
every element has a two-sided inverse. Combines `AdditiveSemigroupLaws`
(axioms 1–2: closure + associativity) with `AdditiveIdentityLaws` (axiom 3:
identity) and `AdditiveInverseLaws` (axiom 4: inverses) — matches the user's
four-axiom `(G, +, 0, -)` definition exactly, dual to `GroupLaws`
(`Group.Interface.Laws.Definition`). -/
class abbrev AdditiveGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] [Nonempty R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R

section Wrappers

variable {R : Type u}

theorem NegAddCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, -a + a = 0 :=
  sorry

theorem AddNegCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, a + -a = 0 :=
  sorry

theorem SubEqAddNeg [Sub R] [Add R] [Neg R]
    [SubtractionCompatibilityLaw R] :
    ∀ a b : R, a - b = a + -b :=
  sorry

end Wrappers

end LRA.AlgebraicStructures
