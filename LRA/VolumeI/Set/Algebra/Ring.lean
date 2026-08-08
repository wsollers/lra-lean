import LRA.VolumeI.Set.Algebra.Closure

namespace LRA.VolumeI.Set.Algebra

universe u v

/-!
Ring-of-sets signatures and laws.
-/

/-- A set-ring signature keeps the finite-union and relative-complement vocabulary. -/
structure SetRingSignature where
  carrier : Type u
  IsMember : carrier → Prop
  empty : carrier
  union : carrier → carrier → carrier
  intersection : carrier → carrier → carrier
  difference : carrier → carrier → carrier
  symmetricDifference : carrier → carrier → carrier

/-- Closure laws for a ring of sets. -/
structure SetRingLaws (signature : SetRingSignature) : Prop where
  EmptyIsMember : signature.IsMember signature.empty
  UnionIsMember :
    ∀ left right, signature.IsMember left → signature.IsMember right →
      signature.IsMember (signature.union left right)
  IntersectionIsMember :
    ∀ left right, signature.IsMember left → signature.IsMember right →
      signature.IsMember (signature.intersection left right)
  DifferenceIsMember :
    ∀ left right, signature.IsMember left → signature.IsMember right →
      signature.IsMember (signature.difference left right)
  SymmetricDifferenceIsMember :
    ∀ left right, signature.IsMember left → signature.IsMember right →
      signature.IsMember (signature.symmetricDifference left right)

/-- A bundled model of a ring of sets. -/
structure SetRingModel where
  signature : SetRingSignature
  laws : SetRingLaws signature

namespace SetRingSignature

open LRA.VolumeI.Set.Operations

/-- Build a set-ring signature from public operations and a chosen collection
of admissible set-objects. -/
def fromBooleanOperations
    (operations : BooleanSetOperations.{u, v})
    (collection : Collection operations.SetObject) : SetRingSignature where
  carrier := operations.SetObject
  IsMember := collection
  empty := operations.empty
  union := operations.union
  intersection := operations.intersection
  difference := operations.difference
  symmetricDifference := operations.symmetricDifference

end SetRingSignature

end LRA.VolumeI.Set.Algebra
