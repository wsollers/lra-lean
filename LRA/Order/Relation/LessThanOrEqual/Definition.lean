import LRA.Relation.Interface.Definitions

namespace LRA.Order

universe u

/--
`LessThanOrEqual` TODO

Predicate logic:

  ∀ {alpha : Type u} (strictRelation : LRA.Relation.Endorelation alpha) (a a_1 : alpha), Or (strictRelation a a_1) (a = a_1)

Predicate logic (unfolded):

  ∀ {alpha : Type u} (strictRelation : alpha → alpha → Prop) (a a_1 : alpha), Or (strictRelation a a_1) (a = a_1)

Logical form (Lean):

```lean
def LessThanOrEqual {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => strictRelation left right \/ left = right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def LessThanOrEqual {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => strictRelation left right \/ left = right

end LRA.Order
