import LRA.VolumeI.Set.Algebra.Ring

namespace LRA.VolumeI.Set.Algebra

universe u v

/-!
Boolean-style algebras of sets.
-/

/-- An abstract signature for Boolean-style operations on a carrier of set-objects. -/
structure SetAlgebraSignature where
  carrier : Type u
  IsMember : carrier → Prop
  empty : carrier
  universal : carrier
  union : carrier → carrier → carrier
  intersection : carrier → carrier → carrier
  complement : carrier → carrier
  difference : carrier → carrier → carrier
  symmetricDifference : carrier → carrier → carrier

namespace SetAlgebraSignature

/-- Forget an algebra signature to its set-ring operations. -/
def toSetRingSignature (signature : SetAlgebraSignature) : SetRingSignature where
  carrier := signature.carrier
  IsMember := signature.IsMember
  empty := signature.empty
  union := signature.union
  intersection := signature.intersection
  difference := signature.difference
  symmetricDifference := signature.symmetricDifference

end SetAlgebraSignature

/-- Closure laws for an algebra of sets. -/
structure SetAlgebraLaws (signature : SetAlgebraSignature) : Prop where
  EmptyIsMember : signature.IsMember signature.empty
  UniversalIsMember : signature.IsMember signature.universal
  ComplementIsMember :
    ∀ setObject, signature.IsMember setObject → signature.IsMember (signature.complement setObject)
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

/-- A bundled model of an algebra of sets. -/
structure SetAlgebraModel where
  signature : SetAlgebraSignature
  laws : SetAlgebraLaws signature

namespace SetAlgebraSignature

open LRA.VolumeI.Set.Operations

/-- Build a set-algebra signature from Boolean public operations and a chosen
collection of admissible set-objects. -/
def fromBooleanOperations
    (operations : BooleanSetOperations.{u, v})
    (collection : Collection operations.SetObject) : SetAlgebraSignature where
  carrier := operations.SetObject
  IsMember := collection
  empty := operations.empty
  universal := operations.universal
  union := operations.union
  intersection := operations.intersection
  complement := operations.complement
  difference := operations.difference
  symmetricDifference := operations.symmetricDifference

end SetAlgebraSignature

end LRA.VolumeI.Set.Algebra
