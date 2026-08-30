import LRA.Operation.Multiplication.Realization
import LRA.Operation.Laws.Absorbing.Definition
import LRA.Operation.Laws.Associative.Definition
import LRA.Operation.Laws.Commutative.Definition
import LRA.Operation.Laws.Identity.Definition
import LRA.Operation.Laws.Idempotent.Definition
import LRA.Operation.Laws.Inverse.Definition

namespace LRA.Operation.Multiplication

open LRA.Operation

universe u

/-- Baseline unary multiplication-law export package. Mixed arithmetic laws are deferred. -/
structure BaseLawExports (Carrier : Type u) where
  realization : Realization Carrier
  associative : LRA.Operation.Laws.Associative.Associative realization.spec.mul

/-- Optional multiplication commutativity export. -/
structure CommutativeLawExports (Carrier : Type u) where
  base : BaseLawExports Carrier
  commutative : LRA.Operation.Laws.Commutative.Commutative base.realization.spec.mul

/-- Multiplication identity export package using the canonical identity predicate. -/
structure IdentityLawExports (Carrier : Type u) where
  base : BaseLawExports Carrier
  identity : Carrier
  twoSidedIdentity :
    LRA.Operation.Laws.Identity.TwoSidedIdentity base.realization.spec.mul identity

/-- Multiplication inverse export package using the canonical inverse predicate. -/
structure InverseLawExports (Carrier : Type u) where
  identityLaws : IdentityLawExports Carrier
  inverse : UnaryEndoOperation Carrier
  twoSidedInverse :
    LRA.Operation.Laws.Inverse.TwoSidedInverse
      identityLaws.base.realization.spec.mul
      identityLaws.identity
      inverse

/-- Optional multiplication absorber export for unary zero-style witnesses. -/
structure AbsorbingLawExports (Carrier : Type u) where
  realization : Realization Carrier
  absorber : Carrier
  twoSidedAbsorbing :
    LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing realization.spec.mul absorber

/-- Optional multiplication idempotence export for later non-scalar consumers. -/
structure IdempotentLawExports (Carrier : Type u) where
  realization : Realization Carrier
  idempotent : LRA.Operation.Laws.Idempotent.Idempotent realization.spec.mul

/-- Phase 2 baseline name for the law bundle exported by generic multiplication. -/
abbrev LawExports := BaseLawExports

end LRA.Operation.Multiplication
