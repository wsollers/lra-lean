import LRA.Identity.Constructions.Axiomatic.Satisfies.FirstOrder

namespace LRA.Identity.Constructions.Axiomatic.Laws

/--
`FirstOrderIdentitySymmetric` derives symmetry of the axiomatic identity
relation entirely within a coherent first-order model. Equivalently, it uses
the definable atomic property `fun value => Ax_IdentityRelation value x`, not
unrestricted second-order predicate transport.

Logical form:

```lean
theorem FirstOrderIdentitySymmetric
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    {Variable : Type} [DecidableEq Variable]
    (hasDistinctVariables : exists left right : Variable, left ≠ right)
    (I : LRA.Logic.FirstOrder.Interpretation L.signature)
    (hIdentityIsInterpretation : forall left right,
      Ax_IdentityRelation left right <->
        I.interpretRelation L.identitySymbol
          (LRA.Identity.Interface.FirstOrder.BinaryArguments L left right))
    {x y : I.Domain} (hIdentity : Ax_IdentityRelation x y) :
    Ax_IdentityRelation y x
```
-/
theorem FirstOrderIdentitySymmetric
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    {Variable : Type} [DecidableEq Variable]
    (hasDistinctVariables : exists left right : Variable, left ≠ right)
    (I : LRA.Logic.FirstOrder.Interpretation L.signature)
    (hIdentityIsInterpretation : forall left right,
      Ax_IdentityRelation left right <->
        I.interpretRelation L.identitySymbol
          (LRA.Identity.Interface.FirstOrder.BinaryArguments L left right))
    {x y : I.Domain} (hIdentity : Ax_IdentityRelation x y) :
    Ax_IdentityRelation y x := by
  let M : LRA.Identity.Interface.FirstOrder.Model L :=
    { interpretation := I
      Identity := Ax_IdentityRelation
      identityIsInterpretation := hIdentityIsInterpretation }
  have hTheory : LRA.Identity.Interface.FirstOrder.Theory L Variable M :=
    LRA.Identity.Constructions.Axiomatic.SatisfiesFirstOrderIdentity
      Variable I hIdentityIsInterpretation
  have hDefinable :
      LRA.Identity.Logic.FOL.FormulaDefinable Variable I
        (fun value => Ax_IdentityRelation value x) :=
    LRA.Identity.Interface.FirstOrder.IdentityFiberFormulaDefinable
      hasDistinctVariables M x
  have hxx : Ax_IdentityRelation x x := hTheory.reflexivity x
  exact hTheory.leibniz x y hIdentity
    (fun value => Ax_IdentityRelation value x) hDefinable hxx

end LRA.Identity.Constructions.Axiomatic.Laws
