import LRA.VolumeI.Set.Operations.BasicSetOperations

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

/-- Let `A` and `B` be sets. Their intersection is commutative: `A ∩ B = B ∩ A`;
equivalently, for every element `x`, `x ∈ A ∩ B` iff `x ∈ B ∩ A`. -/
theorem IntersectionCommutative {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Intersection Left Right = Intersection Right Left := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInLIR
    have elementInRIL : Member Element (Intersection Right Left) := by
      exact ⟨elementInLIR.right, elementInLIR.left⟩
    exact elementInRIL
  · intro elementInRIL
    have elementInLIR : Member Element (Intersection Left Right) := by
      exact ⟨elementInRIL.right, elementInRIL.left⟩
    exact elementInLIR

/-- Let `A`, `B`, and `C` be sets. Their intersection is associative:
`(A ∩ B) ∩ C = A ∩ (B ∩ C)`; equivalently, for every element `x`,
`x ∈ (A ∩ B) ∩ C` iff `x ∈ A ∩ (B ∩ C)`. -/
theorem IntersectionAssociative {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Intersection (Intersection Left Middle) Right =
      Intersection Left (Intersection Middle Right) := by
  apply LRASet.Extensionality
  intro Element
  constructor
  . intro elementInLIM_IR
    have elementInL_IMR : Member Element (Intersection Left (Intersection Middle Right)) := by
      exact ⟨elementInLIM_IR.left.left, ⟨elementInLIM_IR.left.right, elementInLIM_IR.right⟩⟩
    exact elementInL_IMR
  . intro elementInL_IMR
    have elementInLIM_IR : Member Element (Intersection (Intersection Left Middle) Right) := by
      exact ⟨⟨elementInL_IMR.left, elementInL_IMR.right.left⟩, elementInL_IMR.right.right⟩
    exact elementInLIM_IR

/-- Let `A` be a set. Intersecting `A` with the empty set gives the empty set:
`A ∩ ∅ = ∅`; equivalently, for every element `x`, `x ∈ A ∩ ∅` iff `x ∈ ∅`. -/
theorem IntersectionEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left (Empty Alpha) = Empty Alpha := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInLIE
    exact elementInLIE.right.elim
  · intro elementInEmpty
    exact elementInEmpty.elim

/-- Let `A` be a set. Intersecting the empty set with `A` gives the empty set:
`∅ ∩ A = ∅`; equivalently, for every element `x`, `x ∈ ∅ ∩ A` iff `x ∈ ∅`. -/
theorem EmptyIntersection {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Intersection (Empty Alpha) Right = Empty Alpha := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInEIR
    exact elementInEIR.left.elim
  · intro elementInEmpty
    exact elementInEmpty.elim

/-- Let `A` be a set. Intersecting `A` with the universal set gives `A`:
`A ∩ U = A`; equivalently, for every element `x`, `x ∈ A ∩ U` iff `x ∈ A`. -/
theorem IntersectionUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left (Universal Alpha) = Left := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInLUI
    have elementInLeft : Member Element Left := by
      exact elementInLUI.left
    have elementInUniversal : Member Element (Universal Alpha) := by
      exact elementInLUI.right
    exact elementInLeft
  · intro elementInLeft
    have elementInUniversal : Member Element (Universal Alpha) := by
      trivial
    have elementInLUI : Member Element (Intersection Left (Universal Alpha)) := by
      exact ⟨elementInLeft, elementInUniversal⟩
    exact elementInLUI

/-- Let `A` be a set. Intersecting the universal set with `A` gives `A`:
`U ∩ A = A`; equivalently, for every element `x`, `x ∈ U ∩ A` iff `x ∈ A`. -/
theorem UniversalIntersection {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Intersection (Universal Alpha) Right = Right := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInUIR
    have elementInUniversal : Member Element (Universal Alpha) := by
      exact elementInUIR.left
    have elementInRight : Member Element Right := by
      exact elementInUIR.right
    exact elementInRight
  · intro elementInRight
    have elementInUniversal : Member Element (Universal Alpha) := by
      trivial
    have elementInUIR : Member Element (Intersection (Universal Alpha) Right) := by
      exact ⟨elementInUniversal, elementInRight⟩
    exact elementInUIR

/-- Let `A` be a set. Intersecting `A` with itself gives `A`: `A ∩ A = A`;
equivalently, for every element `x`, `x ∈ A ∩ A` iff `x ∈ A`. -/
theorem IntersectionIdempotent {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left Left = Left := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInLIL
    have elementInLeft : Member Element Left := by
      exact elementInLIL.left
    exact elementInLeft
  · intro elementInLeft
    have elementInLIL : Member Element (Intersection Left Left) := by
      exact ⟨elementInLeft, elementInLeft⟩
    exact elementInLIL

end LRA.VolumeI.Set.Operations.Laws
