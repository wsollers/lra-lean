import LRA.VolumeI.Set.Operations.BasicSetOperations

/-!
Union laws for predicate-sets.
-/

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet
open LRA.VolumeI.Set.Operations.BasicSetOperations

/-- Binary union of predicate-sets is commutative. -/
theorem UnionCommutative {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Union Left Right = Union Right Left := by
  apply Extensionality
  intro x
  apply Iff.intro
  · intro xInLUR
    cases xInLUR with
    | inl xInL =>
      apply Or.inr
      exact xInL
    | inr xInR =>
      apply Or.inl
      exact xInR
  · intro xInRUL
    cases xInRUL with
    | inl xInR =>
      apply Or.inr
      exact xInR
    | inr xInL =>
      apply Or.inl
      exact xInL

/-- Binary union of predicate-sets is associative. -/
theorem UnionAssociative {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Union (Union Left Middle) Right = Union Left (Union Middle Right) := by
  apply Extensionality
  intro x
  apply Iff.intro
  · intro xInLUMR
    cases xInLUMR with
    | inl xInLM =>
      cases xInLM with
      | inl xInL =>
        apply Or.inl
        exact xInL
      | inr xInM =>
        apply Or.inr
        apply Or.inl
        exact xInM
    | inr xInR =>
      apply Or.inr
      apply Or.inr
      exact xInR
  · intro xInLMUR
    cases xInLMUR with
    | inl xInL =>
      apply Or.inl
      apply Or.inl
      exact xInL
    | inr xInMR =>
      cases xInMR with
      | inl xInM =>
        apply Or.inl
        apply Or.inr
        exact xInM
      | inr xInR =>
        apply Or.inr
        exact xInR

/-- Union with the empty set on the right is itself. -/
theorem UnionEmpty {Alpha : LRACarrier}
    (Left : LRASet Alpha) :
    Union Left (Empty Alpha) = Left := by
  apply Extensionality
  intro x
  apply Iff.intro
  · intro xInLUE
    cases xInLUE with
    | inl xInL =>
      exact xInL
    | inr xInE =>
      contradiction
  · intro xInL
    apply Or.inl
    exact xInL

/-- Union with the empty set on the left is itself. -/
theorem EmptyUnion {Alpha : LRACarrier}
    (Right : LRASet Alpha) :
    Union (Empty Alpha) Right = Right := by
  sorry

/-- Union with the universal set on the right is universal. -/
theorem UnionUniversal {Alpha : LRACarrier}
    (Left : LRASet Alpha) :
    Union Left (Universal Alpha) = Universal Alpha := by
  sorry

/-- Union with the universal set on the left is universal. -/
theorem UniversalUnion {Alpha : LRACarrier}
    (Right : LRASet Alpha) :
    Union (Universal Alpha) Right = Universal Alpha := by
  sorry

/-- Binary union of a predicate-set with itself is itself. -/
theorem UnionIdempotent {Alpha : LRACarrier}
    (Left : LRASet Alpha) :
    Union Left Left = Left := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
