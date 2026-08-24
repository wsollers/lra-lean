import LRA.Relation.Definition

namespace LRA.Relation
universe u v

/--
`Converse` TODO

Predicate logic:

  ∀ {α : Type u} {β : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation α β) (a : β) (a_1 : α), R a_1 a

Predicate logic (unfolded):

  ∀ {α : Type u} {β : Type v} (R : α → β → Prop) (a : β) (a_1 : α), R a_1 a

Logical form (Lean):

```lean
def Converse {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : HeterogeneousBinaryRelation β α :=
  fun y x => R x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def Converse {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : HeterogeneousBinaryRelation β α :=
  fun y x => R x y

end LRA.Relation
