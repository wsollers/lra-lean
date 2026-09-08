import LRA.Identity.Interface.Logic.SOL.Theory
import LRA.Identity.Interface.ModelTheory.SOL.Henkin

namespace LRA.Identity.Logic.SOL

universe u

/-- Henkin identity collapses to ambient equality when the admitted predicates
separate points.

Logical form:
`HenkinIdentityTheory domain R -> SeparatesPoints domain -> R x y -> x = y`.
-/
theorem HenkinIdentityTheory.EqualityOfSeparatingPredicates {Carrier : Type u}
    {domain : HenkinPredicateDomain Carrier}
    {R : Carrier -> Carrier -> Prop}
    (hIdentity : HenkinIdentityTheory domain R)
    (hSeparates : HenkinPredicatesSeparatePoints domain) {x y : Carrier}
    (hxy : R x y) : x = y := by
  sorry

/-- A Henkin model whose admitted unary predicates separate points satisfies
the explicit Leibniz identity formula under every assignment.

Logical form:
```lean
HenkinPredicatesSeparatePoints (UnaryPredicateDomain M) ->
  HenkinSatisfiesLeibnizIdentity M assignment left right property
```
-/
theorem SeparatingHenkinModelSatisfiesLeibnizIdentity
    {S : LRA.Logic.Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat -> Type}
    [DecidableEq Variable]
    [forall arity, DecidableEq (RelationVariable arity)]
    [forall arity, DecidableEq (FunctionVariable arity)]
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S)
    (hSeparates : HenkinPredicatesSeparatePoints
      (LRA.Identity.ModelTheory.SOL.UnaryPredicateDomain M))
    (assignment : LRA.ModelTheory.SecondOrder.SOAssignment M Variable
      RelationVariable FunctionVariable)
    (left right : Variable) (property : RelationVariable 1) :
    LRA.Identity.ModelTheory.SOL.HenkinSatisfiesLeibnizIdentity
      M assignment left right property := by
  sorry

end LRA.Identity.Logic.SOL
