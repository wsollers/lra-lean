import LRA.AlgebraicStructures
import LRA.NumberSystems.WholeNumbers.Constructions.Mathlib

namespace LRA.NumberSystems.WholeNumbers.Constructions.Mathlib

open LRA.AlgebraicStructures

/-- The `Nat`-backed whole-number construction canonically realizes additive
monoid structure. -/
theorem satisfiesAdditiveMonoid :
    AdditiveMonoidLaws Carrier := by
  sorry

/-- The `Nat`-backed whole-number construction canonically realizes
multiplicative commutative monoid structure. -/
theorem satisfiesCommutativeMonoid :
    CommutativeMonoidLaws Carrier := by
  sorry

/-- The `Nat`-backed whole-number construction canonically realizes semiring
structure. -/
theorem satisfiesSemiring :
    SemiringLaws Carrier := by
  sorry

/-- The `Nat`-backed whole-number construction canonically realizes
commutative semiring structure. -/
theorem satisfiesCommutativeSemiring :
    CommutativeSemiringLaws Carrier := by
  sorry

/-- The `Nat`-backed whole-number construction canonically realizes ordered
semiring structure. -/
theorem satisfiesOrderedSemiring :
    OrderedSemiringLaws Carrier := by
  sorry

end LRA.NumberSystems.WholeNumbers.Constructions.Mathlib
