import LRA.Identity.Interface.Logic.SOL.Theory
import LRA.Identity.Interface.ModelTheory.SOL.Henkin

namespace LRA.Identity.Logic.SOL

universe u

/--
`HenkinIdentityTheory.EqualityOfSeparatingPredicates` TODO

Predicate logic:

  ∀ {Carrier : Type u} {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier} {R : Carrier → Carrier → Prop}, (LRA.Identity.Logic.SOL.HenkinIdentityTheory domain R ∧ LRA.Identity.Logic.SOL.HenkinPredicatesSeparatePoints domain) → ∀ {x y : Carrier}, R x y → x = y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier} {R : Carrier → Carrier → Prop}, (((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), domain.Admissible P → P x → P y)) ∧ (∀ (x y : Carrier), (∀ (P : Carrier → Prop), domain.Admissible P → P x ↔ P y) → x = y)) → ∀ {x y : Carrier}, R x y → x = y

Logical form (Lean):

```lean
theorem HenkinIdentityTheory.EqualityOfSeparatingPredicates {Carrier : Type u}
    {domain : HenkinPredicateDomain Carrier}
    {R : Carrier -> Carrier -> Prop}
    (hIdentity : HenkinIdentityTheory domain R)
    (hSeparates : HenkinPredicatesSeparatePoints domain) {x y : Carrier}
    (hxy : R x y) : x = y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem HenkinIdentityTheory.EqualityOfSeparatingPredicates {Carrier : Type u}
    {domain : HenkinPredicateDomain Carrier}
    {R : Carrier -> Carrier -> Prop}
    (hIdentity : HenkinIdentityTheory domain R)
    (hSeparates : HenkinPredicatesSeparatePoints domain) {x y : Carrier}
    (hxy : R x y) : x = y := by
  sorry

/--
`SeparatingHenkinModelSatisfiesLeibnizIdentity` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} {RelationVariable FunctionVariable : Nat → Type} [inst : DecidableEq Variable] [inst_1 : (arity : Nat) → DecidableEq (RelationVariable arity)] [inst_2 : (arity : Nat) → DecidableEq (FunctionVariable arity)] (M : LRA.ModelTheory.SecondOrder.HenkinModel S), LRA.Identity.Logic.SOL.HenkinPredicatesSeparatePoints (LRA.Identity.ModelTheory.SOL.UnaryPredicateDomain M) → ∀ (assignment : LRA.ModelTheory.SecondOrder.SOAssignment M Variable RelationVariable FunctionVariable) (left right : Variable) (property : RelationVariable 1), LRA.Identity.ModelTheory.SOL.HenkinSatisfiesLeibnizIdentity M assignment left right property

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} {RelationVariable FunctionVariable : Nat → Type} [inst : DecidableEq Variable] [inst_1 : (arity : Nat) → DecidableEq (RelationVariable arity)] [inst_2 : (arity : Nat) → DecidableEq (FunctionVariable arity)] (M : LRA.ModelTheory.SecondOrder.HenkinModel S), (∀ (x y : M.Domain), (∀ (P : M.Domain → Prop), (LRA.Identity.ModelTheory.SOL.UnaryPredicateDomain M).Admissible P → P x ↔ P y) → x = y) → ∀ (assignment : LRA.ModelTheory.SecondOrder.SOAssignment M Variable RelationVariable FunctionVariable) (left right : Variable) (property : RelationVariable 1), LRA.ModelTheory.SecondOrder.SOSatisfies M assignment (LRA.Identity.Logic.SOL.LeibnizIdentityFormula left right property)

Logical form (Lean):

```lean
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
      M assignment left right property
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

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
