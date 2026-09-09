import LRA.Identity.Interface.Logic.SOL.Theory
import LRA.Identity.Interface.ModelTheory.SOL.Full

namespace LRA.Identity.Logic.SOL

universe u

/--
`FullIdentityTheory.IffEquality` TODO

Predicate logic:

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop}, LRA.Identity.Logic.SOL.FullIdentityTheory R → ∀ (x y : Carrier), R x y ↔ x = y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop}, ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), True → P x → P y)) → ∀ (x y : Carrier), R x y ↔ x = y

Logical form (Lean):

```lean
theorem FullIdentityTheory.IffEquality {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop}
    (h : FullIdentityTheory R) (x y : Carrier) : R x y <-> x = y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem FullIdentityTheory.IffEquality {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop}
    (h : FullIdentityTheory R) (x y : Carrier) : R x y <-> x = y := by
  sorry

/--
`FullModelSatisfiesLeibnizIdentity` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} {RelationVariable FunctionVariable : Nat → Type} [inst : DecidableEq Variable] [inst_1 : (arity : Nat) → DecidableEq (RelationVariable arity)] [inst_2 : (arity : Nat) → DecidableEq (FunctionVariable arity)] (M : LRA.ModelTheory.SecondOrder.FullModel S) (assignment : LRA.ModelTheory.SecondOrder.FullSOAssignment M Variable RelationVariable FunctionVariable) (left right : Variable) (property : RelationVariable 1), LRA.Identity.ModelTheory.SOL.FullSatisfiesLeibnizIdentity M assignment left right property

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} {RelationVariable FunctionVariable : Nat → Type} [inst : DecidableEq Variable] [inst_1 : (arity : Nat) → DecidableEq (RelationVariable arity)] [inst_2 : (arity : Nat) → DecidableEq (FunctionVariable arity)] (M : LRA.ModelTheory.SecondOrder.FullModel S) (assignment : LRA.ModelTheory.SecondOrder.FullSOAssignment M Variable RelationVariable FunctionVariable) (left right : Variable) (property : RelationVariable 1), LRA.ModelTheory.SecondOrder.FullSOSatisfies M assignment (LRA.Identity.Logic.SOL.LeibnizIdentityFormula left right property)

Logical form (Lean):

```lean
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
