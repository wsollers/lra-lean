import Mathlib.Data.Fintype.Basic
import Mathlib.Data.Finset.Union
import LRA.VolumeI.Logic.Syntax.FirstOrder.Formula
import LRA.VolumeI.Logic.Syntax.FirstOrder.FreeVariablesInTerm

namespace LRA.VolumeI.Logic.FirstOrder

/-!
All variables of a formula.

`allVariables φ` collects *every* variable that occurs anywhere in `φ` --
free occurrences and bound occurrences alike, including the variables that
appear only as a quantifier's bound variable. It is the exact same
structural recursion as `freeVariables`, differing in the single case that
does binding work:

  - `∀v. φ`: `freeVariables` *removes* `v` (`(freeVariables φ).erase v`),
    because an occurrence of `v` inside `φ` is bound, not free;
    `allVariables` instead *adds* `v` (`{v} ∪ allVariables φ`), because it
    is deliberately blind to the free/bound distinction -- it wants the
    binder `v` itself counted, not discarded.

Every other case (atomic formulas, `¬`, `→`) introduces no binder, so the
two functions agree there, and both bottom out in `freeVariablesInTerm`
(which, terms having no binder of their own, already returns *all* of a
term's variables).

The intended use is capture-avoidance for renaming: a variable chosen
outside `allVariables φ` occurs nowhere in `φ` -- neither free nor bound --
so substituting it into `φ`, or substituting a fresh term *for* a variable
of `φ` using it, cannot be captured by any of `φ`'s own quantifiers. This
is a strictly stronger guarantee than avoiding only `freeVariables φ`,
which leaves `φ`'s bound variables free to collide.
-/

/-- The (finite) set of *all* variables occurring in a formula, free and
bound. Differs from `freeVariables` only at `forallQ`, where the bound
variable is kept rather than erased. -/
def allVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Finset Variable
  | .relation _ args => Finset.univ.biUnion (fun i => freeVariablesInTerm (args i))
  | .equal t₁ t₂ => freeVariablesInTerm t₁ ∪ freeVariablesInTerm t₂
  | .neg φ => allVariables φ
  | .impl φ ψ => allVariables φ ∪ allVariables ψ
  | .forallQ v φ => {v} ∪ allVariables φ

end LRA.VolumeI.Logic.FirstOrder
