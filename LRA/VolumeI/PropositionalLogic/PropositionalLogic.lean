import LRA.VolumeI.PropositionalLogic.MetaLogic

-- Define the "lemma" command macro for Lean 4 core compatibility
macro "lemma" id:ident binders:bracketedBinder* ":" type:term ":=" "by" val:tacticSeq : command =>
  `(theorem $id $binders* : $type := by $val)

namespace LRA.VolumeI.PropositionalLogic

-- 1. Define your specific universe of Atoms and Operators
inductive StandardAtoms where
  | P | Q | R

inductive PropUnary where
  | id

inductive PropBinary where
  | or
  | impl
  | iff

-- 2. Instantiate the Meta-Model with your Atoms and Operators
def PropSig : Signature := { 
  Atoms := StandardAtoms 
  UnaryOps := PropUnary
  BinOps := PropBinary
}

-- 3. LOCK IN YOUR SYSTEM
abbrev PropFormula := Formula PropSig
abbrev PropModel   := Structure PropSig
abbrev PropTheory  := List PropFormula

-- 4. Custom Notation
prefix:max "¬"   => Formula.neg
infixl:65  " ∧ " => Formula.conj

-- 5. Test Case
def test_formula : PropFormula :=
  (Formula.atom StandardAtoms.P) ∧ ¬(Formula.atom StandardAtoms.Q)

def test_model : PropModel := {
  interpretation := fun a => match a with
    | StandardAtoms.P => true
    | StandardAtoms.Q => false
    | StandardAtoms.R => false
}

#eval evaluate test_model test_formula  -- Outputs: true


-- ====================================================================
-- Lemma: Closure Properties of Formula Formation
-- ====================================================================

  namespace FormulaFormation
    
    lemma closedUnderUnaryOperation (op : PropUnary) (φ : PropFormula) : 
      ∃ (ψ : PropFormula), ψ = (Formula.unary op φ) := by
      exact ⟨Formula.unary op φ, rfl⟩

    lemma closedUnderBinaryOperation (op : PropBinary) (φ ψ : PropFormula) : 
      ∃ (χ : PropFormula), χ = (Formula.binary op φ ψ) := by
      exact ⟨Formula.binary op φ ψ, rfl⟩

  end FormulaFormation


-- ====================================================================
-- Theorem: Minimality of Well-Formed Formulas
-- ====================================================================

-- Let S be a property representing our set of strings
variable (S : PropFormula → Prop)

-- Assume S is closed under the formation rules:
variable (H_atom : ∀ a : StandardAtoms, S (Formula.atom a))
variable (H_neg : ∀ φ : PropFormula, S φ → S (Formula.neg φ))
variable (H_conj : ∀ φ ψ : PropFormula, S φ → S ψ → S (Formula.conj φ ψ))
variable (H_unary : ∀ (op : PropUnary) (φ : PropFormula),
  S φ → S (Formula.unary op φ))
variable (H_bin : ∀ (φ ψ : PropFormula) (op : PropBinary), 
  S φ → S ψ → S (Formula.binary op φ ψ))

-- Prove that every well-formed formula is in S
theorem minimality_of_wff (φ : PropFormula) : S φ := by
  induction φ with
  | atom a =>
      exact H_atom a
  | neg φ ih =>
      exact H_neg φ ih
  | conj φ ψ ihφ ihψ =>
      exact H_conj φ ψ ihφ ihψ
  | unary op φ ih =>
      exact H_unary op φ ih
  | binary op φ ψ ihφ ihψ =>
      exact H_bin φ ψ op ihφ ihψ





end LRA.VolumeI.PropositionalLogic
