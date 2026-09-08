import LRA.Identity.Interface.Logic.SOL.Theory
import LRA.Identity.Interface.ModelTheory.SOL.Full

namespace LRA.Identity.Logic.SOL

universe u

/-- Full second-order identity is exactly the diagonal relation.

Logical form: `FullIdentityTheory R -> (R x y <-> x = y)`.
-/
theorem FullIdentityTheory.IffEquality {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop}
    (h : FullIdentityTheory R) (x y : Carrier) : R x y <-> x = y := by
  sorry

/-- Every full second-order model satisfies the explicit Leibniz identity
formula under every assignment.

Logical form:
```lean
FullSatisfiesLeibnizIdentity M assignment left right property
```
-/
theorem FullModelSatisfiesLeibnizIdentity
    {S : LRA.Logic.Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    [DecidableEq Variable]
    [forall arity, DecidableEq (RelationVariable arity)]
    [forall arity, DecidableEq (FunctionVariable arity)]
    (M : LRA.ModelTheory.SecondOrder.FullModel S)
    (assignment : LRA.ModelTheory.SecondOrder.FullSOAssignment M Variable
      RelationVariable FunctionVariable)
    (left right : Variable) (property : RelationVariable 1) :
    LRA.Identity.ModelTheory.SOL.FullSatisfiesLeibnizIdentity
      M assignment left right property := by
  sorry

end LRA.Identity.Logic.SOL
