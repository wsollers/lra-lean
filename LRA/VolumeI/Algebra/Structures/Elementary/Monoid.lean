import LRA.VolumeI.Algebra.Structures.Elementary.Semigroup

namespace LRA.VolumeI.Algebra.Structures.Elementary

/-- A monoid is a semigroup with a two-sided identity element. -/
structure Monoid extends Semigroup where
  identityElement : carrier
  identityLaw : LRA.VolumeI.Operations.Identity operation identityElement

/-- A commutative monoid is a monoid whose operation is commutative. -/
structure CommutativeMonoid extends Monoid where
  operationCommutative : LRA.VolumeI.Operations.Commutative operation

end LRA.VolumeI.Algebra.Structures.Elementary
