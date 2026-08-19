import LRA.Set.PredicateSet.Definition

/-!
The Presburger carrier: a fresh native inductive type, backed by
`LRA.Set.PredicateSet` for its notion of subset -- the type-theoretic
counterpart to `NaturalNumbers.Constructions.VonNeumann`'s ZFC-derived one
and the (not yet built) Landau construction's directly-postulated one. See
`LRA/NaturalNumbers/ProofOrder.md`'s Backends section.

This carrier is deliberately a *fresh* inductive type, not Lean/Mathlib's
own `Nat` -- the point of a construction here is to build the naturals up,
the same way `VonNeumann` builds up from ZFC rather than borrowing
Mathlib's answer. Substitutability for `Nat` is a separate, later proof
(`Interface/Interop/Mathlib/`, once the system layer exists), not something
this carrier gets for free by being defined as `Nat`.

Every theorem below is `sorry`, per the same discipline as `VonNeumann`'s
files -- but flagged explicitly where that discipline is arguably wasted
motion: `zero`/`succ` being an `inductive` type means Lean's kernel
generates injectivity, no-confusion, and the recursion principle
automatically, so the three Peano properties below are not really open
mathematical questions to work through by hand, the way the ZFC ones are --
each is close to `PresburgerElement.noConfusion`/`.succ.inj`/`.rec` applied
directly. Left `sorry` anyway, for you to decide whether to fill in as
one-liners or treat the same as everything else.
-/

namespace LRA.NaturalNumbers.Constructions.Presburger

open LRA.Set

/-- The Presburger carrier: zero, and successor. -/
inductive PresburgerElement where
  | zero
  | succ (n : PresburgerElement)

/-- Presburger's own order relation, `<`, defined directly by structural
recursion rather than in terms of addition -- Presburger arithmetic's
signature is `{0, S, +, <}` with `<` primitive, not derived. -/
def PresburgerLessThan : PresburgerElement → PresburgerElement → Prop
  | _, .zero => False
  | .zero, .succ _ => True
  | .succ m, .succ n => PresburgerLessThan m n

/-- Zero is not the successor of any element. Free via
`PresburgerElement.noConfusion`. -/
theorem PresburgerZeroIsNotSuccessor :
    ∀ n : PresburgerElement, PresburgerElement.succ n ≠ PresburgerElement.zero := by
  sorry

/-- Successor is injective. Free via `PresburgerElement.succ.inj`. -/
theorem PresburgerSuccessorInjective :
    ∀ m n : PresburgerElement,
      PresburgerElement.succ m = PresburgerElement.succ n → m = n := by
  sorry

/-- Induction on the Presburger carrier. Free via `PresburgerElement.rec`,
with `subset` as the motive. -/
theorem PresburgerInductionPrinciple :
    ∀ subset : PredicateSet PresburgerElement,
      PresburgerElement.zero ∈ subset →
      (∀ n : PresburgerElement, n ∈ subset → PresburgerElement.succ n ∈ subset) →
      ∀ n : PresburgerElement, n ∈ subset := by
  sorry

end LRA.NaturalNumbers.Constructions.Presburger
