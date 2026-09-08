import LRA.Identity.Constructions.Axiomatic.Axioms.Common
import LRA.Identity.Interface.Logic.FOL.Theory

namespace LRA.Identity.Constructions.Axiomatic

/-- `FirstOrderLeibnizPrinciple` is the construction-local FOL Leibniz
principle for the predicates definable in one explicitly selected model and
variable language.

Logical form:
```lean
LRA.Identity.Logic.FOL.LeibnizSchema
  (LRA.Identity.Logic.FOL.FormulaDefinable Variable M)
  (Ax_IdentityRelation : M.Domain -> M.Domain -> Prop)
```
-/
abbrev FirstOrderLeibnizPrinciple
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) : Prop :=
  LRA.Identity.Logic.FOL.LeibnizSchema
    (LRA.Identity.Logic.FOL.FormulaDefinable Variable M)
    (Ax_IdentityRelation : M.Domain -> M.Domain -> Prop)

end LRA.Identity.Constructions.Axiomatic
