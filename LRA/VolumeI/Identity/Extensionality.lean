import LRA.VolumeI.Identity.Axioms
import LRA.VolumeI.Set.Set

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
        LRA.VolumeI.Set.LRASet.member Element Left ↔
          LRA.VolumeI.Set.LRASet.member Element Right) :
    Left = Right :=
  LRA.VolumeI.Set.LRASet.extensionality SameMembers

end LRA.VolumeI.Identity
