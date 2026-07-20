import LRA.Foundation.Algebra.Laws

namespace LRA.Foundation
namespace Algebra

universe u

structure Magma where
  carrier : LRACarrier
  operation : BinaryOperation carrier

structure Semigroup extends Magma where
  operation_associative : associative operation

structure Monoid extends Semigroup where
  identity_element : carrier
  identity_is_left_identity : leftIdentity operation identity_element
  identity_is_right_identity : rightIdentity operation identity_element

structure CommutativeMonoid extends Monoid where
  operation_commutative : commutative operation

structure Group extends Monoid where
  inverse : UnaryOperation carrier
  inverse_is_left_inverse : leftInverse operation identity_element inverse
  inverse_is_right_inverse : rightInverse operation identity_element inverse

structure AbelianGroup extends Group where
  operation_commutative : commutative operation

structure SemiringLike where
  carrier : LRACarrier
  zero : carrier
  one : carrier
  add : BinaryOperation carrier
  mul : BinaryOperation carrier
  add_associative : associative add
  add_commutative : commutative add
  zero_is_left_add_identity : leftIdentity add zero
  zero_is_right_add_identity : rightIdentity add zero
  mul_associative : associative mul
  one_is_left_mul_identity : leftIdentity mul one
  one_is_right_mul_identity : rightIdentity mul one
  zero_is_left_mul_absorbing : leftAbsorbing mul zero
  zero_is_right_mul_absorbing : rightAbsorbing mul zero
  mul_left_distributes_over_add : leftDistributive mul add
  mul_right_distributes_over_add : rightDistributive mul add

structure RingLike extends SemiringLike where
  neg : UnaryOperation carrier
  neg_is_left_add_inverse : leftInverse add zero neg
  neg_is_right_add_inverse : rightInverse add zero neg

structure CommutativeRingLike extends RingLike where
  mul_commutative : commutative mul

end Algebra
end LRA.Foundation
