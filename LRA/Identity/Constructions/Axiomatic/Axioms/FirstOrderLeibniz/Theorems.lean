import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Axiom

namespace LRA.Identity.Constructions.Axiomatic

/--
`AxiomaticFirstOrderLeibnizLaw` transports a formula-definable property across
the axiomatic identity relation in a first-order interpretation.

Logical form:

```lean
theorem AxiomaticFirstOrderLeibnizLaw
    {S : LRA.Logic.Signature} {Variable : Type} [DecidableEq Variable]
    {M : LRA.Logic.FirstOrder.Interpretation S} {x y : M.Domain}
    (hIdentity : Ax_IdentityRelation x y) (Property : M.Domain → Prop)
    (hDefinable : LRA.Identity.Logic.FOL.FormulaDefinable Variable M Property) :
    Property x → Property y
```
-/
theorem AxiomaticFirstOrderLeibnizLaw
    {S : LRA.Logic.Signature} {Variable : Type} [DecidableEq Variable]
    {M : LRA.Logic.FirstOrder.Interpretation S} {x y : M.Domain}
    (hIdentity : Ax_IdentityRelation x y) (Property : M.Domain → Prop)
    (hDefinable : LRA.Identity.Logic.FOL.FormulaDefinable Variable M Property) :
    Property x → Property y := by
  intro hProperty
  exact Ax_FirstOrderLeibnizLaw Variable M x y hIdentity Property
    hDefinable hProperty

end LRA.Identity.Constructions.Axiomatic
