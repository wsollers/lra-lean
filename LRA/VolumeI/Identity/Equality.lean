import LRA.VolumeI.Identity.Axioms

/-!
Contract home for equality laws.
-/

namespace LRA.VolumeI.Identity

universe u

/-- Equality is the canonical equivalence relation on every carrier. -/
theorem EqualityIsEquivalenceRelation (Carrier : Type u) :
    LRA.VolumeI.Relations.Equivalence (EqualityRelation Carrier) :=
  EqualityRelationIsEquivalence Carrier

end LRA.VolumeI.Identity
