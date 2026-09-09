import LRA.Order.Lattices.JoinSemilattice.Definition
import LRA.AlgebraicStructures.JoinSemilattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.JoinSemilattice.Constructions

universe u

/--
`InducedOrder` The order induced by an algebraic join: `x ≤ y ↔ x ∨ y = y`.

Predicate logic:

  ∀ {Carrier : Type u} (join : LRA.Operation.BinaryEndoOperation Carrier) (a a_1 : Carrier), join a a_1 = a_1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    join a a_1 = a_1

Logical form (Lean):

```lean
def InducedOrder {Carrier : Type u} (join : LRA.Operation.BinaryEndoOperation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun x y => join x y = y
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
def InducedOrder {Carrier : Type u} (join : LRA.Operation.BinaryEndoOperation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun x y => join x y = y

/--
`inducedOrder_isPartialOrder` Reflexivity is idempotence, antisymmetry is commutativity, transitivity is associativity — the three algebraic axioms are exactly what's needed to make `InducedOrder` a partial order.

Predicate logic:

  ∀ {Carrier : Type u} {join : LRA.Operation.BinaryEndoOperation Carrier}, LRA.AlgebraicStructures.JoinSemilatticeLaws join → LRA.Order.PartialOrder (LRA.AlgebraicStructures.JoinSemilattice.Constructions.InducedOrder join)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    join : LRA.Operation.BinaryEndoOperation Carrier
    h : JoinSemilatticeLaws join
  Prove
    ((∀ (first second third : Carrier), join (join first second) third = join first (join second third)) ∧ ((∀ (first second : Carrier), join first second = join second first) ∧ (∀ (element : Carrier), join element element = element))) → ((∀ (x : Carrier), join x x = x) ∧ ((∀ (x y : Carrier), join x y = y → join y x = x → x = y) ∧ (∀ (x y z : Carrier), join x y = y → join y z = z → join x z = z)))

Logical form (Lean):

```lean
theorem inducedOrder_isPartialOrder {Carrier : Type u}
    {join : LRA.Operation.BinaryEndoOperation Carrier}
    (h : JoinSemilatticeLaws join) :
    LRA.Order.PartialOrder (InducedOrder join)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem inducedOrder_isPartialOrder {Carrier : Type u}
    {join : LRA.Operation.BinaryEndoOperation Carrier}
    (h : JoinSemilatticeLaws join) :
    LRA.Order.PartialOrder (InducedOrder join) := by
  sorry
/--
`inducedOrder_hasJoins` `join left right` is genuinely the least upper bound under `InducedOrder` — the other direction of the equivalence the algebraic and order-theoretic definitions of a join-semilattice describe.

Predicate logic:

  ∀ {Carrier : Type u} {join : LRA.Operation.BinaryEndoOperation Carrier}, LRA.AlgebraicStructures.JoinSemilatticeLaws join → ∀ (left right : Carrier), Exists fun j => LRA.Order.Join (LRA.AlgebraicStructures.JoinSemilattice.Constructions.InducedOrder join) left right j

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    join : LRA.Operation.BinaryEndoOperation Carrier
    h : JoinSemilatticeLaws join
  Prove
    ((∀ (first second third : Carrier), join (join first second) third = join first (join second third)) ∧ ((∀ (first second : Carrier), join first second = join second first) ∧ (∀ (element : Carrier), join element element = element))) → ∀ (left right : Carrier), Exists fun j => (join left j = j ∧ (join right j = j ∧ (∀ (upper : Carrier), join left upper = upper → join right upper = upper → join j upper = upper)))

Logical form (Lean):

```lean
theorem inducedOrder_hasJoins {Carrier : Type u}
    {join : LRA.Operation.BinaryEndoOperation Carrier}
    (h : JoinSemilatticeLaws join) :
    ∀ left right, ∃ j, LRA.Order.Join (InducedOrder join) left right j
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem inducedOrder_hasJoins {Carrier : Type u}
    {join : LRA.Operation.BinaryEndoOperation Carrier}
    (h : JoinSemilatticeLaws join) :
    ∀ left right, ∃ j, LRA.Order.Join (InducedOrder join) left right j := by
  sorry
/--
`toOrderTheoreticJoinSemilattice` The equivalence itself: an algebraic join-semilattice's induced order is an order-theoretic join-semilattice — matching `LRA.Order.JoinSemilattice` directly, so both definitions of this subject are now actually connected.

Predicate logic:

  ∀ {Carrier : Type u} {join : LRA.Operation.BinaryEndoOperation Carrier}, LRA.AlgebraicStructures.JoinSemilatticeLaws join → LRA.Order.JoinSemilattice (LRA.AlgebraicStructures.JoinSemilattice.Constructions.InducedOrder join)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    join : LRA.Operation.BinaryEndoOperation Carrier
    h : JoinSemilatticeLaws join
  Prove
    ((∀ (first second third : Carrier), join (join first second) third = join first (join second third)) ∧ ((∀ (first second : Carrier), join first second = join second first) ∧ (∀ (element : Carrier), join element element = element))) → (((∀ (x : Carrier), join x x = x) ∧ ((∀ (x y : Carrier), join x y = y → join y x = x → x = y) ∧ (∀ (x y z : Carrier), join x y = y → join y z = z → join x z = z))) ∧ (∀ (left right : Carrier), Exists fun join_1 => (join left join_1 = join_1 ∧ (join right join_1 = join_1 ∧ (∀ (upper : Carrier), join left upper = upper → join right upper = upper → join join_1 upper = upper)))))

Logical form (Lean):

```lean
theorem toOrderTheoreticJoinSemilattice {Carrier : Type u}
    {join : LRA.Operation.BinaryEndoOperation Carrier}
    (h : JoinSemilatticeLaws join) :
    LRA.Order.JoinSemilattice (InducedOrder join)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem toOrderTheoreticJoinSemilattice {Carrier : Type u}
    {join : LRA.Operation.BinaryEndoOperation Carrier}
    (h : JoinSemilatticeLaws join) :
    LRA.Order.JoinSemilattice (InducedOrder join) := by
  sorry
end LRA.AlgebraicStructures.JoinSemilattice.Constructions
