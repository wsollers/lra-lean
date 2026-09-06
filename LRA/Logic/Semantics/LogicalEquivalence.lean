import LRA.Logic.Syntax.Propositional.Formula
import LRA.Logic.Syntax.FirstOrder.Sentence
import LRA.Logic.Semantics.Satisfaction

namespace LRA.Logic.Propositional

/--
Two propositional formulas are logically equivalent when they have the same
truth value under every truth assignment.
-/
def LogicallyEquivalent {L : PropositionalLanguage} (φ ψ : Formula L) : Prop :=
  ∀ valuation : L.Atoms -> Bool, evaluate valuation φ = evaluate valuation ψ

theorem logicallyEquivalent_refl {L : PropositionalLanguage} (φ : Formula L) :
    LogicallyEquivalent φ φ := by
  intro valuation
  rfl

theorem logicallyEquivalent_symm {L : PropositionalLanguage} {φ ψ : Formula L}
    (h : LogicallyEquivalent φ ψ) : LogicallyEquivalent ψ φ := by
  intro valuation
  exact (h valuation).symm

theorem logicallyEquivalent_trans {L : PropositionalLanguage} {φ ψ χ : Formula L}
    (hφψ : LogicallyEquivalent φ ψ) (hψχ : LogicallyEquivalent ψ χ) :
    LogicallyEquivalent φ χ := by
  intro valuation
  exact Eq.trans (hφψ valuation) (hψχ valuation)

def logicalEquivalenceSetoid (L : PropositionalLanguage) : Setoid (Formula L) where
  r := LogicallyEquivalent
  iseqv :=
    ⟨fun φ => logicallyEquivalent_refl φ,
      fun h => logicallyEquivalent_symm h,
      fun hφψ hψχ => logicallyEquivalent_trans hφψ hψχ⟩

/--
The semantic equivalence class of a propositional formula.
-/
def LogicalEquivalenceClass {L : PropositionalLanguage} (φ : Formula L) :
    Set (Formula L) :=
  { ψ | LogicallyEquivalent ψ φ }

/--
The quotient of propositional formulas by semantic logical equivalence.
-/
abbrev SemanticQuotient (L : PropositionalLanguage) :=
  Quotient (logicalEquivalenceSetoid L)

end LRA.Logic.Propositional

namespace LRA.Logic.FirstOrder

universe u

/--
Two first-order sentences are logically equivalent when they have the same
satisfaction behavior in every structure, equivalently under every assignment.
-/
def SentenceLogicallyEquivalent
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (φ ψ : Sentence S Variable) : Prop :=
  ∀ M : Interpretation.{u} S, ∀ assignment : Variable -> M.Domain,
    Satisfies M assignment φ.val ↔ Satisfies M assignment ψ.val

theorem sentenceLogicallyEquivalent_refl
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (φ : Sentence S Variable) : SentenceLogicallyEquivalent.{u} φ φ := by
  intro M assignment
  rfl

theorem sentenceLogicallyEquivalent_symm
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    {φ ψ : Sentence S Variable}
    (h : SentenceLogicallyEquivalent.{u} φ ψ) :
    SentenceLogicallyEquivalent.{u} ψ φ := by
  intro M assignment
  exact (h M assignment).symm

theorem sentenceLogicallyEquivalent_trans
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    {φ ψ χ : Sentence S Variable}
    (hφψ : SentenceLogicallyEquivalent.{u} φ ψ)
    (hψχ : SentenceLogicallyEquivalent.{u} ψ χ) :
    SentenceLogicallyEquivalent.{u} φ χ := by
  intro M assignment
  exact Iff.trans (hφψ M assignment) (hψχ M assignment)

def sentenceLogicalEquivalenceSetoid
    (S : Signature) (Variable : Type) [DecidableEq Variable] :
    Setoid (Sentence S Variable) where
  r := SentenceLogicallyEquivalent.{u}
  iseqv :=
    ⟨fun φ => sentenceLogicallyEquivalent_refl φ,
      fun h => sentenceLogicallyEquivalent_symm h,
      fun hφψ hψχ => sentenceLogicallyEquivalent_trans hφψ hψχ⟩

/--
The semantic equivalence class of a first-order sentence.
-/
def SentenceLogicalEquivalenceClass
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (φ : Sentence S Variable) : Set (Sentence S Variable) :=
  { ψ | SentenceLogicallyEquivalent.{u} ψ φ }

/--
The quotient of first-order sentences by semantic logical equivalence.
-/
abbrev SentenceSemanticQuotient
    (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  Quotient (sentenceLogicalEquivalenceSetoid.{u} S Variable)

end LRA.Logic.FirstOrder
