import LRA.Identity.Interface.Logic.SOL.Theory
import LRA.Identity.Interface.Logic.FOL.Language
import LRA.Identity.Interface.ModelTheory.LStructure
import LRA.ModelTheory.SecondOrder.HenkinModel
import LRA.ModelTheory.SecondOrder.Semantics.SOSatisfaction
import LRA.Identity.Interface.Logic.SOL.Syntax

namespace LRA.Identity.ModelTheory.SOL

open LRA.Logic

/-- The admissible unary predicates induced by a Henkin model's arity-one
relation domain.

Logical form: `P` is admissible iff its unary lifting belongs to
`M.RelationDomain 1`.
-/
def UnaryPredicateDomain {S : Signature}
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S) :
    LRA.Identity.Logic.SOL.HenkinPredicateDomain M.Domain where
  Admissible P := (fun arguments => P (arguments 0)) ∈ M.RelationDomain 1

/-- Build a genuinely Henkin second-order model from an equality structure and
explicit relation and function domains. These domains need not be full.

Logical form: the first-order reduct interprets equality by the structure, and
the supplied domains determine the second-order quantifier ranges.
-/
noncomputable def ToHenkinModel
    (E : LRA.Identity.EqualityStructure)
    (RelationDomain : forall arity,
      Set ((Fin arity -> E.Carrier) -> Prop))
    (FunctionDomain : forall arity,
      Set ((Fin arity -> E.Carrier) -> E.Carrier)) :
    LRA.ModelTheory.SecondOrder.HenkinModel
      LRA.Identity.pureEqualitySignature := by
  sorry

/-- `SatisfiesLeibnizIdentity` states that a Henkin model and assignment
satisfy the explicit second-order Leibniz identity formula.

Logical form:
```lean
SOSatisfies M assignment (LeibnizIdentityFormula left right property)
```
-/
def HenkinSatisfiesLeibnizIdentity
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    [DecidableEq Variable]
    [forall arity, DecidableEq (RelationVariable arity)]
    [forall arity, DecidableEq (FunctionVariable arity)]
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S)
    (assignment : LRA.ModelTheory.SecondOrder.SOAssignment M Variable
      RelationVariable FunctionVariable)
    (left right : Variable) (property : RelationVariable 1) : Prop :=
  LRA.ModelTheory.SecondOrder.SOSatisfies M assignment
    (LRA.Identity.Logic.SOL.LeibnizIdentityFormula left right property)

end LRA.Identity.ModelTheory.SOL
