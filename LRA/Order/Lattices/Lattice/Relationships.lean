import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Lattices.Join.Relationships
import LRA.Order.Lattices.Meet.Relationships
import LRA.Order.Lattices.JoinSemilattice.Definition
import LRA.Order.Lattices.Lattice.Definition
import LRA.Order.Lattices.MeetSemilattice.Definition
import LRA.Order.OrderedSets.PartialOrder.Relationships

namespace LRA.Order

universe u

/--
`LatticeIffJoinAndMeetSemilattice` TODO

Predicate logic:

  Lattice relation ↔ JoinSemilattice relation ∧ MeetSemilattice relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet)))) ↔ (((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper))) ∧ ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet))))

Logical form (Lean):

```lean
theorem LatticeIffJoinAndMeetSemilattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    Lattice relation ↔ JoinSemilattice relation /\ MeetSemilattice relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem LatticeIffJoinAndMeetSemilattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    Lattice relation ↔ JoinSemilattice relation /\ MeetSemilattice relation := by
  sorry

/--
`ConverseIsLatticeIff` TODO

Predicate logic:

  Lattice (LRA.Relation.Converse relation) ↔ Lattice relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation y x → relation x y → x = y ∧ ∀ (x y z : Alpha), relation y x → relation z y → relation z x)) ∧ ∀ (left right : Alpha), (Exists fun join => (relation join left ∧ (relation join right ∧ ∀ (upper : Alpha), relation upper left → relation upper right → relation upper join)) ∧ Exists fun meet => (relation left meet ∧ (relation right meet ∧ ∀ (lower : Alpha), relation left lower → relation right lower → relation meet lower)))) ↔ ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet))))

Logical form (Lean):

```lean
theorem ConverseIsLatticeIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    Lattice (LRA.Relation.Converse relation) ↔ Lattice relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem ConverseIsLatticeIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    Lattice (LRA.Relation.Converse relation) ↔ Lattice relation := by
  sorry

/--
`JoinIffMeetOfDual` TODO

Predicate logic:

  (∀ left right value ∈ Carrier), Join order.relation left right value ↔ Meet (LRA.Order.OrderedSets.PartialOrder.Dual order).relation left right value

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.PartialOrderRelation Carrier) (left right value : Carrier), (order.1 left value ∧ (order.1 right value ∧ ∀ (upper : Carrier), order.1 left upper → order.1 right upper → order.1 value upper)) ↔ ((LRA.Order.OrderedSets.PartialOrder.Dual order).1 value left ∧ ((LRA.Order.OrderedSets.PartialOrder.Dual order).1 value right ∧ ∀ (lower : Carrier), (LRA.Order.OrderedSets.PartialOrder.Dual order).1 lower left → (LRA.Order.OrderedSets.PartialOrder.Dual order).1 lower right → (LRA.Order.OrderedSets.PartialOrder.Dual order).1 lower value))

Logical form (Lean):

```lean
theorem JoinIffMeetOfDual
    {Carrier : Type u}
    (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier)
    (left right value : Carrier) :
    Join order.relation left right value ↔
      Meet (LRA.Order.OrderedSets.PartialOrder.Dual order).relation
        left right value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem JoinIffMeetOfDual
    {Carrier : Type u}
    (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier)
    (left right value : Carrier) :
    Join order.relation left right value ↔
      Meet (LRA.Order.OrderedSets.PartialOrder.Dual order).relation
        left right value := by
  sorry

/--
`MeetIffJoinOfDual` TODO

Predicate logic:

  (∀ left right value ∈ Carrier), Meet order.relation left right value ↔ Join (LRA.Order.OrderedSets.PartialOrder.Dual order).relation left right value

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.PartialOrderRelation Carrier) (left right value : Carrier), (order.1 value left ∧ (order.1 value right ∧ ∀ (lower : Carrier), order.1 lower left → order.1 lower right → order.1 lower value)) ↔ ((LRA.Order.OrderedSets.PartialOrder.Dual order).1 left value ∧ ((LRA.Order.OrderedSets.PartialOrder.Dual order).1 right value ∧ ∀ (upper : Carrier), (LRA.Order.OrderedSets.PartialOrder.Dual order).1 left upper → (LRA.Order.OrderedSets.PartialOrder.Dual order).1 right upper → (LRA.Order.OrderedSets.PartialOrder.Dual order).1 value upper))

Logical form (Lean):

```lean
theorem MeetIffJoinOfDual
    {Carrier : Type u}
    (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier)
    (left right value : Carrier) :
    Meet order.relation left right value ↔
      Join (LRA.Order.OrderedSets.PartialOrder.Dual order).relation
        left right value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem MeetIffJoinOfDual
    {Carrier : Type u}
    (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier)
    (left right value : Carrier) :
    Meet order.relation left right value ↔
      Join (LRA.Order.OrderedSets.PartialOrder.Dual order).relation
        left right value := by
  sorry

end LRA.Order
