import LRA.VolumeI.Set.Algebra.CollectionAlgebra
import LRA.VolumeI.Set.Implementations.ZFC.PowerSet

namespace LRA.VolumeI.Set.Implementations.ZFC

namespace CollectionAlgebraAdapter

open LRA.VolumeI.Set.Algebra.Collection

/-!
Adapters from a single-sorted ZFC-style backend into the parts of the generic
collection-algebra surface that do not require a global universal set.
-/

/-- Nonempty set predicate for a ZFC-style native backend. -/
def nonemptySetPredicate (native : NativeSetOperations) :
    NonemptySetPredicate (collectionSetOperations native) :=
  fun setObject => ∃ element, native.member element setObject

/-- ZFC-style native nonempty predicates satisfy the generic nonempty membership law. -/
theorem nonemptySetLaws (native : NativeSetOperations) :
    NonemptySetLaws
      (collectionSetOperations native)
      (nonemptySetPredicate native) := by
  sorry

/-- ZFC-style relative-complement collections satisfy the generic transport laws. -/
theorem relativeComplementCollectionLaws (native : NativeSetOperations) :
    RelativeComplementCollectionLaws (collectionSetOperations native) := by
  sorry

end CollectionAlgebraAdapter

end LRA.VolumeI.Set.Implementations.ZFC
