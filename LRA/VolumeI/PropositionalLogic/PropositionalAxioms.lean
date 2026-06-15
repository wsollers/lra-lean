-- LRA/VolumeI/PropositionalLogic/PropositionalAxioms.lean
--
-- The three classical propositional axiom schemas as an EQUATIONAL bundle —
-- the universal-algebra presentation chosen for this repo. A carrier with an
-- implication and a negation, where each schema holds as an equation `… = Truth`.
-- Models are Boolean algebras; the two-element algebra over `Bool` is the first,
-- discharged here, so the interface is non-vacuous.
--
-- This is the SEMANTIC side. The syntactic side (Formula + Provable) and the
-- soundness/completeness bridge are deferred to VolumeI/Metatheory (see its
-- README) and are NOT built here.

import LRA.VolumeI.Algebra.Laws

namespace LRA.VolumeI.PropositionalLogic

open LRA.VolumeI.Foundations
open LRA.VolumeI.Algebra.Operations

/-- The propositional axioms over a carrier: an implication, a negation, a top
    element `Truth`, and the three Hilbert schemas as equations. -/
structure PropositionalAxioms (Carrier : Type) where
  /-- Implication `φ → ψ`. -/
  Implication : BinaryOperation Carrier
  /-- Negation `¬φ`. -/
  Negation : UnaryOperation Carrier
  /-- The top element `⊤` that valid schemas equal. -/
  Truth : Carrier
  /-- Axiom 1 (weakening): `φ → (ψ → φ)`. -/
  Weakening : ∀ φ ψ : Carrier,
    ApplyBinaryOperation Implication φ (ApplyBinaryOperation Implication ψ φ) = Truth
  /-- Axiom 2 (distribution): `(φ → (ψ → χ)) → ((φ → ψ) → (φ → χ))`. -/
  Distribution : ∀ φ ψ χ : Carrier,
    ApplyBinaryOperation Implication
      (ApplyBinaryOperation Implication φ (ApplyBinaryOperation Implication ψ χ))
      (ApplyBinaryOperation Implication
        (ApplyBinaryOperation Implication φ ψ)
        (ApplyBinaryOperation Implication φ χ)) = Truth
  /-- Axiom 3 (contraposition): `(¬φ → ¬ψ) → (ψ → φ)`. -/
  Contraposition : ∀ φ ψ : Carrier,
    ApplyBinaryOperation Implication
      (ApplyBinaryOperation Implication
        (ApplyUnaryOperation Negation φ) (ApplyUnaryOperation Negation ψ))
      (ApplyBinaryOperation Implication ψ φ) = Truth

/-- The two-element Boolean algebra over `Bool`, with material implication
    `φ → ψ := ¬φ ∨ ψ` and Boolean negation, models the propositional axioms.
    The three schemas are tautologies, so each closes by case analysis. -/
def TwoElementModel : PropositionalAxioms Bool where
  Implication := fun tuple => (!(tuple i₀)) || (tuple i₁)
  Negation := fun tuple => !(tuple ⟨0, by decide⟩)
  Truth := true
  Weakening := by intro φ ψ; cases φ <;> cases ψ <;> decide
  Distribution := by intro φ ψ χ; cases φ <;> cases ψ <;> cases χ <;> decide
  Contraposition := by intro φ ψ; cases φ <;> cases ψ <;> decide

/-- Existence witness: the propositional axioms are non-vacuous (modelled by `Bool`). -/
theorem PropositionalAxiomsExist : Nonempty (PropositionalAxioms Bool) :=
  ⟨TwoElementModel⟩

end LRA.VolumeI.PropositionalLogic
