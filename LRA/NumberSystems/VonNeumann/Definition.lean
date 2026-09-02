import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
import LRA.Set.Constructions.ZFCSet.Axioms

namespace LRA.NumberSystems.VonNeumann

open LRA.AlgebraicStructures
open LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
open LRA.Set.Constructions.ZFCSet.Axioms

/-!
`VonNeumann` owns the concrete 0-based arithmetic extension of the naturals:
zero, one, successor, addition, multiplication, and order. The underlying
implementation remains the construction-local ZFC-set realization.
-/

universe u v

abbrev Carrier := NaturalElement

noncomputable abbrev zero : Carrier := NaturalZero

noncomputable abbrev one : Carrier := NaturalOne

noncomputable abbrev successor : Carrier → Carrier := NaturalSuccessor

noncomputable instance : OfNat Carrier 0 where
  ofNat := zero

noncomputable instance : OfNat Carrier 1 where
  ofNat := one

noncomputable instance : HasSuccessor Carrier where
  Succ := successor

theorem nonempty : Nonempty Carrier := by
  sorry
attribute [instance] nonempty

def lessThan : Carrier → Carrier → Prop :=
  fun left right => LRA.Set.Constructions.ZFCMembership left.val right.val

noncomputable def addition : Carrier → Carrier → Carrier :=
  VonNeumannAddition

noncomputable instance : Add Carrier where
  add := addition

noncomputable def multiplication : Carrier → Carrier → Carrier :=
  VonNeumannMultiplication

noncomputable instance : Mul Carrier where
  mul := multiplication

theorem additiveSemigroupLaws : AdditiveSemigroupLaws Carrier := by
  sorry
theorem additiveIdentityLaws : AdditiveIdentityLaws Carrier := by
  sorry
theorem additiveCommutativeLaws : AdditiveCommutativeLaws Carrier := by
  sorry
theorem additiveMonoidLaws : AdditiveMonoidLaws Carrier := by
  sorry
theorem multiplicativeSemigroupLaws : MultiplicativeSemigroupLaws Carrier := by
  sorry
theorem multiplicativeIdentityLaws : MultiplicativeIdentityLaws Carrier := by
  sorry
theorem multiplicativeCommutativeLaws :
    MultiplicativeCommutativeLaws Carrier := by
  sorry
theorem distributiveLaws : DistributiveLaws Carrier := by
  sorry
theorem semiringLaws : SemiringLaws Carrier := by
  sorry
theorem commutativeSemiringLaws : CommutativeSemiringLaws Carrier := by
  sorry
attribute [instance]
  additiveSemigroupLaws
  additiveIdentityLaws
  additiveCommutativeLaws
  additiveMonoidLaws
  multiplicativeSemigroupLaws
  multiplicativeIdentityLaws
  multiplicativeCommutativeLaws
  distributiveLaws
  semiringLaws
  commutativeSemiringLaws

structure VonNeumannConstructionModel
    (Element : Type u) (SetObject : Type v) [Membership Element SetObject] where
  zero : Element
  one : Element
  successor : Element → Element
  addition : Element → Element → Element
  multiplication : Element → Element → Element
  zero_not_successor :
    ∀ element : Element, successor element ≠ zero
  successor_injective :
    ∀ first second : Element,
      successor first = successor second → first = second
  induction :
    ∀ subset : SetObject,
      zero ∈ subset →
      (∀ element : Element,
        element ∈ subset → successor element ∈ subset) →
      ∀ element : Element, element ∈ subset
  lessThan : Element → Element → Prop

noncomputable def concreteConstructionModel :
    VonNeumannConstructionModel Carrier LRA.Set.Constructions.ZFCSet where
  zero := zero
  one := one
  successor := successor
  addition := addition
  multiplication := multiplication
  zero_not_successor := NaturalZeroIsNotSuccessor
  successor_injective := NaturalSuccessorInjective
  induction := NaturalInductionPrinciple
  lessThan := lessThan

abbrev StandardCarrier := Carrier

end LRA.NumberSystems.VonNeumann
