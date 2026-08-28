import LRA.Relation.Interface.Definitions

namespace LRA.Order

universe u

/--
`GreaterThan` TODO

Predicate logic:

  ∀ {alpha : Type u} (strictRelation : LRA.Relation.Endorelation alpha) (a a_1 : alpha), strictRelation a_1 a

Predicate logic (unfolded):

  ∀ {alpha : Type u} (strictRelation : alpha → alpha → Prop) (a a_1 : alpha), strictRelation a_1 a

Logical form (Lean):

```lean
def GreaterThan {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => strictRelation right left
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
def GreaterThan {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => strictRelation right left

end LRA.Order
