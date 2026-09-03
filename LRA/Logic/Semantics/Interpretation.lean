import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Logic.FirstOrder

universe u

/--
`Interpretation` TODO

Predicate logic:

  structure Interpretation (S : Signature) where
  Domain : Type u
  domainNonempty : Nonempty Domain
  interpretEquality : Domain -> Domain -> Prop

Predicate logic (unfolded):

  structure Interpretation (S : Signature) where
  Domain : Type u
  domainNonempty : Nonempty Domain
  interpretEquality : Domain -> Domain -> Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Interpretation (S : Signature) where
  Domain : Type u
  domainNonempty : Nonempty Domain
  interpretEquality : Domain -> Domain -> Prop
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
structure Interpretation (S : Signature) where
  Domain : Type u
  domainNonempty : Nonempty Domain
  interpretEquality : Domain -> Domain -> Prop := fun left right => left = right
  equalityIsDiagonal :
    ∀ left right, interpretEquality left right ↔ left = right := by
      intro left right
      rfl
  interpretFunction :
    (f : S.FunctionSymbol) -> (Fin (S.functionArity f) -> Domain) -> Domain
  interpretRelation :
    (r : S.RelationSymbol) -> (Fin (S.relationArity r) -> Domain) -> Prop
  interpretConstant :
    S.Constants -> Domain

instance {S : Signature} (M : Interpretation S) : Nonempty M.Domain :=
  M.domainNonempty

end LRA.Logic.FirstOrder
