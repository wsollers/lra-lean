import LRA.Metamathematics.SyntacticCategory

namespace LRA.Metamathematics

/-!
`StructuralIdentity` names the metatheoretic obligation that, for any
inductively-defined syntax type (a `Term`, `Formula`, or similar), the
correct notion of "these two expressions are the same expression" is
CONSTRUCTOR EQUALITY -- built from the same rule, applied to identical
sub-expressions, all the way down -- and that this notion must be
decidable.

This is the metatheoretic content silently assumed the moment a Lean
inductive type is used to represent syntax: distinct constructors give
distinct values, and each constructor is injective, so no two
differently-shaped expressions are ever conflated (no formalization-level
ambiguity, unlike an unconstrained BNF grammar on paper, which can
genuinely be ambiguous). Lean's inductive types give you this for free
in principle, but only if `DecidableEq` is actually derived or proved --
it is not automatic just because a type happens to be inductive.

REPO STATUS, checked directly (see accompanying audit trail): as of this
writing, `LRA.Logic.Syntax.Term`, `LRA.Logic.Syntax.FirstOrder.Formula`,
`LRA.ProofTheory.System.Takeuti.Term`, and
`LRA.ProofTheory.System.Takeuti.Formula` do NOT derive `DecidableEq`
anywhere -- confirmed absent by exhaustive search across the entire
`LRA.Logic` tree. This is a genuine, currently open gap, not merely
undocumented: structural identity is exactly the kind of fact this
project's own pedagogical discipline says must be stated explicitly
rather than silently assumed, and right now it is neither stated nor
derived for any concrete syntax type in the repository.

This file states the schema and the obligation. It does NOT retroactively
derive `DecidableEq` for `Term`/`Formula`/Takeuti's types -- that is
system-specific work belonging to `LRA.Logic.Syntax`/`LRA.ProofTheory`
respectively, to be done once each system's own definition is settled
(Takeuti is explicitly work-in-progress at time of writing).
-/

/-- An inductive syntax type `Expr`, built over syntactic categories
satisfying `SyntacticCategory`, satisfies `StructuralIdentity` when
equality of its values is decidable -- i.e. "same expression" reduces to
a decidable structural comparison, never to an undecidable or
externally-imposed notion of sameness. -/
class StructuralIdentity (Expr : Type u) where
  decidableStructuralEquality : DecidableEq Expr

attribute [instance] StructuralIdentity.decidableStructuralEquality

/-- If `Expr` satisfies `StructuralIdentity`, then syntactic identity of
expressions is exactly Lean's propositional equality on `Expr` -- stated
so that later files can cite "structural identity IS `=`" as a named
fact rather than an unexamined convention. This is not vacuous: it is
the assertion that no additional identification (e.g. some quotient by
alpha-equivalence, see `AlphaEquivalenceContract` in a future file) is
silently in force unless a system explicitly introduces one. -/
theorem StructuralIdentity.isPropositionalEquality
    {Expr : Type u} [StructuralIdentity Expr] (e1 e2 : Expr) :
    (decide (e1 = e2) = true) ↔ e1 = e2 := by
  sorry
end LRA.Metamathematics
