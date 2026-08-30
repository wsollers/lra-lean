import LRA.Operation.Addition.Realization
import LRA.Operation.Laws.Associative.Definition
import LRA.Operation.Laws.Commutative.Definition
import LRA.Operation.Laws.Identity.Definition
import LRA.Operation.Laws.Idempotent.Definition
import LRA.Operation.Laws.Inverse.Definition

namespace LRA.Operation.Addition

open LRA.Operation

universe u

/-- Baseline unary addition-law export package. Mixed arithmetic laws are deferred. -/
structure BaseLawExports (Carrier : Type u) where
  realization : Realization Carrier
  associative : LRA.Operation.Laws.Associative.Associative realization.spec.add
  commutative : LRA.Operation.Laws.Commutative.Commutative realization.spec.add

/-- Addition identity export package using the canonical identity predicate. -/
structure IdentityLawExports (Carrier : Type u) where
  base : BaseLawExports Carrier
  identity : Carrier
  twoSidedIdentity :
    LRA.Operation.Laws.Identity.TwoSidedIdentity base.realization.spec.add identity

/-- Addition inverse export package using the canonical inverse predicate. -/
structure InverseLawExports (Carrier : Type u) where
  identityLaws : IdentityLawExports Carrier
  inverse : UnaryEndoOperation Carrier
  twoSidedInverse :
    LRA.Operation.Laws.Inverse.TwoSidedInverse
      identityLaws.base.realization.spec.add
      identityLaws.identity
      inverse

/-- Optional addition idempotence export for later non-scalar consumers. -/
structure IdempotentLawExports (Carrier : Type u) where
  realization : Realization Carrier
  idempotent : LRA.Operation.Laws.Idempotent.Idempotent realization.spec.add

/-- Phase 2 baseline name for the law bundle exported by generic addition. -/
abbrev LawExports := BaseLawExports

end LRA.Operation.Addition
