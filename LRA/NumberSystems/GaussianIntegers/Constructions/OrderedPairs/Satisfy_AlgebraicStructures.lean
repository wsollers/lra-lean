import LRA.AlgebraicStructures
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.Instances

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

universe u

/-- The ordered-pairs Gaussian-integer construction canonically realizes
abelian group structure over a commutative-ring base. -/
theorem satisfiesAbelianGroup
    (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] :
    AbelianGroupLaws (GaussianInteger R) := by
  sorry
/-- The ordered-pairs Gaussian-integer construction canonically realizes ring
structure over a commutative-ring base. -/
theorem satisfiesRing
    (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] :
    RingLaws (GaussianInteger R) := by
  sorry
/-- The ordered-pairs Gaussian-integer construction canonically realizes
commutative ring structure over a commutative-ring base. -/
theorem satisfiesCommutativeRing
    (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] :
    CommutativeRingLaws (GaussianInteger R) := by
  sorry
end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
