import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition
import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.SuccessorArithmetic

/-
`SuccessorArithmetic` is the concrete successor-only natural-number seed. It
does not own addition or multiplicative arithmetic; those live in richer
downstream concrete subjects.
-/
open LRA.AlgebraicStructures

abbrev Carrier := Nat

abbrev zero : Carrier := 0

abbrev successor : Carrier → Carrier := Nat.succ

instance : HasSuccessor Carrier where
  Succ := successor

abbrev one : Carrier := successor zero

theorem zeroIsNotSuccessor :
    ∀ element : Carrier, successor element ≠ zero := by
  sorry
theorem successorInjective :
    ∀ first second : Carrier,
      successor first = successor second →
      first = second := by
  sorry
theorem successorInduction :
    ∀ subset : Set Carrier,
      zero ∈ subset →
      (∀ element : Carrier, element ∈ subset → successor element ∈ subset) →
      ∀ element : Carrier, element ∈ subset := by
  sorry
def concretePeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem Carrier (Set Carrier) where
  base := zero
  successor := successor
  one_not_successor := zeroIsNotSuccessor
  successor_injective := successorInjective
  induction := successorInduction

abbrev StandardCarrier := Carrier

end LRA.NumberSystems.SuccessorArithmetic
