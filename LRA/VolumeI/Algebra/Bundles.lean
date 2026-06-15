-- LRA/VolumeI/Algebra/Bundles.lean
--
-- The algebraic structure spine, as FLAT bundles: carrier + operations +
-- distinguished elements + law certificates as fields. Flat (not `extends`)
-- so every law is visible at every level — the law that holds here is named
-- here. A number system becomes a model by instantiating one of these, with
-- its per-carrier certificates (VolumeII) travelling into the law fields.
--
-- Scope: the three purely-algebraic bundles. The ordered tier
-- (OrderedCommutativeRing → OrderedField → CompleteOrderedField) wires in the
-- order relation from Sets.Relations and the least-upper-bound axiom, and is
-- built in a separate gated pass.

import LRA.VolumeI.Algebra.Laws

namespace LRA.VolumeI.Algebra.Bundles

open LRA.VolumeI.Algebra.Operations
open LRA.VolumeI.Algebra.Laws

/-- A commutative monoid: a carrier with one associative, commutative binary
    operation and a two-sided identity. The model of `+` on ℕ. -/
structure CommutativeMonoid where
  Carrier : Type
  Operation : BinaryOperation Carrier
  IdentityElement : Carrier
  OperationIsAssociative : IsAssociative Operation
  OperationIsCommutative : IsCommutative Operation
  OperationHasIdentity : IsIdentity Operation IdentityElement

/-- A commutative group: a commutative monoid in which every element has an
    inverse under the operation. -/
structure CommutativeGroup where
  Carrier : Type
  Operation : BinaryOperation Carrier
  IdentityElement : Carrier
  InverseOperation : UnaryOperation Carrier
  OperationIsAssociative : IsAssociative Operation
  OperationIsCommutative : IsCommutative Operation
  OperationHasIdentity : IsIdentity Operation IdentityElement
  InverseLawHolds : IsInverse Operation IdentityElement InverseOperation

/-- A commutative ring with unit: an additive commutative group together with
    an associative, commutative multiplication that has a unit and distributes
    over addition. The model of ℤ. -/
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
