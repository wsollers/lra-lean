import Mathlib.Tactic.Tauto
import LRA.VolumeI.Logic.Syntax.FirstOrder.Formula
import LRA.VolumeI.Logic.Semantics.TermEvaluation
import LRA.VolumeI.Logic.Semantics.Assignment

namespace LRA.VolumeI.Logic

/-!
Satisfaction.

`Satisfies M assignment φ` says the formula `φ` holds in the model `M`
under the variable assignment `assignment` -- the first-order analogue of
`M ⊨ φ` for propositional logic, now genuinely needing an assignment,
since first-order formulas can mention free variables that propositional
atoms never could.

Each case unfolds exactly as the model-theoretic definition demands:

  - a relation application holds when the model's interpretation of that
    relation symbol holds of the *evaluated* argument terms (this is the
    first place `Satisfies` and `evaluateTerm` actually meet);
  - an equality holds when both terms evaluate to the same domain element;
  - negation and implication are the usual `Prop`-level `¬`/`->`, exactly
    mirroring propositional `evaluate`'s `neg`/`impl` cases one layer up,
    now stated as genuine propositions rather than `Bool` computations,
    since satisfaction of a first-order formula need not be decidable in
    general (unlike a `Bool`-valued propositional valuation, which always
    is);
  - `∀v. φ` holds when, for *every* possible domain element `a`, `φ` holds
    under the assignment updated to send `v` to `a` -- this is exactly why
    `updateAssignment` (and its `DecidableEq Variable` requirement) had to
    exist before this definition could be written at all.
-/

/-- The satisfaction relation: `M`, under the assignment `assignment`,
satisfies the first-order formula `φ`. -/
def Satisfies
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S) (assignment : Variable -> M.Domain) :
    FirstOrder.Formula S Variable -> Prop
  | .relation r args =>
      M.interpretRelation r (fun i => evaluateTerm M assignment (args i))
  | .equal t₁ t₂ =>
      evaluateTerm M assignment t₁ = evaluateTerm M assignment t₂
  | .neg φ =>
      ¬ Satisfies M assignment φ
  | .impl φ ψ =>
      Satisfies M assignment φ -> Satisfies M assignment ψ
  | .forallQ v φ =>
      ∀ a : M.Domain, Satisfies M (updateAssignment assignment v a) φ

/-- `Satisfies` on a conjunction `φ ∧ ψ` (the derived `FirstOrder.Formula.and`)
holds exactly when both `φ` and `ψ` are satisfied -- the first-order
analogue of `Formula.and_evaluatesToConjunction` for propositional logic,
now stated as an `↔` of `Prop`s rather than a `Bool` equation, since
`Satisfies` is `Prop`-valued rather than computing a `Bool`. Classical
reasoning (`Classical.byContradiction`, via `tauto`) is used freely here,
since `Satisfies` is not decidable in general -- unlike propositional
`evaluate`, which always computes a concrete `Bool`. -/
theorem satisfiesAndIffSatisfiesBoth
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S) (assignment : Variable -> M.Domain)
    (φ ψ : FirstOrder.Formula S Variable) :
    Satisfies M assignment (FirstOrder.Formula.and φ ψ) ↔
      (Satisfies M assignment φ ∧ Satisfies M assignment ψ) := by
  simp only [FirstOrder.Formula.and, Satisfies]
  tauto

/-- `Satisfies` on an existential `∃v. φ` (the derived
`FirstOrder.Formula.existsQ`) holds exactly when *some* domain element
witnesses `φ` under the updated assignment -- the expected meaning of
`∃`, derived here (via classical reasoning, since the definition goes
through `¬∀¬`) rather than assumed. -/
theorem satisfiesExistsIffSomeWitness
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S) (assignment : Variable -> M.Domain)
    (v : Variable) (φ : FirstOrder.Formula S Variable) :
    Satisfies M assignment (FirstOrder.Formula.existsQ v φ) ↔
      ∃ a : M.Domain, Satisfies M (updateAssignment assignment v a) φ := by
  simp only [FirstOrder.Formula.existsQ, Satisfies]
  exact not_forall_not

end LRA.VolumeI.Logic
