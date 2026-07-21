import LRA.VolumeI.Logic.Syntax.Term
import LRA.VolumeI.Logic.Model.Model

namespace LRA.VolumeI.Logic

/-!
Term evaluation.

This is the first place `Term` (pure syntax) and `Model` (domain plus
interpretation) actually meet. Evaluating a term needs two further
ingredients beyond the term itself:

  - a model `M : Model S`, supplying an actual domain and actual
    interpretations of `S`'s function and constant symbols, and
  - an assignment `Variable -> M.Domain`, supplying an actual domain
    element for every variable the term might mention.

A variable evaluates to whatever the assignment says. A constant evaluates
to the model's interpretation of that constant. A function application
evaluates by first evaluating every argument term (recursively, over
strictly smaller terms), then handing the resulting tuple of domain
elements to the model's interpretation of that function symbol -- this is
the exact mirror, one layer up, of what `interpretFunction`/
`interpretConstant` already compute for a single application.
-/

/-- The domain element a term denotes, given a model and an assignment of
domain elements to variables. -/
def evaluateTerm
    {S : Signature} {Variable : Type} (M : Model S) (assignment : Variable -> M.Domain) :
    Term S Variable -> M.Domain
  | .var v => assignment v
  | .const c => M.interpretConstant c
  | .apply f args => M.interpretFunction f (fun i => evaluateTerm M assignment (args i))

end LRA.VolumeI.Logic
