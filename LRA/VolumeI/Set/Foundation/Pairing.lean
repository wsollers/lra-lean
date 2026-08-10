import LRA.VolumeI.Set.Foundation.Axioms

universe u

namespace LRA.VolumeI.Set.Foundation

/-!
Pair set existence, uniqueness, and chosen witness.
-/

/-- For any two sets, there exists a pair set containing exactly them. -/
theorem PairSetExist
    {setUniverse : Universe.{u}}
    (pairing : PairingAxiom setUniverse)
    (x1 x2 : setUniverse.SetObject) :
    ∃ pairSet : setUniverse.SetObject,
      IsPairSet setUniverse x1 x2 pairSet := by
  exact pairing x1 x2

/-- Any two pair sets for the same two sets are equal. -/
theorem PairSetUnique
    {setUniverse : Universe.{u}}
    (extensionality : ExtensionalityAxiom setUniverse)
    {x1 x2 leftPair rightPair : setUniverse.SetObject}
    (leftPairIsPairSet : IsPairSet setUniverse x1 x2 leftPair)
    (rightPairIsPairSet : IsPairSet setUniverse x1 x2 rightPair) :
    leftPair = rightPair := by
  apply extensionality
  intro w
  exact Iff.trans (leftPairIsPairSet w) (Iff.symm (rightPairIsPairSet w))

/-- For any two sets, there exists a unique pair set whose members are exactly
those two sets.

This is the source theorem `thm:pairing-output-exists-unique`:
`∀ x1 ∀ x2 ∃! P, ∀ w, w ∈ P ↔ (w = x1 ∨ w = x2)`. -/
theorem PairingOutputExistsUnique
    {setUniverse : Universe.{u}}
    (extensionality : ExtensionalityAxiom setUniverse)
    (pairing : PairingAxiom setUniverse)
    (x1 x2 : setUniverse.SetObject) :
    ExistsUnique (fun pairSet : setUniverse.SetObject =>
      IsPairSet setUniverse x1 x2 pairSet) := by
  rcases pairing x1 x2 with ⟨pairSet, pairSetIsPairSet⟩
  refine ⟨pairSet, pairSetIsPairSet, ?_⟩
  intro otherPairSet otherPairSetIsPairSet
  exact PairSetUnique extensionality otherPairSetIsPairSet pairSetIsPairSet

/-- The pair set of `x1` and `x2`, chosen from the Axiom of Pairing. -/
noncomputable def pairSet
    {setUniverse : Universe.{u}}
    (pairing : PairingAxiom setUniverse)
    (x1 x2 : setUniverse.SetObject) :
    setUniverse.SetObject :=
  Classical.choose (pairing x1 x2)

/-- The chosen pair set has exactly the intended members. -/
theorem pairSet_isPairSet
    {setUniverse : Universe.{u}}
    (pairing : PairingAxiom setUniverse)
    (x1 x2 : setUniverse.SetObject) :
    IsPairSet setUniverse x1 x2 (pairSet pairing x1 x2) := by
  exact Classical.choose_spec (pairing x1 x2)

/-- Every pair set for `x1` and `x2` is equal to the chosen pair set. -/
theorem pairSet_unique
    {setUniverse : Universe.{u}}
    (extensionality : ExtensionalityAxiom setUniverse)
    (pairing : PairingAxiom setUniverse)
    {x1 x2 otherPairSet : setUniverse.SetObject}
    (otherPairSetIsPairSet : IsPairSet setUniverse x1 x2 otherPairSet) :
    otherPairSet = pairSet pairing x1 x2 := by
  exact PairSetUnique extensionality
    otherPairSetIsPairSet
    (pairSet_isPairSet pairing x1 x2)

end LRA.VolumeI.Set.Foundation
