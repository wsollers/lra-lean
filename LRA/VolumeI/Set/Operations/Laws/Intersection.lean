import LRA.VolumeI.Set.Operations.BasicSetOperations

/-!
Intersection laws for predicate-sets.
-/

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet
open LRA.VolumeI.Set.Operations.BasicSetOperations

/-- Binary intersection of predicate-sets is commutative. -/
theorem IntersectionCommutative {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Intersection Left Right = Intersection Right Left := by
  apply Extensionality
  intro x
  apply Iff.intro
  · intro xInLIR
    cases xInLIR with
    | intro xInL xInR =>
      exact ⟨xInR, xInL⟩
  · intro xInRIL
    cases xInRIL with
    | intro xInR xInL =>
      exact ⟨xInL, xInR⟩

/-- Binary intersection of predicate-sets is associative. -/
theorem IntersectionAssociative {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Intersection (Intersection Left Middle) Right =
      Intersection Left (Intersection Middle Right) := by
  apply Extensionality
  intro x
  apply Iff.intro
  · intro xInLMR
    cases xInLMR with
    | intro xInLM xInR =>
      cases xInLM with
      | intro xInL xInM =>
        exact ⟨xInL, ⟨xInM, xInR⟩⟩
  · intro xInLMUR
    cases xInLMUR with
    | intro xInL xInMR =>
      cases xInMR with
      | intro xInM xInR =>
        exact ⟨⟨xInL, xInM⟩, xInR⟩

/-- Intersection with the empty set on the right is empty. -/
theorem IntersectionEmpty {Alpha : LRACarrier}
    (Left : LRASet Alpha) :
    Intersection Left (Empty Alpha) = Empty Alpha := by
  apply Extensionality
  intro x
  apply Iff.intro
  · intro xInLIE
    cases xInLIE with
    | intro _xInL xInE =>
      contradiction
  · intro xInE
    contradiction

/-- Intersection with the empty set on the left is empty. -/
theorem EmptyIntersection {Alpha : LRACarrier}
    (Right : LRASet Alpha) :
    Intersection (Empty Alpha) Right = Empty Alpha := by
  sorry

/-- Intersection with the universal set on the right is itself. -/
theorem IntersectionUniversal {Alpha : LRACarrier}
    (Left : LRASet Alpha) :
    Intersection Left (Universal Alpha) = Left := by
  sorry

/-- Intersection with the universal set on the left is itself. -/
theorem UniversalIntersection {Alpha : LRACarrier}
    (Right : LRASet Alpha) :
    Intersection (Universal Alpha) Right = Right := by
  sorry

/-- Binary intersection of a predicate-set with itself is itself. -/
theorem IntersectionIdempotent {Alpha : LRACarrier}
    (Left : LRASet Alpha) :
    Intersection Left Left = Left := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
