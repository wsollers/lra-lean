import LRA.VolumeI.Logic.Language.Propositional.PropositionalLanguage

namespace LRA.VolumeI.Logic.Propositional

/-!
Propositional formulas.

A formula over a propositional language `L` is one of:

  - an atom, drawn from `L.Atoms`, or
  - the negation of a smaller formula, or
  - an implication between two smaller formulas.

`¬` and `→` are the only primitive connectives, matching the alphabet
definition's logical symbols and `Language.Notation.LogicalConnective`'s
declaration of exactly these two as primitive. `∧`, `∨`, `↔` are not
constructors of `Formula`; they are introduced below as derived notation in
terms of `¬`/`→`, with theorems confirming each has the truth table its
usual symbol suggests.
-/

inductive Formula (L : PropositionalLanguage) where
  | atom : L.Atoms -> Formula L
  | neg : Formula L -> Formula L
  | impl : Formula L -> Formula L -> Formula L

/-!
Evaluation.

`evaluate` computes the truth value of a formula given a valuation --  an
assignment of a truth value to each atom. This is the entire semantic
content of propositional logic: negation flips, implication is the usual
material conditional (false only when the antecedent is true and the
consequent is false).
-/

def evaluate {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) :
    Formula L -> Bool
  | .atom a => valuation a
  | .neg φ => !(evaluate valuation φ)
  | .impl φ ψ => !(evaluate valuation φ) || evaluate valuation ψ

/-!
Derived connectives.

`∧`, `∨`, `↔` are defined in terms of `¬`/`→`, the standard reduction:

  - `φ ∧ ψ := ¬(φ → ¬ψ)`
  - `φ ∨ ψ := ¬φ → ψ`
  - `φ ↔ ψ := (φ → ψ) ∧ (ψ → φ)`

Each comes with a theorem confirming `evaluate` computes the truth table
its usual symbol suggests, so that later proofs can reason about `∧`/`∨`/
`↔` via their truth tables directly, without unfolding the definitions in
terms of `¬`/`→` every time.
-/

def Formula.and {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.neg (Formula.impl φ (Formula.neg ψ))

def Formula.or {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.impl (Formula.neg φ) ψ

def Formula.iff {L : PropositionalLanguage} (φ ψ : Formula L) : Formula L :=
  Formula.and (Formula.impl φ ψ) (Formula.impl ψ φ)

theorem Formula.and_evaluatesToConjunction
    {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) (φ ψ : Formula L) :
    evaluate valuation (Formula.and φ ψ) =
      (evaluate valuation φ && evaluate valuation ψ) := by
  simp [Formula.and, evaluate, Bool.not_or, Bool.not_not]

theorem Formula.or_evaluatesToDisjunction
    {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) (φ ψ : Formula L) :
    evaluate valuation (Formula.or φ ψ) =
      (evaluate valuation φ || evaluate valuation ψ) := by
  simp [Formula.or, evaluate]

theorem Formula.iff_evaluatesToBiconditional
    {L : PropositionalLanguage} (valuation : L.Atoms -> Bool) (φ ψ : Formula L) :
    evaluate valuation (Formula.iff φ ψ) =
      (evaluate valuation φ == evaluate valuation ψ) := by
  simp only [Formula.iff, Formula.and_evaluatesToConjunction, evaluate]
  cases evaluate valuation φ <;> cases evaluate valuation ψ <;> rfl

end LRA.VolumeI.Logic.Propositional
