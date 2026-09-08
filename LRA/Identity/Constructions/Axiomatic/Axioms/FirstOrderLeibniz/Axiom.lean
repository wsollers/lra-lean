import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Definitions

namespace LRA.Identity.Constructions.Axiomatic

/-- `Ax_FirstOrderLeibnizLaw` postulates Leibniz substitution for exactly the
unary predicates definable in the selected first-order model and variable
language. It is independent of the unrestricted second-order Leibniz axiom.

Logical form:
```lean
FirstOrderLeibnizPrinciple Variable M
```
-/
axiom Ax_FirstOrderLeibnizLaw
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    FirstOrderLeibnizPrinciple Variable M

end LRA.Identity.Constructions.Axiomatic
