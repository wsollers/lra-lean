import LRA.Order.OrderedSets.StrictOrder.Definition
import LRA.Relation.Interface.Laws.Definition

namespace LRA.Order

universe u

/--
`DenseOrder` TODO

Predicate logic:

  ∀ {alpha : Type u} (relation : LRA.Relation.Endorelation alpha), (LRA.Order.StrictOrder relation ∧ LRA.Relation.Dense relation)

Predicate logic (unfolded):

  ∀ {alpha : Type u} (relation : alpha → alpha → Prop), ((∀ (x : alpha), relation x x → False ∧ ∀ (x y z : alpha), relation x y → relation y z → relation x z) ∧ ∀ (x y : alpha), relation x y → Exists fun z => (relation x z ∧ relation z y))

Logical form (Lean):

```lean
def DenseOrder {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  StrictOrder relation /\ LRA.Relation.Dense relation
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
def DenseOrder {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  StrictOrder relation /\ LRA.Relation.Dense relation

/--
`DenseOrderLaw` TODO

Predicate logic:

  class DenseOrderLaw (R : Type u) [LT R] : Prop where
  ExistsBetween :
    forall a b : R, a < b -> exists middle : R, a < middle /\ middle < b

Predicate logic (unfolded):

  class DenseOrderLaw (R : Type u) [LT R] : Prop where
  ExistsBetween :
    forall a b : R, a < b -> exists middle : R, a < middle /\ middle < b (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class DenseOrderLaw (R : Type u) [LT R] : Prop where
  ExistsBetween :
    forall a b : R, a < b -> exists middle : R, a < middle /\ middle < b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
class DenseOrderLaw (R : Type u) [LT R] : Prop where
  ExistsBetween :
    forall a b : R, a < b -> exists middle : R, a < middle /\ middle < b

section Wrappers

variable {R : Type u}

/--
`ExistsBetween` TODO

Predicate logic:

  forall a b : R, a < b -> exists middle : R, a < middle ∧ middle < b

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LT R], LRA.Order.DenseOrderLaw R → ∀ (a b : R), inst.1 a b → Exists fun middle => (inst.1 a middle ∧ inst.1 middle b)

Logical form (Lean):

```lean
theorem ExistsBetween [LT R] [DenseOrderLaw R] :
    forall a b : R, a < b -> exists middle : R, a < middle /\ middle < b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem ExistsBetween [LT R] [DenseOrderLaw R] :
    forall a b : R, a < b -> exists middle : R, a < middle /\ middle < b := by
  sorry
end Wrappers

end LRA.Order
