import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

namespace LRA.NumberSystems.Presburger

open LRA.AlgebraicStructures
open LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
open LRA.Set
open LRA.Set.Constructions

/-!
`Presburger` owns the concrete 0-based additive naturals layer. It keeps the
successor, addition, zero, and order surface, but does not own multiplication
or broader semiring arithmetic; those belong to richer downstream subjects.
-/

abbrev Carrier := PresburgerElement

abbrev zero : Carrier := PresburgerElement.zero

abbrev successor : Carrier → Carrier := PresburgerElement.succ

instance : OfNat Carrier 0 where
  ofNat := zero

instance : HasSuccessor Carrier where
  Succ := successor

theorem nonempty : Nonempty Carrier := by
  sorry

def lessThan : Carrier → Carrier → Prop := PresburgerLessThan

def concreteConstructionModel :
    LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel
      Carrier (TypeSet Carrier) where
  zero := zero
  successor := successor
  zero_not_successor := PresburgerZeroIsNotSuccessor
  successor_injective := PresburgerSuccessorInjective
  induction := PresburgerInductionPrinciple
  lessThan := lessThan

noncomputable def addition : Carrier → Carrier → Carrier :=
  PresburgerAddition concreteConstructionModel

noncomputable instance : Add Carrier where
  add := addition

theorem additiveSemigroupLaws : AdditiveSemigroupLaws Carrier := by
  sorry

theorem additiveIdentityLaws : AdditiveIdentityLaws Carrier := by
  sorry

theorem additiveCommutativeLaws : AdditiveCommutativeLaws Carrier := by
  sorry

theorem additiveMonoidLaws : AdditiveMonoidLaws Carrier := by
  sorry

abbrev StandardCarrier := Carrier

end LRA.NumberSystems.Presburger
