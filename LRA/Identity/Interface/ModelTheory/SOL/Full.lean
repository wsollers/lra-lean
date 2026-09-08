import LRA.Identity.Interface.Logic.SOL.Theory
import LRA.Identity.Interface.Logic.SOL.Syntax
import LRA.ModelTheory.SecondOrder.Semantics.FullSOSatisfaction

namespace LRA.Identity.ModelTheory.SOL

universe u

/-- The predicate domain for full second-order semantics admits every unary
predicate.

Logical form: `forall P, Admissible P`.
-/
def FullPredicateDomain (Carrier : Type u) :
    LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier where
  Admissible := LRA.Identity.FullLeibniz Carrier

/-- `SatisfiesLeibnizIdentity` states that a full second-order model and
assignment satisfy the explicit Leibniz identity formula.

Logical form:
```lean
FullSOSatisfies M assignment (LeibnizIdentityFormula left right property)
```
-/
def FullSatisfiesLeibnizIdentity
    {S : LRA.Logic.Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    [DecidableEq Variable]
    [forall arity, DecidableEq (RelationVariable arity)]
    [forall arity, DecidableEq (FunctionVariable arity)]
    (M : LRA.ModelTheory.SecondOrder.FullModel S)
    (assignment : LRA.ModelTheory.SecondOrder.FullSOAssignment M Variable
      RelationVariable FunctionVariable)
    (left right : Variable) (property : RelationVariable 1) : Prop :=
  LRA.ModelTheory.SecondOrder.FullSOSatisfies M assignment
    (LRA.Identity.Logic.SOL.LeibnizIdentityFormula left right property)

end LRA.Identity.ModelTheory.SOL
