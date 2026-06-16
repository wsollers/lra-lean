import LRA.VolumeI.Algebra.Laws

namespace LRA.VolumeI.Algebra.Bundles

open LRA.VolumeI.Algebra.Operations
open LRA.VolumeI.Algebra.Laws

structure CommutativeMonoid where
  Carrier : Type
  Operation : BinaryOperation Carrier
  IdentityElement : Carrier
  OperationIsAssociative : IsAssociative Operation
  OperationIsCommutative : IsCommutative Operation
  OperationHasIdentity : IsIdentity Operation IdentityElement

structure CommutativeGroup where
  Carrier : Type
  Operation : BinaryOperation Carrier
  IdentityElement : Carrier
  InverseOperation : UnaryOperation Carrier
  OperationIsAssociative : IsAssociative Operation
  OperationIsCommutative : IsCommutative Operation
  OperationHasIdentity : IsIdentity Operation IdentityElement
  InverseLawHolds : IsInverse Operation IdentityElement InverseOperation

structure CommutativeRing where
  Carrier : Type
  Addition : BinaryOperation Carrier
  Multiplication : BinaryOperation Carrier
  AdditiveInverse : UnaryOperation Carrier
  Zero : Carrier
  One : Carrier
  AdditionIsAssociative : IsAssociative Addition
  AdditionIsCommutative : IsCommutative Addition
  AdditionHasIdentity : IsIdentity Addition Zero
  AdditiveInverseLawHolds : IsInverse Addition Zero AdditiveInverse
  MultiplicationIsAssociative : IsAssociative Multiplication
  MultiplicationIsCommutative : IsCommutative Multiplication
  MultiplicationHasIdentity : IsIdentity Multiplication One
  MultiplicationDistributesOverAddition : DistributesOver Multiplication Addition

end LRA.VolumeI.Algebra.Bundles
