import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Instances

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open LRA.AlgebraicStructures

/-- The Polish two-sided-successor construction canonically realizes abelian
group structure. -/
theorem satisfiesAbelianGroup :
    AbelianGroupLaws Z := by
  sorry

/-- The Polish two-sided-successor construction canonically realizes ring
structure. -/
theorem satisfiesRing :
    RingLaws Z := by
  sorry

/-- The Polish two-sided-successor construction canonically realizes
commutative ring structure. -/
theorem satisfiesCommutativeRing :
    CommutativeRingLaws Z := by
  sorry

/-- The Polish two-sided-successor construction canonically realizes integral
domain structure. -/
theorem satisfiesIntegralDomain :
    IntegralDomainLaws Z := by
  sorry

/-- The Polish two-sided-successor construction canonically realizes ordered
ring structure. -/
theorem satisfiesOrderedRing :
    OrderedRingLaws Z := by
  sorry

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
