import LRA.AlgebraicStructures
import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Instances

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

open LRA.AlgebraicStructures

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- The Landau whole-number construction canonically realizes commutative
semiring structure. -/
theorem satisfiesCommutativeSemiring
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : OfNat (Carrier natural_data) 0 := zeroOn natural_data
    let _ : OfNat (Carrier natural_data) 1 := oneOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    CommutativeSemiringLaws (Carrier natural_data) := by
  sorry
/-- The Landau whole-number construction canonically realizes ordered semiring
structure. -/
theorem satisfiesOrderedSemiring
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : OfNat (Carrier natural_data) 0 := zeroOn natural_data
    let _ : OfNat (Carrier natural_data) 1 := oneOn natural_data
    let _ : LE (Carrier natural_data) := leOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    OrderedSemiringLaws (Carrier natural_data) := by
  sorry
end LRA.NumberSystems.WholeNumbers.Constructions.Landau
