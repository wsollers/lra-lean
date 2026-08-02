import LRA.VolumeI.Set.Operations.Laws.Complement
import LRA.VolumeI.Set.Operations.Laws.Intersection

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

/-- Let `A` and `B` be sets. `A \ B = A ∩ Bᶜ`; equivalently, for every element `x`,
`x ∈ A \ B` iff `x ∈ A ∩ Bᶜ`. -/
theorem DifferenceAsIntersectionComplement {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Difference Left Right = Intersection Left (Complement Right) := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInDifference
    have elementInIntersection : Member Element (Intersection Left (Complement Right)) := by
      exact ⟨elementInDifference.left, elementInDifference.right⟩
    exact elementInIntersection
  · intro elementInIntersection
    have elementInDifference : Member Element (Difference Left Right) := by
      exact ⟨elementInIntersection.left, elementInIntersection.right⟩
    exact elementInDifference

/-- Let `A` be a set. `A \ ∅ = A`; equivalently, for every element `x`,
`x ∈ A \ ∅` iff `x ∈ A`. -/
theorem DifferenceEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left (Empty Alpha) = Left := by
  apply LRASet.Extensionality
  intro Element
  constructor
  . intro elementInDifference
    exact elementInDifference.left
  . intro elementInLeft
    have elementNotInEmpty : ¬ Member Element (Empty Alpha) := by
      intro elementInEmpty
      exact elementInEmpty
    have elementInDifference : Member Element (Difference Left (Empty Alpha)) := by
      exact ⟨elementInLeft, elementNotInEmpty⟩
    exact elementInDifference


/-- Let `A` be a set. `∅ \ A = ∅`; equivalently, for every element `x`,
`x ∈ ∅ \ A` iff `x ∈ ∅`. -/
theorem EmptyDifference {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Difference (Empty Alpha) Right = Empty Alpha := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInDifference
    exact elementInDifference.left.elim
  . intro elementInEmpty
    exact elementInEmpty.elim

/-- Let `A` be a set. `A \ U = ∅`; equivalently, for every element `x`,
`x ∈ A \ U` iff `x ∈ ∅`. -/
theorem DifferenceUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left (Universal Alpha) = Empty Alpha := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInDifference
    have elementInUniversal : Member Element (Universal Alpha) := by
      trivial
    exact elementInDifference.right elementInUniversal
  · intro elementInEmpty
    exact elementInEmpty.elim

/-- Let `A` be a set. `U \ A = Aᶜ`; equivalently, for every element `x`,
`x ∈ U \ A` iff `x ∈ Aᶜ`. -/
theorem UniversalDifference {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Difference (Universal Alpha) Right = Complement Right := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInDifference
    have elementInComplement : Member Element (Complement Right) := by
      exact elementInDifference.right
    exact elementInComplement
  · intro elementInComplement
    have elementInUniversal : Member Element (Universal Alpha) := by
      trivial
    have elementInDifference : Member Element (Difference (Universal Alpha) Right) := by
      exact ⟨elementInUniversal, elementInComplement⟩
    exact elementInDifference

/-- Let `A` be a set. `A \ A = ∅`; equivalently, for every element `x`,
`x ∈ A \ A` iff `x ∈ ∅`. -/
theorem DifferenceSelf {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left Left = Empty Alpha := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInDifference
    exact elementInDifference.right elementInDifference.left
  · intro elementInEmpty
    exact elementInEmpty.elim

end LRA.VolumeI.Set.Operations.Laws
