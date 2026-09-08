import LRA.Identity.Constructions.Axiomatic.Axioms.ZeroOrder.Axiom

namespace LRA.Identity.Constructions.Axiomatic.ZeroOrder

/-- The two zero-order axioms package the generic zero-order theory. -/
theorem Theory
    (L : LRA.Identity.Interface.ZeroOrder.LStructure)
    (M : LRA.Identity.Interface.ZeroOrder.Model L) :
    LRA.Identity.Interface.ZeroOrder.Theory L M := by
  exact {
    reflexivity := by
      intro formula
      rfl
    substitution := by
      intro left right h
      cases h
      exact Iff.rfl
  }

end LRA.Identity.Constructions.Axiomatic.ZeroOrder
