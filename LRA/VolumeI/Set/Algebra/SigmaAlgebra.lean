import LRA.VolumeI.Set.Algebra.BooleanAlgebra

namespace LRA.VolumeI.Set.Algebra

universe u v

/-!
Sigma-rings and sigma-algebras of sets.
-/

/-- A sigma-ring signature adds closure under countable unions. -/
structure SigmaRingSignature extends SetRingSignature where
  countableUnion : (Nat → carrier) → carrier

/-- A sigma-algebra signature combines complements and countable unions. -/
structure SigmaAlgebraSignature extends SetAlgebraSignature where
  countableUnion : (Nat → carrier) → carrier

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

/-- A bundled model of a sigma-ring. -/
structure SigmaRingModel where
  signature : SigmaRingSignature
  laws : SigmaRingLaws signature

/-- A bundled model of a sigma-algebra. -/
structure SigmaAlgebraModel where
  signature : SigmaAlgebraSignature
  laws : SigmaAlgebraLaws signature

namespace SigmaRingSignature

open LRA.VolumeI.Set.Operations

/-- Build a sigma-ring signature from public operations with both Boolean and
indexed structure. -/
def fromBooleanIndexedOperations
    (operations : BooleanIndexedSetOperations.{u, v})
    (collection : Collection operations.SetObject) : SigmaRingSignature where
  carrier := operations.SetObject
  IsMember := collection
  empty := operations.empty
  union := operations.union
  intersection := operations.intersection
  difference := operations.difference
  symmetricDifference := operations.symmetricDifference
  countableUnion := operations.countableUnion

end SigmaRingSignature

namespace SigmaAlgebraSignature

open LRA.VolumeI.Set.Operations

/-- Build a sigma-algebra signature from public operations with both Boolean
and indexed structure. -/
def fromBooleanIndexedOperations
    (operations : BooleanIndexedSetOperations.{u, v})
    (collection : Collection operations.SetObject) : SigmaAlgebraSignature where
  carrier := operations.SetObject
  IsMember := collection
  empty := operations.empty
  universal := operations.universal
  union := operations.union
  intersection := operations.intersection
  complement := operations.complement
  difference := operations.difference
  symmetricDifference := operations.symmetricDifference
  countableUnion := operations.countableUnion

end SigmaAlgebraSignature

end LRA.VolumeI.Set.Algebra
