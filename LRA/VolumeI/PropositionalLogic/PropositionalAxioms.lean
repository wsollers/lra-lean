import LRA.VolumeI.Algebra.Laws

namespace LRA.VolumeI.PropositionalLogic

open LRA.VolumeI.Foundations
open LRA.VolumeI.Algebra.Operations

structure PropositionalAxioms (Carrier : Type) where

  Implication : BinaryOperation Carrier

  Negation : UnaryOperation Carrier

  Truth : Carrier

  Weakening : ∀ φ ψ : Carrier,
    ApplyBinaryOperation Implication φ (ApplyBinaryOperation Implication ψ φ) = Truth

  Distribution : ∀ φ ψ χ : Carrier,
    ApplyBinaryOperation Implication
      (ApplyBinaryOperation Implication φ (ApplyBinaryOperation Implication ψ χ))
      (ApplyBinaryOperation Implication
        (ApplyBinaryOperation Implication φ ψ)
        (ApplyBinaryOperation Implication φ χ)) = Truth

  Contraposition : ∀ φ ψ : Carrier,
    ApplyBinaryOperation Implication
      (ApplyBinaryOperation Implication
        (ApplyUnaryOperation Negation φ) (ApplyUnaryOperation Negation ψ))
      (ApplyBinaryOperation Implication ψ φ) = Truth

def TwoElementModel : PropositionalAxioms Bool where
  Implication := fun tuple => (!(tuple i₀)) || (tuple i₁)
  Negation := fun tuple => !(tuple ⟨0, by decide⟩)
  Truth := true
  Weakening := by intro φ ψ; cases φ <;> cases ψ <;> decide
  Distribution := by intro φ ψ χ; cases φ <;> cases ψ <;> cases χ <;> decide
  Contraposition := by intro φ ψ; cases φ <;> cases ψ <;> decide

theorem PropositionalAxiomsExist : Nonempty (PropositionalAxioms Bool) :=
  ⟨TwoElementModel⟩

end LRA.VolumeI.PropositionalLogic
