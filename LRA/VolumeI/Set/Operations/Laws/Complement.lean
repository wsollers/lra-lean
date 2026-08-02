import LRA.VolumeI.Set.Operations.BasicSetOperations

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

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
