import Mathlib.Data.Fintype.Basic
import Mathlib.Data.Finset.Union
import LRA.VolumeI.Logic.Syntax.Term

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Free variables of a term.

Every variable mentioned in a term is, trivially, "free" -- terms have no
binding construct of their own (only formulas do, via `forallQ`), so
`freeVariablesInTerm` is simply "every variable occurring anywhere in this
term," computed by structural recursion:

  - a variable's free variables are just itself;
  - a constant mentions no variables at all;
  - a function application's free variables are the union of its
    arguments' free variables.

Returned as a `Finset Variable`, not `Set Variable`: a term is a finite
syntax tree, so it mentions only finitely many variables, and `Finset` is
the honest reflection of that fact -- as opposed to `Set`, which would
permit (and give no evidence against) infinite variable sets that no term
could actually produce. This needs `DecidableEq Variable`, the same
standing requirement quantifier-handling code already carries throughout
this project.
-/

/-- The (finite) set of variables occurring in a term. Every occurrence in
a term is free -- terms have no binder of their own. -/
def freeVariablesInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Term S Variable -> Finset Variable
  | .var v => {v}
  | .const _ => ∅
  | @Term.apply _ _ f args =>
      (Finset.univ : Finset (Fin (S.functionArity f))).biUnion (fun i => freeVariablesInTerm (args i))

end LRA.VolumeI.Logic.FirstOrder
