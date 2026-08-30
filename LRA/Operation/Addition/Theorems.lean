import LRA.Operation.Addition.Laws

namespace LRA.Operation.Addition

universe u

/-- Accessor theorem for the underlying addition witness. -/
theorem realization_add {Carrier : Type u} (realization : Realization Carrier) :
    realization.spec.add = realization.spec.add := by
  rfl

/-- Accessor theorem for the baseline addition associativity export. -/
theorem BaseLawExports.associative_law {Carrier : Type u}
    (laws : BaseLawExports Carrier) :
    LRA.Operation.Laws.Associative.Associative laws.realization.spec.add :=
  laws.associative

/-- Accessor theorem for the baseline addition commutativity export. -/
theorem BaseLawExports.commutative_law {Carrier : Type u}
    (laws : BaseLawExports Carrier) :
    LRA.Operation.Laws.Commutative.Commutative laws.realization.spec.add :=
  laws.commutative

/-- Accessor theorem for the addition identity witness export. -/
theorem IdentityLawExports.identity_law {Carrier : Type u}
    (laws : IdentityLawExports Carrier) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      laws.base.realization.spec.add
      laws.identity :=
  laws.twoSidedIdentity

/-- Accessor theorem for the addition inverse witness export. -/
theorem InverseLawExports.inverse_law {Carrier : Type u}
    (laws : InverseLawExports Carrier) :
    LRA.Operation.Laws.Inverse.TwoSidedInverse
      laws.identityLaws.base.realization.spec.add
      laws.identityLaws.identity
      laws.inverse :=
  laws.twoSidedInverse

/-- Accessor theorem for the optional addition idempotence export. -/
theorem IdempotentLawExports.idempotent_law {Carrier : Type u}
    (laws : IdempotentLawExports Carrier) :
    LRA.Operation.Laws.Idempotent.Idempotent laws.realization.spec.add :=
  laws.idempotent

end LRA.Operation.Addition
