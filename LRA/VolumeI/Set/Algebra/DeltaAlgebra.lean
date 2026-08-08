import LRA.VolumeI.Set.Algebra.Ring

namespace LRA.VolumeI.Set.Algebra

/-!
Delta-algebras of sets.

This file reserves the countable-intersection analogue of the sigma-ring
interface. The precise theorem development can grow here without crowding the
ordinary ring and sigma-algebra files.
-/

/-- A delta-ring signature adds closure under countable intersections. -/
structure DeltaRingSignature extends SetRingSignature where
  countableIntersection : (Nat → carrier) → carrier

/-- Closure laws for a delta-ring. -/
structure DeltaRingLaws (signature : DeltaRingSignature) : Prop
    extends SetRingLaws signature.toSetRingSignature where
  CountableIntersectionIsMember :
    ∀ family : Nat → signature.carrier,
      (∀ index, signature.IsMember (family index)) →
        signature.IsMember (signature.countableIntersection family)

/-- A bundled model of a delta-ring. -/
structure DeltaRingModel where
  signature : DeltaRingSignature
  laws : DeltaRingLaws signature

end LRA.VolumeI.Set.Algebra
