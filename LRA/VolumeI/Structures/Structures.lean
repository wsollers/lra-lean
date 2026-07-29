import LRA.VolumeI.Operations.Laws

namespace LRA.VolumeI.Algebra
namespace Structures

universe u

/-- A carrier equipped with one binary operation. -/
structure Magma where
  carrier : LRA.VolumeI.Set.LRACarrier
  operation : Operations.BinaryOperation carrier

/-- A semigroup is a magma whose operation is associative. -/
structure Semigroup extends Magma where
  operation_associative : Associative operation

/-- A monoid is a semigroup with a two-sided identity element. -/
structure Monoid extends Semigroup where
  identityElement : carrier
  identity_law : Identity operation identityElement

/-- A group is a monoid with a two-sided inverse operation. -/
structure Group extends Monoid where
  inverseOperation : Operations.UnaryOperation carrier
  inverse_law : Inverse operation identityElement inverseOperation

/-- A commutative monoid is a monoid whose operation is commutative. -/
structure CommutativeMonoid extends Monoid where
  operation_commutative : Commutative operation

/-- A semiring-like structure with addition, multiplication, zero, and one. -/
structure Semiring where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : carrier
  one : carrier
  add : Operations.BinaryOperation carrier
  mul : Operations.BinaryOperation carrier
  add_associative : Associative add
  add_commutative : Commutative add
  zero_add_identity : Identity add zero
  mul_associative : Associative mul
  one_mul_identity : Identity mul one
  mul_distributes_over_add : Distributive mul add
  zero_mul_absorbing : Absorbing mul zero

/-- A ring-like structure with additive inverses and multiplication. -/
structure Ring extends Semiring where
  neg : Operations.UnaryOperation carrier
  additive_inverse : Inverse add zero neg

end Structures
end LRA.VolumeI.Algebra
