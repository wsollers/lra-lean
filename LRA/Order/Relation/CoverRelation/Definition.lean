import LRA.Relation.Interface.Definitions

namespace LRA.Order

universe u

/--
`CoverRelation` TODO

Predicate logic:

  ∀ {alpha : Type u} (strictRelation : LRA.Relation.Endorelation alpha) (a a_1 : alpha), (strictRelation a a_1 ∧ ∀ (middle : alpha), ¬ (strictRelation a middle ∧ strictRelation middle a_1))

Predicate logic (unfolded):

  ∀ {alpha : Type u} (strictRelation : alpha → alpha → Prop) (a a_1 : alpha), (strictRelation a a_1 ∧ ∀ (middle : alpha), (strictRelation a middle ∧ strictRelation middle a_1) → False)

Logical form (Lean):

```lean
def CoverRelation {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun lower upper =>
    strictRelation lower upper /\
      forall middle,
        Not (strictRelation lower middle /\ strictRelation middle upper)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def CoverRelation {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun lower upper =>
    strictRelation lower upper /\
      forall middle,
        Not (strictRelation lower middle /\ strictRelation middle upper)

end LRA.Order
