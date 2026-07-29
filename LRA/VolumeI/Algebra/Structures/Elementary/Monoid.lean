import LRA.VolumeI.Algebra.Structures.Elementary.Semigroup

namespace LRA.VolumeI.Algebra.Structures.Elementary

/-- A monoid is a semigroup with a two-sided identity element. -/
structure Monoid extends Semigroup where
  IdentityElement : Carrier
  IdentityLaw : LRA.VolumeI.Operations.Identity Operation IdentityElement

/-- A commutative monoid is a monoid whose operation is commutative. -/
structure CommutativeMonoid extends Monoid where
  OperationCommutative : LRA.VolumeI.Operations.Commutative Operation

end LRA.VolumeI.Algebra.Structures.Elementary
