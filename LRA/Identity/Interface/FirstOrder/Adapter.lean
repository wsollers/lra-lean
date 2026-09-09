import LRA.Identity.Interface.FirstOrder.Theory
import LRA.Identity.Interface.Model

namespace LRA.Identity.Interface.FirstOrder

/--
`Model.ToIdentityModel` forgets first-order syntax while retaining the small
identity model required by ordinary laws. Formula-definability obligations for
the two identity fibers are discharged within this adapter.

Logical form:

```lean
def Model.ToIdentityModel
    {L : LStructure} {Variable : Type} [DecidableEq Variable]
    (M : Model L) (T : Theory L Variable M)
    (hasDistinctVariables : exists left right : Variable, left ≠ right) :
    LRA.Identity.IdentityModel
```
-/
def Model.ToIdentityModel
    {L : LStructure} {Variable : Type} [DecidableEq Variable]
    (M : Model L) (T : Theory L Variable M)
    (hasDistinctVariables : exists left right : Variable, left ≠ right) :
    LRA.Identity.IdentityModel where
  Carrier := M.interpretation.Domain
  Admissible := LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation
  Identity := M.Identity
  theory :=
    { reflexive := T.reflexivity
      leibniz := T.leibniz }
  fibers :=
    { left := IdentityFiberFormulaDefinable hasDistinctVariables M
      right := IdentityRightFiberFormulaDefinable hasDistinctVariables M }

end LRA.Identity.Interface.FirstOrder
