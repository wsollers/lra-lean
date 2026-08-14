import LRA.Pilot.Supremum.SupremumTheorems
import LRA.Pilot.Supremum.SupremumTotalOrder
import Mathlib.Data.Real.Basic
import Mathlib.Tactic

/-!
# Supremum counterexamples

Named, checked counterexamples guarding the boundaries of the supremum
vocabulary:

* the two-point discrete poset, where distinct elements are incomparable,
  showing that a failed comparison does not convert to a strict witness
  without totality — the strict failure forms in
  `LRA.Pilot.Supremum.SupremumTotalOrder` genuinely need their totality
  hypothesis;
* the empty set in the reals, which is bounded above by everything yet has no
  least upper bound, showing that the least-upper-bound property needs its
  nonemptiness hypothesis.

The rational square-below-two chain in
`LRA.Pilot.OrderBoundsCounterexamples` remains the canonical witness that
boundedness does not imply the existence of a supremum in an incomplete
order.
-/

namespace LRA.Pilot.OrderBounds.Counterexamples

open LRA.Pilot.OrderBounds
open LRA.VolumeI.Order

/-- The two-point discrete poset: the carrier is `Bool` and the order is
equality, so distinct elements are incomparable.  Reflexivity, antisymmetry,
and transitivity are the corresponding laws of equality.

Logical form:

```lean
Poset where
  Carrier := Bool
  NonStrictOrder := fun left right => left = right
  NonStrictOrderIsPartialOrder := ⟨reflexivity, antisymmetry, transitivity⟩
```
-/
def DiscretePairPoset : Poset where
  Carrier := Bool
  NonStrictOrder := fun left right => left = right
  NonStrictOrderIsPartialOrder := by
    refine ⟨?_, ?_, ?_⟩
    · intro element
      rfl
    · intro left right leftEqualsRight _
      exact leftEqualsRight
    · intro first second third firstEqualsSecond secondEqualsThird
      exact firstEqualsSecond.trans secondEqualsThird

/-- The discrete pair poset is not total: `false` and `true` are related in
neither direction.

Logical form:

```lean
¬ LRA.VolumeI.Relations.Total DiscretePairPoset.NonStrictOrder
```
-/
theorem DiscretePairPosetNotTotal :
    ¬ LRA.VolumeI.Relations.Total DiscretePairPoset.NonStrictOrder := by
  intro totality
  cases totality false true with
  | inl falseEqualsTrue => exact Bool.noConfusion falseEqualsTrue
  | inr trueEqualsFalse => exact Bool.noConfusion trueEqualsFalse

/-- In the discrete pair poset, `true` is not below `false`, yet `false` is
not strictly below `true` either: without totality a failed comparison does
not produce a strict witness, because the failure may come from
incomparability.

Logical form:

```lean
¬ DiscretePairPoset.NonStrictOrder true false ∧
  ¬ StrictPart DiscretePairPoset.NonStrictOrder false true
```
-/
theorem DiscreteFailedComparisonWithoutStrictWitness :
    ¬ DiscretePairPoset.NonStrictOrder true false ∧
      ¬ StrictPart DiscretePairPoset.NonStrictOrder false true := by
  constructor
  · intro trueEqualsFalse
    exact Bool.noConfusion trueEqualsFalse
  · intro strictWitness
    exact Bool.noConfusion strictWitness.1

/-- The strict rewrite of `NotRelatedIffReverseStrictOfTotalOrder` fails on
the discrete pair poset: the equivalence between a failed comparison and a
reverse strict witness does not hold for all pairs, so its totality
hypothesis cannot be dropped.

Logical form:

```lean
¬ ∀ left right : Bool,
  ¬ DiscretePairPoset.NonStrictOrder left right ↔
    StrictPart DiscretePairPoset.NonStrictOrder right left
```
-/
theorem StrictRewriteFailsWithoutTotality :
    ¬ ∀ left right : Bool,
      ¬ DiscretePairPoset.NonStrictOrder left right ↔
        StrictPart DiscretePairPoset.NonStrictOrder right left := by
  intro strictRewrite
  have strictWitness :=
    (strictRewrite true false).mp
      DiscreteFailedComparisonWithoutStrictWitness.1
  exact DiscreteFailedComparisonWithoutStrictWitness.2 strictWitness

/-- The empty set of reals has no least upper bound: every real is vacuously
an upper bound, so a least upper bound would be below every real — including
itself minus one.  Bounded above therefore does not imply having a supremum
without a nonemptiness hypothesis.

Logical form:

```lean
¬ ∃ candidate : Real,
  LeastUpperBound (PosetFromPartialOrder Real) (∅ : Set Real) candidate
```
-/
theorem EmptySetHasNoLeastUpperBoundInReal :
    ¬ ∃ candidate : Real,
      LeastUpperBound (PosetFromPartialOrder Real) (∅ : Set Real) candidate := by
  rintro ⟨candidate, candidateIsLeastUpperBound⟩
  have candidateBelowEverything :=
    (EmptySetLeastUpperBoundIffBottom
      (PosetFromPartialOrder Real) candidate).mp candidateIsLeastUpperBound
  have candidateBelowPredecessor := candidateBelowEverything (candidate - 1)
  linarith

end LRA.Pilot.OrderBounds.Counterexamples
