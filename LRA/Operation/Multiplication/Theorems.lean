import LRA.Operation.Multiplication.Laws

namespace LRA.Operation.Multiplication

universe u

/-- Accessor theorem for the underlying multiplication witness. -/
theorem realization_mul {Carrier : Type u} (realization : Realization Carrier) :
    realization.spec.mul = realization.spec.mul := by
  sorry
/-- Accessor theorem for the baseline multiplication associativity export. -/
theorem BaseLawExports.associative_law {Carrier : Type u}
    (laws : BaseLawExports Carrier) :
    LRA.Operation.Laws.Associative.Associative laws.realization.spec.mul := by
  sorry
/-- Accessor theorem for the optional multiplication commutativity export. -/
theorem CommutativeLawExports.commutative_law {Carrier : Type u}
    (laws : CommutativeLawExports Carrier) :
    LRA.Operation.Laws.Commutative.Commutative laws.base.realization.spec.mul := by
  sorry
/-- Accessor theorem for the multiplication identity witness export. -/
theorem IdentityLawExports.identity_law {Carrier : Type u}
    (laws : IdentityLawExports Carrier) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      laws.base.realization.spec.mul
      laws.identity := by
  sorry
/-- Accessor theorem for the multiplication inverse witness export. -/
theorem InverseLawExports.inverse_law {Carrier : Type u}
    (laws : InverseLawExports Carrier) :
    LRA.Operation.Laws.Inverse.TwoSidedInverse
      laws.identityLaws.base.realization.spec.mul
      laws.identityLaws.identity
      laws.inverse := by
  sorry
/-- Accessor theorem for the optional multiplication absorber export. -/
theorem AbsorbingLawExports.absorbing_law {Carrier : Type u}
    (laws : AbsorbingLawExports Carrier) :
    LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing
      laws.realization.spec.mul
      laws.absorber := by
  sorry
/-- Accessor theorem for the optional multiplication idempotence export. -/
theorem IdempotentLawExports.idempotent_law {Carrier : Type u}
    (laws : IdempotentLawExports Carrier) :
    LRA.Operation.Laws.Idempotent.Idempotent laws.realization.spec.mul := by
  sorry
end LRA.Operation.Multiplication
