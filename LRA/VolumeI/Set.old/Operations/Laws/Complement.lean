import LRA.VolumeI.Set.Operations.BasicSetOperations

/-!
Complement laws for predicate-sets.
-/

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet
open LRA.VolumeI.Set.Operations.BasicSetOperations

/-- The complement of the complement of a predicate-set is itself. -/
theorem DoubleComplement {Alpha : LRACarrier}
    (Left : LRASet Alpha) :
    Complement (Complement Left) = Left := by
  sorry

/-- The complement of the empty predicate-set is universal. -/
theorem ComplementEmpty {Alpha : LRACarrier} :
    Complement (Empty Alpha) = Universal Alpha := by
  sorry

/-- The complement of the universal predicate-set is empty. -/
theorem ComplementUniversal {Alpha : LRACarrier} :
    Complement (Universal Alpha) = Empty Alpha := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
