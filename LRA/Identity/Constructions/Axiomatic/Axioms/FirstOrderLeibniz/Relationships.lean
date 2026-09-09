import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Definitions
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Axiom

namespace LRA.Identity.Constructions.Axiomatic

/--
`SecondOrderLeibnizImpliesFirstOrderLeibniz` restricts unrestricted Leibniz
transport to the predicates definable in a first-order interpretation.

Logical form:

```lean
theorem SecondOrderLeibnizImpliesFirstOrderLeibniz
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    FirstOrderLeibnizPrinciple Variable M
```
-/
theorem SecondOrderLeibnizImpliesFirstOrderLeibniz
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    FirstOrderLeibnizPrinciple Variable M := by
  intro x y hIdentity Property _ hProperty
  exact Ax_LeibnizLaw hIdentity Property hProperty

end LRA.Identity.Constructions.Axiomatic
