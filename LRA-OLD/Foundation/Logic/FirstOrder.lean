namespace LRA.Foundation.Logic.FirstOrder

/-!
  ============================================================
  First-Order Logic: Languages, Structures, and Models
  ============================================================

  A first-order *language* is the vocabulary: which function and
  relation symbols exist, and the arity of each. A *structure*
  interprets that vocabulary over a concrete domain. *Satisfaction*
  is Tarski's truth definition, relative to a variable assignment.
  A *model of a theory* is a structure in which every axiom holds.

  Variables are de Bruijn indices: a quantifier binds index 0, and
  every free index shifts up by one underneath it. The reward is
  that satisfaction requires no syntactic substitution — binding is
  handled semantically by extending the assignment. Substitution is
  defined anyway, but only to *state* axiom schemas (induction).

  This file is the generic engine. Concrete languages and their
  models live in the relevant volume modules; for example, Volume I
  instantiates this machinery for successor-only Peano systems and
  Presburger arithmetic.
  ============================================================
-/

-- ════════════════════════════════════════════════════════════
-- §1. The Language (Signature)
-- ════════════════════════════════════════════════════════════

/-- A first-order language fixes the non-logical vocabulary and the
    arity of every symbol. Constants are function symbols of arity 0;
    equality is logical, so it is *not* a relation symbol here. -/
structure FirstOrderLanguage where
  FunctionSymbols : Type
  RelationSymbols : Type
  arityOfFunctionSymbol : FunctionSymbols → Nat
  arityOfRelationSymbol : RelationSymbols → Nat


-- ════════════════════════════════════════════════════════════
-- §2. Syntax: Terms and Formulas
-- ════════════════════════════════════════════════════════════

/-- A term is a variable (a de Bruijn index) or a function symbol
    applied to exactly as many argument terms as its arity demands. -/
inductive Term (language : FirstOrderLanguage) where
  | deBruijnVariable (index : Nat) : Term language
  | functionApplication
      (functionSymbol : language.FunctionSymbols)
      (argumentTerms :
        Fin (language.arityOfFunctionSymbol functionSymbol) → Term language) :
      Term language

/-- A formula is built from atomic equations and relation applications
    by the logical connectives and the two quantifiers. A quantifier
    binds de Bruijn index 0 of its body. -/
inductive Formula (language : FirstOrderLanguage) where
  | equation (leftTerm rightTerm : Term language) : Formula language
  | relationApplication
      (relationSymbol : language.RelationSymbols)
      (argumentTerms :
        Fin (language.arityOfRelationSymbol relationSymbol) → Term language) :
      Formula language
  | negation (subFormula : Formula language) : Formula language
  | conjunction (leftFormula rightFormula : Formula language) : Formula language
  | disjunction (leftFormula rightFormula : Formula language) : Formula language
  | implication (hypothesisFormula conclusionFormula : Formula language) : Formula language
  | biconditional (leftFormula rightFormula : Formula language) : Formula language
  | universalQuantification (bodyFormula : Formula language) : Formula language
  | existentialQuantification (bodyFormula : Formula language) : Formula language


-- ────────────────────────────────────────────────────────────
-- §2.1. de Bruijn Substitution (needed only to state schemas)
-- ────────────────────────────────────────────────────────────

/-- Increment every free variable whose index is at least `lowerBound`.
    This is the "lift" that prevents variable capture when a substituted
    term is pushed underneath a quantifier. -/
def Term.shiftFreeVariablesAbove {language : FirstOrderLanguage}
    (lowerBound : Nat) : Term language → Term language
  | Term.deBruijnVariable index =>
      if index ≥ lowerBound then Term.deBruijnVariable (index + 1)
      else Term.deBruijnVariable index
  | Term.functionApplication functionSymbol argumentTerms =>
      Term.functionApplication functionSymbol
        (fun argumentIndex =>
          (argumentTerms argumentIndex).shiftFreeVariablesAbove lowerBound)

/-- Replace every occurrence of the variable `targetIndex` by `image`. -/
def Term.substituteVariable {language : FirstOrderLanguage}
    (t : Term language) (targetIndex : Nat) (image : Term language) : Term language :=
  match t with
  | Term.deBruijnVariable index =>
      if index = targetIndex then image else Term.deBruijnVariable index
  | Term.functionApplication functionSymbol argumentTerms =>
      Term.functionApplication functionSymbol
        (fun argumentIndex =>
          (argumentTerms argumentIndex).substituteVariable targetIndex image)

/-- Substitute a term for a variable throughout a formula. Crossing a
    quantifier raises both the target index and the image by one, so the
    image continues to denote the same element underneath the new binder. -/
def Formula.substituteVariable {language : FirstOrderLanguage}
    (f : Formula language) (targetIndex : Nat) (image : Term language) : Formula language :=
  match f with
  | Formula.equation leftTerm rightTerm =>
      Formula.equation
        (leftTerm.substituteVariable targetIndex image)
        (rightTerm.substituteVariable targetIndex image)
  | Formula.relationApplication relationSymbol argumentTerms =>
      Formula.relationApplication relationSymbol
        (fun argumentIndex =>
          (argumentTerms argumentIndex).substituteVariable targetIndex image)
  | Formula.negation subFormula =>
      Formula.negation (subFormula.substituteVariable targetIndex image)
  | Formula.conjunction leftFormula rightFormula =>
      Formula.conjunction
        (leftFormula.substituteVariable targetIndex image)
        (rightFormula.substituteVariable targetIndex image)
  | Formula.disjunction leftFormula rightFormula =>
      Formula.disjunction
        (leftFormula.substituteVariable targetIndex image)
        (rightFormula.substituteVariable targetIndex image)
  | Formula.implication hypothesisFormula conclusionFormula =>
      Formula.implication
        (hypothesisFormula.substituteVariable targetIndex image)
        (conclusionFormula.substituteVariable targetIndex image)
  | Formula.biconditional leftFormula rightFormula =>
      Formula.biconditional
        (leftFormula.substituteVariable targetIndex image)
        (rightFormula.substituteVariable targetIndex image)
  | Formula.universalQuantification bodyFormula =>
      Formula.universalQuantification
        (bodyFormula.substituteVariable (targetIndex + 1)
          (image.shiftFreeVariablesAbove 0))
  | Formula.existentialQuantification bodyFormula =>
      Formula.existentialQuantification
        (bodyFormula.substituteVariable (targetIndex + 1)
          (image.shiftFreeVariablesAbove 0))


-- ════════════════════════════════════════════════════════════
-- §3. Semantics: Structures, Assignments, Satisfaction
-- ════════════════════════════════════════════════════════════

namespace Semantics

/-- A structure interprets a language: a domain, a function over the
    domain for each function symbol, and a relation (a `Prop`) for each
    relation symbol. The `someElementOfDomain` witness records the
    standard requirement that first-order domains are non-empty. -/
structure FirstOrderStructure (language : FirstOrderLanguage) where
  Domain : Type
  interpretFunctionSymbol :
    (functionSymbol : language.FunctionSymbols) →
    (Fin (language.arityOfFunctionSymbol functionSymbol) → Domain) → Domain
  interpretRelationSymbol :
    (relationSymbol : language.RelationSymbols) →
    (Fin (language.arityOfRelationSymbol relationSymbol) → Domain) → Prop
  someElementOfDomain : Domain

/-- A variable assignment supplies a domain element for every de Bruijn index. -/
abbrev VariableAssignment {language : FirstOrderLanguage}
    (interpretation : FirstOrderStructure language) : Type :=
  Nat → interpretation.Domain

/-- Push `value` onto index 0, shifting every existing binding up by one.
    This is exactly what entering a quantifier does to the assignment. -/
def extendAssignmentWithValue {language : FirstOrderLanguage}
    {interpretation : FirstOrderStructure language}
    (value : interpretation.Domain)
    (assignment : VariableAssignment interpretation) :
    VariableAssignment interpretation :=
  fun index =>
    match index with
    | 0 => value
    | Nat.succ predecessorIndex => assignment predecessorIndex

/-- Evaluate a term to a domain element under an assignment. -/
def evaluateTerm {language : FirstOrderLanguage}
    (interpretation : FirstOrderStructure language)
    (assignment : VariableAssignment interpretation) :
    Term language → interpretation.Domain
  | Term.deBruijnVariable index => assignment index
  | Term.functionApplication functionSymbol argumentTerms =>
      interpretation.interpretFunctionSymbol functionSymbol
        (fun argumentIndex =>
          evaluateTerm interpretation assignment (argumentTerms argumentIndex))

/-- Tarski's truth definition: when does `interpretation` satisfy `formula`
    under `assignment`? This lands in `Prop`, not `Bool` — quantifying over
    a possibly infinite domain is not in general decidable. -/
def StructureSatisfiesFormulaUnderAssignment {language : FirstOrderLanguage}
    (interpretation : FirstOrderStructure language) :
    VariableAssignment interpretation → Formula language → Prop
  | assignment, Formula.equation leftTerm rightTerm =>
      evaluateTerm interpretation assignment leftTerm =
        evaluateTerm interpretation assignment rightTerm
  | assignment, Formula.relationApplication relationSymbol argumentTerms =>
      interpretation.interpretRelationSymbol relationSymbol
        (fun argumentIndex =>
          evaluateTerm interpretation assignment (argumentTerms argumentIndex))
  | assignment, Formula.negation subFormula =>
      ¬ StructureSatisfiesFormulaUnderAssignment interpretation assignment subFormula
  | assignment, Formula.conjunction leftFormula rightFormula =>
      StructureSatisfiesFormulaUnderAssignment interpretation assignment leftFormula ∧
        StructureSatisfiesFormulaUnderAssignment interpretation assignment rightFormula
  | assignment, Formula.disjunction leftFormula rightFormula =>
      StructureSatisfiesFormulaUnderAssignment interpretation assignment leftFormula ∨
        StructureSatisfiesFormulaUnderAssignment interpretation assignment rightFormula
  | assignment, Formula.implication hypothesisFormula conclusionFormula =>
      StructureSatisfiesFormulaUnderAssignment interpretation assignment hypothesisFormula →
        StructureSatisfiesFormulaUnderAssignment interpretation assignment conclusionFormula
  | assignment, Formula.biconditional leftFormula rightFormula =>
      StructureSatisfiesFormulaUnderAssignment interpretation assignment leftFormula ↔
        StructureSatisfiesFormulaUnderAssignment interpretation assignment rightFormula
  | assignment, Formula.universalQuantification bodyFormula =>
      ∀ domainElement : interpretation.Domain,
        StructureSatisfiesFormulaUnderAssignment interpretation
          (extendAssignmentWithValue domainElement assignment) bodyFormula
  | assignment, Formula.existentialQuantification bodyFormula =>
      ∃ domainElement : interpretation.Domain,
        StructureSatisfiesFormulaUnderAssignment interpretation
          (extendAssignmentWithValue domainElement assignment) bodyFormula

/-- A formula holds *in* a structure when it is satisfied under every
    assignment. For sentences this is plain truth; for open formulas it is
    truth of the universal closure. This is the relation `M ⊨ φ`. -/
def StructureModelsFormula {language : FirstOrderLanguage}
    (interpretation : FirstOrderStructure language)
    (formula : Formula language) : Prop :=
  ∀ assignment : VariableAssignment interpretation,
    StructureSatisfiesFormulaUnderAssignment interpretation assignment formula

end Semantics


-- ════════════════════════════════════════════════════════════
-- §4. Theories and Models
-- ════════════════════════════════════════════════════════════

namespace ModelTheory
open Semantics

/-- A theory is a *set* of formulas — a predicate on formulas — so that it
    may contain the infinitely many instances of an axiom schema. -/
abbrev FirstOrderTheory (language : FirstOrderLanguage) : Type :=
  Formula language → Prop

/-- `interpretation ⊨ theory`: every axiom the theory demands holds in it. -/
def StructureModelsTheory {language : FirstOrderLanguage}
    (interpretation : FirstOrderStructure language)
    (theory : FirstOrderTheory language) : Prop :=
  ∀ formula, theory formula → StructureModelsFormula interpretation formula

/-- A model of a theory bundles an interpretation together with the proof
    that it satisfies every axiom. The theory is a genuine parameter and
    nothing is hardcoded: the single quantified field `modelsEveryAxiom`
    replaces a per-axiom field. -/
structure Model (language : FirstOrderLanguage)
    (theory : FirstOrderTheory language) where
  interpretation : FirstOrderStructure language
  modelsEveryAxiom :
    ∀ formula, theory formula → StructureModelsFormula interpretation formula

/-- Semantic entailment: `theory ⊨ formula` iff every structure modelling
    the theory also models the formula. -/
def TheorySemanticallyEntailsFormula {language : FirstOrderLanguage}
    (theory : FirstOrderTheory language) (formula : Formula language) : Prop :=
  ∀ interpretation : FirstOrderStructure language,
    StructureModelsTheory interpretation theory →
      StructureModelsFormula interpretation formula

end ModelTheory


-- ════════════════════════════════════════════════════════════
-- §5. Unit Tests (generic — exercise the engine on a toy signature)
-- ════════════════════════════════════════════════════════════
--
-- The substitution tests are the load-bearing ones: de Bruijn index
-- arithmetic is exactly where off-by-one capture bugs hide, so each
-- `example` is checked by `rfl` (definitional equality) at compile time.
-- A minimal two-symbol signature keeps the engine self-verifying without
-- depending on any concrete arithmetic instance.

namespace Tests
open Semantics

/-- A toy signature: one constant `point` and one unary `wrap`. -/
inductive ToyFunction where
  | point
  | wrap

inductive ToyRelation

def toyLanguage : FirstOrderLanguage where
  FunctionSymbols := ToyFunction
  RelationSymbols := ToyRelation
  arityOfFunctionSymbol := fun
    | ToyFunction.point => 0
    | ToyFunction.wrap => 1
  arityOfRelationSymbol := fun _ => 0

def pointTerm : Term toyLanguage :=
  Term.functionApplication ToyFunction.point Fin.elim0

def wrapTerm (argument : Term toyLanguage) : Term toyLanguage :=
  Term.functionApplication ToyFunction.wrap (fun _ => argument)

/-- A toy structure over `ℕ`: `point ↦ 0`, `wrap ↦ Nat.succ`. -/
abbrev toyStructure : FirstOrderStructure toyLanguage where
  Domain := Nat
  interpretFunctionSymbol := fun functionSymbol =>
    match functionSymbol with
    | ToyFunction.point => fun _ => 0
    | ToyFunction.wrap => fun argumentValues => Nat.succ (argumentValues ⟨0, by decide⟩)
  interpretRelationSymbol := fun relationSymbol _ => nomatch relationSymbol
  someElementOfDomain := 0

-- Semantics: `wrap (wrap point)` evaluates to `2`.
#guard
  (evaluateTerm toyStructure (fun _ => (0 : Nat))
    (wrapTerm (wrapTerm pointTerm)) : Nat) == 2

/-- The test predicate `∀ x₀, (x₀ = x₁)` — one bound variable (index 0)
    and one free parameter (index 1). -/
def boundEqualsFreeFormula : Formula toyLanguage :=
  Formula.universalQuantification
    (Formula.equation (Term.deBruijnVariable 0) (Term.deBruijnVariable 1))

/-- Substituting the free parameter with a *closed* term targets index 1 under
    the binder and leaves the bound variable untouched: `∀ x₀, (x₀ = wrap point)`. -/
example :
    boundEqualsFreeFormula.substituteVariable 0 (wrapTerm pointTerm)
      = Formula.universalQuantification
          (Formula.equation (Term.deBruijnVariable 0) (wrapTerm pointTerm)) := by
  dsimp [toyLanguage, boundEqualsFreeFormula, Formula.substituteVariable, Term.substituteVariable, Term.shiftFreeVariablesAbove, wrapTerm, pointTerm]
  congr
  funext x
  congr
  funext x
  cases x with | mk val isLt => omega

/-- The capture-avoiding lift: substituting an *open* term `x₅` shifts it to
    `x₆` as it crosses the binder — `∀ x₀, (x₀ = x₆)`, never `x₅`. -/
example :
    boundEqualsFreeFormula.substituteVariable 0 (Term.deBruijnVariable 5)
      = Formula.universalQuantification
          (Formula.equation (Term.deBruijnVariable 0) (Term.deBruijnVariable 6)) :=
  rfl

end Tests

end LRA.Foundation.Logic.FirstOrder
