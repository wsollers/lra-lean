import LRA.VolumeI.Identity.Axioms
import LRA.VolumeI.Set.LRASet.LRASet

/-!
Contract home for extensional equality.
-/

namespace LRA.VolumeI.Identity

universe u

/-- Predicate-set extensionality, exposed from the identity layer. -/
theorem ExtensionalEqualityForPredicateSets
    {Alpha : LRA.VolumeI.Set.LRACarrier}
    {Left Right : LRA.VolumeI.Set.LRASet Alpha}
    (SameMembers :
      ∀ Element,
        LRA.VolumeI.Set.LRASet.Member Element Left ↔
          LRA.VolumeI.Set.LRASet.Member Element Right) :
    Left = Right :=
  LRA.VolumeI.Set.LRASet.Extensionality SameMembers

end LRA.VolumeI.Identity
