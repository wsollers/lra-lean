import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
**[Order — Landau's Strict Order]**

`x` is less than `y` iff some `z` makes `x + z = y`.

*Sources:*
  Landau, Grundlagen der Analysis, Ch. 1
-/
def LandauLessThan
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  ∃ z : Element, LandauAddition model x z = y

theorem LandauLessThanTrichotomous
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauLessThan model x y ∨ x = y ∨ LandauLessThan model y x := by
  sorry

theorem LandauLessThanTransitive
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      LandauLessThan model x y → LandauLessThan model y z →
        LandauLessThan model x z := by
  sorry

theorem LandauAdditionPreservesAndReflectsLandauLessThan
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      LandauLessThan model x y ↔
        LandauLessThan model
          (LandauAddition model x z) (LandauAddition model y z) := by
  sorry

theorem LandauMultiplicationPreservesAndReflectsLandauLessThan
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      LandauLessThan model x y ↔
        LandauLessThan model
          (LandauMultiplication model x z) (LandauMultiplication model y z) := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
