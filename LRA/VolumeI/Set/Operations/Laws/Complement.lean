import LRA.VolumeI.Set.Operations.BasicSetOperations

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

/-- Let `A` be a set. The complement of the complement of `A` is `A`;
equivalently, for every element `x`, `x ∈ (Aᶜ)ᶜ` iff `x ∈ A`. -/
theorem DoubleComplement {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Complement (Complement Left) = Left := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInDoubleComplement
    by_cases elementInLeft : Member Element Left
    · exact elementInLeft
    · exact False.elim (elementInDoubleComplement elementInLeft)
  · intro elementInLeft
    intro elementInComplement
    exact elementInComplement elementInLeft

/-- Let `A` be the empty set. The complement of the empty set is the universal set;
equivalently, for every element `x`, `x ∈ ∅ᶜ` iff `x ∈ U`. -/
theorem ComplementEmpty {Alpha : LRACarrier} :
    Complement (Empty Alpha) = Universal Alpha := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInComplement
    trivial
  · intro elementInUniversal
    intro elementInEmpty
    exact elementInEmpty


/-- Let `U` be the universal set. The complement of the universal set is the empty set;
equivalently, for every element `x`, `x ∈ Uᶜ` iff `x ∈ ∅`. -/
theorem ComplementUniversal {Alpha : LRACarrier} :
    Complement (Universal Alpha) = Empty Alpha := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInUniversalComplement
    have elementInUniversal : Member Element (Universal Alpha) := by
      trivial
    exact elementInUniversalComplement elementInUniversal
  · intro elementInEmpty
    exact elementInEmpty.elim

end LRA.VolumeI.Set.Operations.Laws
