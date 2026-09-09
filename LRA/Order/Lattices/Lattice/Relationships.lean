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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Order.Lattice relation ↔ (LRA.Order.JoinSemilattice relation ∧ LRA.Order.MeetSemilattice relation)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
  Prove
    LRA.Order.Lattice relation ↔ (LRA.Order.JoinSemilattice relation ∧ LRA.Order.MeetSemilattice relation)

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

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Order.Lattice (LRA.Relation.Converse relation) ↔ LRA.Order.Lattice relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
  Prove
    LRA.Order.Lattice (LRA.Relation.Converse relation) ↔ LRA.Order.Lattice relation

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

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier) (left right value : Carrier), LRA.Order.Join order.relation left right value ↔ LRA.Order.Meet (LRA.Order.OrderedSets.PartialOrder.Dual order).relation left right value

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier
    left right value : Carrier
  Prove
    LRA.Order.Join order.relation left right value ↔ LRA.Order.Meet (LRA.Order.OrderedSets.PartialOrder.Dual order).relation left right value

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

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier) (left right value : Carrier), LRA.Order.Meet order.relation left right value ↔ LRA.Order.Join (LRA.Order.OrderedSets.PartialOrder.Dual order).relation left right value

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier
    left right value : Carrier
  Prove
    LRA.Order.Meet order.relation left right value ↔ LRA.Order.Join (LRA.Order.OrderedSets.PartialOrder.Dual order).relation left right value

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
