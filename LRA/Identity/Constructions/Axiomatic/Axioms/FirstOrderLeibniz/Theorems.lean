import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Axiom
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Axiom

namespace LRA.Identity.Constructions.Axiomatic

/-- The unrestricted second-order Leibniz axiom entails the construction's
model-relative first-order Leibniz principle. This implication does not
replace the independently postulated FOL axiom.

Logical form:
```lean
FirstOrderLeibnizPrinciple Variable M
```
-/
theorem SecondOrderLeibnizImpliesFirstOrderLeibniz
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    FirstOrderLeibnizPrinciple Variable M := by
  sorry

end LRA.Identity.Constructions.Axiomatic
