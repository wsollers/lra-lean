import Mathlib.Data.Set.Defs
import LRA.VolumeI.Logic.Model.Propositional.PropositionalModel

namespace LRA.VolumeI.Logic.Propositional

/-!
Model classes, theories, and the core model-theoretic notions.

A formula denotes a *class of models*: the set of valuations that satisfy
it. The connectives correspond to Boolean operations on these classes
(¬ ↦ complement, ∧ ↦ intersection, ∨ ↦ union, → ↦ the usual material
implication of sets). A theory (a set of formulas) picks out the class of
models satisfying every formula in it, `ModelsOfTheory`; conversely, a
class of models has a theory, `TheoryOfModels` -- the set of formulas true
in every member. `ModelsOfTheory` and `TheoryOfModels` form a Galois
connection: `Γ ⊆ TheoryOfModels K ↔ K ⊆ ModelsOfTheory Γ`.

(The source documents this mirrors call these `Mod` and `Th`; renamed here
to spell out what each actually computes, matching this project's naming
discipline of domain-accurate, not compressed, names.)

From `ModelsOfTheory`/`TheoryOfModels`, the standard model-theoretic
vocabulary follows directly:

  - a formula is *valid* (a tautology) when every model satisfies it;
  - a theory is *satisfiable* when it has at least one model;
  - semantic consequence, `Γ ⊨ φ`, holds when every model of `Γ` is also a
    model of `φ` -- equivalently, `ModelsOfTheory Γ ⊆ modelClass φ`.

This mirrors the propositional model theory documents reviewed earlier in
this project (the "central design choice" -- treat propositional logic as
a genuine semantic theory whose structures are truth-value assignments,
not merely a truth-table calculation) and their recommended chapter
architecture (structures and the model space, satisfaction, definable
model classes, theories and their models). This file is the "definable
model classes" and "theories and models" layers; the Galois connection and
its closure operators (`Cn`, `EC`) are not built here, since nothing yet
needs them -- they are a natural next addition if or when they do.

The satisfaction notation `⊨ₚ` (in `PropositionalModel.lean`) is between a
single model and a single formula; semantic consequence here is between a
*theory* (`Set (Formula L)`) and a formula. Both are legitimately called
`⊨` in the literature, but they relate different-shaped things, so a
distinct notation (`⊨ₜ`, mnemonic for "theory") is used here to avoid
overloading `⊨ₚ` with two incompatible argument shapes.
-/

/-- The class of models satisfying a single formula: `[[φ]]` in the source
documents' notation. -/
def modelClass {L : PropositionalLanguage} (φ : Formula L) : Set (PropositionalModel L) :=
  {M | M.satisfies φ}

/-- The class of models satisfying every formula in a theory (`Mod(Γ)` in
the source documents). -/
def ModelsOfTheory {L : PropositionalLanguage} (Γ : Set (Formula L)) : Set (PropositionalModel L) :=
  {M | ∀ φ ∈ Γ, M.satisfies φ}

/-- The theory of a class of models: the set of formulas true in every
member of `K` (`Th(K)` in the source documents). -/
def TheoryOfModels {L : PropositionalLanguage} (K : Set (PropositionalModel L)) : Set (Formula L) :=
  {φ | ∀ M ∈ K, M.satisfies φ}

/-- A formula is valid (a tautology) when every model satisfies it:
`⊨ φ ⟺ ModelsOfTheory({φ}) = Val(P)`, equivalently every model satisfies
`φ` directly. -/
def IsValid {L : PropositionalLanguage} (φ : Formula L) : Prop :=
  ∀ M : PropositionalModel L, M.satisfies φ

/-- A theory is satisfiable when it has at least one model:
`Γ is satisfiable ⟺ ModelsOfTheory(Γ) ≠ ∅`. -/
def IsSatisfiable {L : PropositionalLanguage} (Γ : Set (Formula L)) : Prop :=
  (ModelsOfTheory Γ).Nonempty

/-- Semantic consequence: `φ` follows from `Γ` when every model of `Γ` is
also a model of `φ`,
`Γ ⊨ φ ⟺ ModelsOfTheory(Γ) ⊆ [[φ]]`. -/
def SemanticConsequence {L : PropositionalLanguage} (Γ : Set (Formula L)) (φ : Formula L) : Prop :=
  ModelsOfTheory Γ ⊆ modelClass φ

/-- Notation for semantic consequence between a theory and a formula,
matching `Γ ⊨ φ`. Named `⊨ₜ` (distinct from `⊨ₚ`, model-to-formula
satisfaction) since the two relate different-shaped things. -/
scoped notation:50 Γ " ⊨ₜ " φ => SemanticConsequence Γ φ

end LRA.VolumeI.Logic.Propositional
