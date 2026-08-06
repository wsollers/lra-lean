import LRA.VolumeI.Logic.Syntax.FirstOrder.Sentence
import LRA.VolumeI.Logic.Semantics.Sentence
import LRA.VolumeI.Logic.Semantics.SecondOrderMonadic.SOSatisfaction

namespace LRA.VolumeI.Logic.FirstOrder

/-!
First-order theories.

This module records the third model-theory layer, after language and model:
a theory is a collection of formulas or, once closedness is available, a
collection of sentences in a fixed first-order language. The formula-level
version is useful for schemas and partially migrated developments; the
sentence-level version is the ordinary closed-theory interface.
-/

/-- A formula theory over the first-order language `S`. -/
abbrev FormulaTheory (S : Signature) (Variable : Type) :=
  Set (Formula S Variable)

/-- A sentence theory over the first-order language `S`. -/
abbrev Theory (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  Set (Sentence S Variable)

/-- The class of first-order models satisfying every formula in a formula theory,
under every assignment. -/
def ModelsOfFormulaTheory
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (Γ : FormulaTheory S Variable) :
    Set (Model S) :=
  fun M => ∀ assignment φ, φ ∈ Γ -> Satisfies M assignment φ

/-- The class of first-order models satisfying every sentence in a theory. -/
def ModelsOfTheory
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (Γ : Theory S Variable) :
    Set (Model S) :=
  fun M => ∀ assignment sentence, sentence ∈ Γ -> Satisfies M assignment sentence.val

/-- The theory determined by a class of first-order models: the sentences true
in every model in the class. -/
def TheoryOfModels
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (K : Set (Model S)) :
    Theory S Variable :=
  fun sentence => ∀ M, M ∈ K -> ∀ assignment, Satisfies M assignment sentence.val

/-- Semantic consequence from a formula theory. -/
def SemanticConsequence
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (Γ : FormulaTheory S Variable) (φ : Formula S Variable) : Prop :=
  ∀ M assignment, M ∈ ModelsOfFormulaTheory Γ -> Satisfies M assignment φ

end LRA.VolumeI.Logic.FirstOrder

namespace LRA.VolumeI.Logic.SecondOrderMonadic

/-!
Monadic second-order theories.

The current second-order syntax does not yet carry a closed-sentence subtype,
so the public theory interface is intentionally formula-level and Henkin-model
based.
-/

/-- A monadic second-order formula theory over `S`. -/
abbrev FormulaTheory (S : Signature) (Variable SetVariable : Type) :=
  Set (SOFormula S Variable SetVariable)

/-- The class of Henkin models satisfying every formula in a second-order
formula theory, under every second-order assignment. -/
def ModelsOfFormulaTheory
    {S : Signature} {Variable SetVariable : Type}
    [DecidableEq Variable] [DecidableEq SetVariable]
    (Γ : FormulaTheory S Variable SetVariable) :
    Set (HenkinModel S) :=
  fun M => ∀ assignment φ, φ ∈ Γ -> SOSatisfies M assignment φ

/-- Semantic consequence from a monadic second-order formula theory under
Henkin semantics. -/
def SemanticConsequence
    {S : Signature} {Variable SetVariable : Type}
    [DecidableEq Variable] [DecidableEq SetVariable]
    (Γ : FormulaTheory S Variable SetVariable)
    (φ : SOFormula S Variable SetVariable) : Prop :=
  ∀ M assignment, M ∈ ModelsOfFormulaTheory Γ -> SOSatisfies M assignment φ

end LRA.VolumeI.Logic.SecondOrderMonadic
