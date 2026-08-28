import LRA.Relation.Interface.Definitions

namespace LRA.Order

universe u

/--
`StrictPart` TODO

Predicate logic:

  ∀ {alpha : Type u} (nonStrictRelation : LRA.Relation.Endorelation alpha) (a a_1 : alpha), (nonStrictRelation a a_1 ∧ Ne a a_1)

Predicate logic (unfolded):

  ∀ {alpha : Type u} (nonStrictRelation : alpha → alpha → Prop) (a a_1 : alpha), (nonStrictRelation a a_1 ∧ a = a_1 → False)

Logical form (Lean):

```lean
def StrictPart {alpha : Type u}
    (nonStrictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => nonStrictRelation left right /\ left ≠ right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def StrictPart {alpha : Type u}
    (nonStrictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => nonStrictRelation left right /\ left ≠ right

end LRA.Order
