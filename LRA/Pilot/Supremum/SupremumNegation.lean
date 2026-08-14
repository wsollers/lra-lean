import LRA.Pilot.Supremum.Supremum
import Mathlib.Tactic

/-!
# Negation of the supremum, as certified failure modes

The negation of `LeastUpperBound` is not authored here as prose: it is stated
as two named failure-mode predicates and proved equivalent to the literal
negation.  A candidate fails to be the supremum in exactly two ways: it is not
an upper bound at all (`UpperBoundFailure`, witnessed by a member of the set it
does not dominate), or it is an upper bound that is not least
(`SharpnessFailure`, witnessed by an upper bound it does not sit below).

Everything is stated over an arbitrary poset.  The failure witnesses are
therefore phrased with `¬ NonStrictOrder`, never with a strict inequality: in
a general poset a failed comparison may come from incomparability, and the
strict rewrite is only available under totality
(`LRA.Pilot.Supremum.SupremumTotalOrder`), with its failure witnessed in
`LRA.Pilot.Supremum.SupremumCounterexamples`.
-/

namespace LRA.Pilot.OrderBounds

open LRA.VolumeI.Order

universe u v

/--
`UpperBoundFailure poset subset candidate` means that some member of `subset`
witnesses that `candidate` is not an upper bound: the member is in `subset`
and is not related below `candidate`.

Logical form:

```lean
∃ witness : poset.Carrier,
  witness ∈ subset ∧ ¬ poset.NonStrictOrder witness candidate
```
-/
@[lraCanonical "order.upper-bound-failure"] def UpperBoundFailure
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) : Prop :=
  ∃ witness : poset.Carrier,
    witness ∈ subset ∧ ¬ poset.NonStrictOrder witness candidate

/--
`SharpnessFailure poset subset candidate` means that some upper bound of
`subset` witnesses that `candidate` is not least among upper bounds: the
witness is an upper bound and `candidate` is not related below it.

Logical form:

```lean
∃ competitor : poset.Carrier,
  UpperBound poset subset competitor ∧
    ¬ poset.NonStrictOrder candidate competitor
```
-/
@[lraCanonical "order.sharpness-failure"] def SharpnessFailure
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) : Prop :=
  ∃ competitor : poset.Carrier,
    UpperBound poset subset competitor ∧
      ¬ poset.NonStrictOrder candidate competitor

/--
A candidate fails to be an upper bound exactly when some member of the subset
witnesses the failure.  Equivalently, the negated universal in `UpperBound`
converts to the existential witness form of `UpperBoundFailure`.

Logical form:

```lean
¬ UpperBound poset subset candidate ↔
  UpperBoundFailure poset subset candidate
```
-/
theorem NotUpperBoundIffUpperBoundFailure
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) :
    ¬ UpperBound poset subset candidate ↔
      UpperBoundFailure poset subset candidate := by
  constructor
  · intro notUpperBound
    by_contra noWitness
    apply notUpperBound
    intro element elementInSubset
    by_contra elementNotBelow
    exact noWitness ⟨element, elementInSubset, elementNotBelow⟩
  · intro failure candidateIsUpperBound
    obtain ⟨witness, witnessInSubset, witnessNotBelow⟩ := failure
    exact witnessNotBelow (candidateIsUpperBound witness witnessInSubset)

/--
A candidate fails to be the least upper bound exactly when one of the two
failure modes holds: it is not an upper bound, or some upper bound witnesses
that it is not least.  Equivalently, the negated conjunction defining
`LeastUpperBound` splits into the disjunction of the two witnessed failures.

Logical form:

```lean
¬ LeastUpperBound poset subset candidate ↔
  UpperBoundFailure poset subset candidate ∨
    SharpnessFailure poset subset candidate
```
-/
theorem NotLeastUpperBoundIffFailure
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) :
    ¬ LeastUpperBound poset subset candidate ↔
      UpperBoundFailure poset subset candidate ∨
        SharpnessFailure poset subset candidate := by
  constructor
  · intro notLeastUpperBound
    by_cases candidateIsUpperBound : UpperBound poset subset candidate
    · right
      by_contra noCompetitor
      apply notLeastUpperBound
      refine ⟨candidateIsUpperBound, ?_⟩
      intro otherCandidate otherIsUpperBound
      by_contra candidateNotBelow
      exact noCompetitor ⟨otherCandidate, otherIsUpperBound, candidateNotBelow⟩
    · left
      exact (NotUpperBoundIffUpperBoundFailure poset subset candidate).mp
        candidateIsUpperBound
  · intro failure leastUpperBound
    cases failure with
    | inl boundFailure =>
        exact (NotUpperBoundIffUpperBoundFailure poset subset candidate).mpr
          boundFailure leastUpperBound.1
    | inr sharpnessFailure =>
        obtain ⟨competitor, competitorIsUpperBound, candidateNotBelow⟩ :=
          sharpnessFailure
        exact candidateNotBelow
          (leastUpperBound.2 competitor competitorIsUpperBound)

end LRA.Pilot.OrderBounds
