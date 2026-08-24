import LRA.Order.OrderedSets.StrictLinearOrder.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u

/--
`DenseLinearOrder` TODO

Predicate logic:

  ∀ {alpha : Type u} (relation : LRA.Relation.Endorelation alpha), (LRA.Order.StrictLinearOrder relation ∧ LRA.Relation.Dense relation)

Predicate logic (unfolded):

  ∀ {alpha : Type u} (relation : alpha → alpha → Prop), (((∀ (x : alpha), relation x x → False ∧ ∀ (x y z : alpha), relation x y → relation y z → relation x z) ∧ ∀ (x y : alpha), Or ((relation x y ∧ (x = y → False ∧ relation y x → False))) (Or ((x = y ∧ (relation x y → False ∧ relation y x → False))) ((relation y x ∧ (relation x y → False ∧ x = y → False))))) ∧ ∀ (x y : alpha), relation x y → Exists fun z => (relation x z ∧ relation z y))

Logical form (Lean):

```lean
def DenseLinearOrder {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  StrictLinearOrder relation /\ LRA.Relation.Dense relation
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
def DenseLinearOrder {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  StrictLinearOrder relation /\ LRA.Relation.Dense relation

end LRA.Order
