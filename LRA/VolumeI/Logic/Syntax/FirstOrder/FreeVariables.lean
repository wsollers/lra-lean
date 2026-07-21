import Mathlib.Data.Finset.Union
import Mathlib.Data.Finset.SDiff
import LRA.VolumeI.Logic.Syntax.FirstOrder.Formula
import LRA.VolumeI.Logic.Syntax.FirstOrder.FreeVariablesInTerm

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Free variables of a formula.

Unlike a term, a formula genuinely has a binder (`forallQ`), so "free
variable" is a real distinction here, not a triviality: an occurrence of a
variable is free in a formula if it is not in the scope of a quantifier
that rebinds it. Computed by structural recursion over `Formula`'s five
constructors:

  - a relation application's free variables are the union of its
    argument terms' free variables (via `freeVariablesInTerm`);
  - an equality's free variables are the union of both terms' free
    variables;
  - negation and implication pass through unchanged (or take the union,
    for the binary case) -- these connectives introduce no binding;
  - `∀v. φ`'s free variables are `φ`'s free variables, *minus* `v` -- this
    is the one case that does real work: any free occurrence of `v` inside
    `φ` becomes bound by this quantifier, so `v` itself is removed, while
    every other free variable of `φ` remains free in `∀v. φ`.

This is exactly the ingredient `Substitution` will need next: substituting
a term for a variable `x` in `φ` is only sound (capture-avoiding) once it
is known which occurrences of `x` are free to begin with -- substitution
must never touch `x` inside a `∀x. ...` subformula that already rebinds it.
-/

/-- The (finite) set of variables occurring free in a formula. -/
def freeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Finset Variable
  | .relation _ args => Finset.univ.biUnion (fun i => freeVariablesInTerm (args i))
  | .equal t₁ t₂ => freeVariablesInTerm t₁ ∪ freeVariablesInTerm t₂
  | .neg φ => freeVariables φ
  | .impl φ ψ => freeVariables φ ∪ freeVariables ψ
  | .forallQ v φ => (freeVariables φ).erase v

end LRA.VolumeI.Logic.FirstOrder
