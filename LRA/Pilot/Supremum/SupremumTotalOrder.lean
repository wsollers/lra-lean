import LRA.Pilot.Supremum.SupremumNegation
import LRA.VolumeI.Order.OrderedSets.TotalOrder.Definition

/-!
# Supremum failure under totality: the strict rewrite

In a general poset, `¬ NonStrictOrder left right` covers two geometrically
distinct situations: `right` strictly below `left`, or the two elements
incomparable.  Totality removes incomparability, and only then does a failed
comparison convert to a strict witness.  This module certifies that
conversion and restates the supremum failure modes in their strict form.

The textbook real-analysis negation of the supremum — "some member exceeds
`s`, or some upper bound is strictly smaller than `s`" — is therefore a
total-order theorem, not part of the definition.  The counterexample showing
that the conversion genuinely needs totality lives in
`LRA.Pilot.Supremum.SupremumCounterexamples`.
-/

namespace LRA.Pilot.OrderBounds

open LRA.VolumeI.Order

universe u v

/-- Under a total order, a failed comparison converts to a reverse strict
witness: `left` is not related below `right` exactly when `right` is strictly
below `left`.  Equivalently, totality supplies the reverse comparison and
reflexivity with antisymmetry excludes equality and the forward comparison.

Logical form:

```lean
¬ relation left right ↔ StrictPart relation right left
```
-/
theorem NotRelatedIffReverseStrictOfTotalOrder
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsTotalOrder : TotalOrder relation)
    (left right : Alpha) :
    ¬ relation left right ↔ StrictPart relation right left := by
  obtain ⟨⟨reflexive, antisymmetric, _⟩, total⟩ := relationIsTotalOrder
  constructor
  · intro notLeftBelowRight
    have rightBelowLeft : relation right left :=
      (total left right).resolve_left notLeftBelowRight
    refine ⟨rightBelowLeft, ?_⟩
    intro rightEqualsLeft
    apply notLeftBelowRight
    rw [rightEqualsLeft]
    exact reflexive left
  · intro strictWitness leftBelowRight
    exact strictWitness.2
      (antisymmetric right left strictWitness.1 leftBelowRight)

/-- Under a total order on the poset carrier, upper-bound failure converts to
its strict form: the candidate fails to be an upper bound exactly when some
member of the subset is strictly above it.

Logical form:

```lean
¬ UpperBound poset subset candidate ↔
  ∃ witness : poset.Carrier,
    witness ∈ subset ∧
      StrictPart poset.NonStrictOrder candidate witness
```
-/
theorem NotUpperBoundIffStrictWitnessOfTotal
    (poset : Poset)
    (totality : LRA.VolumeI.Relations.Total poset.NonStrictOrder)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) :
    ¬ UpperBound poset subset candidate ↔
      ∃ witness : poset.Carrier,
        witness ∈ subset ∧
          StrictPart poset.NonStrictOrder candidate witness := by
  have relationIsTotalOrder : TotalOrder poset.NonStrictOrder :=
    ⟨poset.NonStrictOrderIsPartialOrder, totality⟩
  rw [NotUpperBoundIffUpperBoundFailure]
  constructor
  · intro failure
    obtain ⟨witness, witnessInSubset, witnessNotBelow⟩ := failure
    exact ⟨witness, witnessInSubset,
      (NotRelatedIffReverseStrictOfTotalOrder relationIsTotalOrder
        witness candidate).mp witnessNotBelow⟩
  · intro strictWitness
    obtain ⟨witness, witnessInSubset, candidateStrictlyBelow⟩ := strictWitness
    exact ⟨witness, witnessInSubset,
      (NotRelatedIffReverseStrictOfTotalOrder relationIsTotalOrder
        witness candidate).mpr candidateStrictlyBelow⟩

/-- Under a total order on the poset carrier, the supremum failure modes take
their textbook strict form: the candidate fails to be the least upper bound
exactly when some member is strictly above it, or some upper bound is
strictly below it.

Logical form:

```lean
¬ LeastUpperBound poset subset candidate ↔
  (∃ witness : poset.Carrier,
    witness ∈ subset ∧
      StrictPart poset.NonStrictOrder candidate witness) ∨
  (∃ competitor : poset.Carrier,
    UpperBound poset subset competitor ∧
      StrictPart poset.NonStrictOrder competitor candidate)
```
-/
theorem NotLeastUpperBoundIffStrictFailureOfTotal
    (poset : Poset)
    (totality : LRA.VolumeI.Relations.Total poset.NonStrictOrder)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) :
    ¬ LeastUpperBound poset subset candidate ↔
      (∃ witness : poset.Carrier,
        witness ∈ subset ∧
          StrictPart poset.NonStrictOrder candidate witness) ∨
      (∃ competitor : poset.Carrier,
        UpperBound poset subset competitor ∧
          StrictPart poset.NonStrictOrder competitor candidate) := by
  have relationIsTotalOrder : TotalOrder poset.NonStrictOrder :=
    ⟨poset.NonStrictOrderIsPartialOrder, totality⟩
  rw [NotLeastUpperBoundIffFailure]
  constructor
  · intro failure
    cases failure with
    | inl boundFailure =>
        obtain ⟨witness, witnessInSubset, witnessNotBelow⟩ := boundFailure
        exact Or.inl ⟨witness, witnessInSubset,
          (NotRelatedIffReverseStrictOfTotalOrder relationIsTotalOrder
            witness candidate).mp witnessNotBelow⟩
    | inr sharpnessFailure =>
        obtain ⟨competitor, competitorIsUpperBound, candidateNotBelow⟩ :=
          sharpnessFailure
        exact Or.inr ⟨competitor, competitorIsUpperBound,
          (NotRelatedIffReverseStrictOfTotalOrder relationIsTotalOrder
            candidate competitor).mp candidateNotBelow⟩
  · intro strictFailure
    cases strictFailure with
    | inl strictWitness =>
        obtain ⟨witness, witnessInSubset, candidateStrictlyBelow⟩ :=
          strictWitness
        exact Or.inl ⟨witness, witnessInSubset,
          (NotRelatedIffReverseStrictOfTotalOrder relationIsTotalOrder
            witness candidate).mpr candidateStrictlyBelow⟩
    | inr strictCompetitor =>
        obtain ⟨competitor, competitorIsUpperBound, competitorStrictlyBelow⟩ :=
          strictCompetitor
        exact Or.inr ⟨competitor, competitorIsUpperBound,
          (NotRelatedIffReverseStrictOfTotalOrder relationIsTotalOrder
            candidate competitor).mpr competitorStrictlyBelow⟩

end LRA.Pilot.OrderBounds
