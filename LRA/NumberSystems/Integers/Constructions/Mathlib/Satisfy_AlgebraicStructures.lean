import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.Mathlib

namespace LRA.NumberSystems.Integers.Constructions.Mathlib

open LRA.AlgebraicStructures

/-- The `Int`-backed integer construction canonically realizes abelian group
structure. -/
theorem satisfiesAbelianGroup :
    AbelianGroupLaws Carrier := by
  sorry

/-- The `Int`-backed integer construction canonically realizes ring
structure. -/
theorem satisfiesRing :
    RingLaws Carrier := by
  sorry

/-- The `Int`-backed integer construction canonically realizes commutative ring
structure. -/
theorem satisfiesCommutativeRing :
    CommutativeRingLaws Carrier := by
  sorry

/-- The `Int`-backed integer construction canonically realizes integral domain
structure. -/
theorem satisfiesIntegralDomain :
    IntegralDomainLaws Carrier := by
  sorry

/-- The `Int`-backed integer construction canonically realizes ordered ring
structure. -/
theorem satisfiesOrderedRing :
    OrderedRingLaws Carrier := by
  sorry

end LRA.NumberSystems.Integers.Constructions.Mathlib
