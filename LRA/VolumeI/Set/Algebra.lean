import LRA.VolumeI.Set.LRASet.LRASet

namespace LRA.VolumeI.Set.Algebra

/-- An abstract signature for Boolean-style operations on a carrier of set-objects. -/
structure SetAlgebraSignature where
  carrier : LRA.VolumeI.Set.LRACarrier
  IsMember : carrier → Prop
  empty : carrier
  universal : carrier
  union : carrier → carrier → carrier
  intersection : carrier → carrier → carrier
  complement : carrier → carrier
  difference : carrier → carrier → carrier
  symmetricDifference : carrier → carrier → carrier

/-- A set-ring signature keeps the finite-union and relative-complement vocabulary. -/
structure SetRingSignature where
  carrier : LRA.VolumeI.Set.LRACarrier
  IsMember : carrier → Prop
  empty : carrier
  union : carrier → carrier → carrier
  intersection : carrier → carrier → carrier
  difference : carrier → carrier → carrier
  symmetricDifference : carrier → carrier → carrier

/-- A sigma-ring signature adds closure under countable unions. -/
structure SigmaRingSignature extends SetRingSignature where
  countableUnion : (Nat → carrier) → carrier

/-- A sigma-algebra signature combines complements and countable unions. -/
structure SigmaAlgebraSignature extends SetAlgebraSignature where
  countableUnion : (Nat → carrier) → carrier

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

namespace SigmaAlgebraSignature

/-- Forget a sigma-algebra signature to its sigma-ring operations. -/
def toSigmaRingSignature (signature : SigmaAlgebraSignature) : SigmaRingSignature where
  carrier := signature.carrier
  IsMember := signature.IsMember
  empty := signature.empty
  union := signature.union
  intersection := signature.intersection
  difference := signature.difference
  symmetricDifference := signature.symmetricDifference
  countableUnion := signature.countableUnion

end SigmaAlgebraSignature

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

/-- Closure laws for a sigma-ring. -/
structure SigmaRingLaws (signature : SigmaRingSignature) : Prop
    extends SetRingLaws signature.toSetRingSignature where
  CountableUnionIsMember :
    ∀ family : Nat → signature.carrier,
      (∀ index, signature.IsMember (family index)) →
        signature.IsMember (signature.countableUnion family)

/-- Closure laws for a sigma-algebra. -/
structure SigmaAlgebraLaws (signature : SigmaAlgebraSignature) : Prop
    extends SetAlgebraLaws signature.toSetAlgebraSignature where
  CountableUnionIsMember :
    ∀ family : Nat → signature.carrier,
      (∀ index, signature.IsMember (family index)) →
        signature.IsMember (signature.countableUnion family)

structure SetAlgebraModel where
  signature : SetAlgebraSignature
  laws : SetAlgebraLaws signature

structure SetRingModel where
  signature : SetRingSignature
  laws : SetRingLaws signature

structure SigmaRingModel where
  signature : SigmaRingSignature
  laws : SigmaRingLaws signature

structure SigmaAlgebraModel where
  signature : SigmaAlgebraSignature
  laws : SigmaAlgebraLaws signature

end LRA.VolumeI.Set.Algebra
