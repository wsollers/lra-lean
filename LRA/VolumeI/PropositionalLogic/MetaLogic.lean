namespace LRA.VolumeI.PropositionalLogic

/-!
  ============================================================
  Propositional Meta-Logic
  ============================================================

  A propositional language is the vocabulary: the atoms and
  connective symbols that formulas may use.

  A propositional structure is an interpretation of that
  vocabulary: it assigns truth values to atoms and truth
  functions to connectives.
  ============================================================
-/

-- 1. The Generic Language / Signature
structure PropositionalLanguage where
  Atoms : Type
  UnaryConnectives : Type := Empty
  BinaryConnectives : Type := Empty

-- 2. The Generic Language
inductive PropositionalFormula (L : PropositionalLanguage) where
  | atom : L.Atoms → PropositionalFormula L
  | unary :
      L.UnaryConnectives →
      PropositionalFormula L →
      PropositionalFormula L
  | binary :
      L.BinaryConnectives →
      PropositionalFormula L →
      PropositionalFormula L →
      PropositionalFormula L

-- 3. The Generic Semantics
structure PropositionalStructure (L : PropositionalLanguage) where
  truthValueOfAtom : L.Atoms → Bool
  truthFunctionOfUnaryConnective :
    L.UnaryConnectives → Bool → Bool
  truthFunctionOfBinaryConnective :
    L.BinaryConnectives → Bool → Bool → Bool

def evaluateFormula {L : PropositionalLanguage}
    (M : PropositionalStructure L) :
    PropositionalFormula L → Bool
  | PropositionalFormula.atom a =>
      M.truthValueOfAtom a
  | PropositionalFormula.unary connective ϕ =>
      M.truthFunctionOfUnaryConnective connective (evaluateFormula M ϕ)
  | PropositionalFormula.binary connective ϕ ψ =>
      M.truthFunctionOfBinaryConnective connective
        (evaluateFormula M ϕ)
        (evaluateFormula M ψ)

def StructureSatisfiesFormula {L : PropositionalLanguage}
    (M : PropositionalStructure L)
    (ϕ : PropositionalFormula L) : Prop :=
  evaluateFormula M ϕ = true

abbrev PropositionalTheory (L : PropositionalLanguage) :=
  List (PropositionalFormula L)

def StructureModelsTheory {L : PropositionalLanguage}
    (M : PropositionalStructure L)
    (T : PropositionalTheory L) : Prop :=
  ∀ ϕ, ϕ ∈ T → StructureSatisfiesFormula M ϕ

-- Compatibility names while the surrounding volume migrates.
abbrev Signature := PropositionalLanguage
abbrev Formula := PropositionalFormula
abbrev Structure := PropositionalStructure
abbrev Theory := PropositionalTheory
abbrev evaluate {L : PropositionalLanguage} (M : PropositionalStructure L) (ϕ : PropositionalFormula L) : Bool :=
  evaluateFormula M ϕ

end LRA.VolumeI.PropositionalLogic
