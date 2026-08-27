import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition
import LRA.Order.Lattices.Lattice.Definition

namespace LRA.Order.Interop.AlgebraicLattice

universe u

/--
`OrderFromJoin` TODO

Predicate logic:

  ∀ {Carrier : Type u} (join : LRA.Operation.BinaryEndoOperation Carrier) (a a_1 : Carrier), join a a_1 = a_1

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (join : Carrier → Carrier → Carrier) (a a_1 : Carrier), join a a_1 = a_1

Logical form (Lean):

```lean
def OrderFromJoin {Carrier : Type u}
    (join : LRA.Operation.BinaryEndoOperation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun left right => join left right = right
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
def OrderFromJoin {Carrier : Type u}
    (join : LRA.Operation.BinaryEndoOperation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun left right => join left right = right

/--
`OrderFromMeet` TODO

Predicate logic:

  ∀ {Carrier : Type u} (meet : LRA.Operation.BinaryEndoOperation Carrier) (a a_1 : Carrier), meet a a_1 = a

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (meet : Carrier → Carrier → Carrier) (a a_1 : Carrier), meet a a_1 = a

Logical form (Lean):

```lean
def OrderFromMeet {Carrier : Type u}
    (meet : LRA.Operation.BinaryEndoOperation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun left right => meet left right = left
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
def OrderFromMeet {Carrier : Type u}
    (meet : LRA.Operation.BinaryEndoOperation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun left right => meet left right = left

/--
`AlgebraicLatticeJoinOrderIsOrderLattice` TODO

Predicate logic:

  LRA.Order.Lattice (OrderFromJoin join)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {join meet : Carrier → Carrier → Carrier}, ((∀ (first second third : Carrier), join (join first second) third = join first (join second third) ∧ (∀ (first second : Carrier), join first second = join second first ∧ ∀ (element : Carrier), join element element = element)) ∧ ((∀ (first second third : Carrier), meet (meet first second) third = meet first (meet second third) ∧ (∀ (first second : Carrier), meet first second = meet second first ∧ ∀ (element : Carrier), meet element element = element)) ∧ (∀ (left right : Carrier), join left (meet left right) = left ∧ ∀ (left right : Carrier), meet left (join left right) = left))) → ((∀ (x : Carrier), join x x = x ∧ (∀ (x y : Carrier), join x y = y → join y x = x → x = y ∧ ∀ (x y z : Carrier), join x y = y → join y z = z → join x z = z)) ∧ ∀ (left right : Carrier), (Exists fun join_1 => (join left join_1 = join_1 ∧ (join right join_1 = join_1 ∧ ∀ (upper : Carrier), join left upper = upper → join right upper = upper → join join_1 upper = upper)) ∧ Exists fun meet => (join meet left = left ∧ (join meet right = right ∧ ∀ (lower : Carrier), join lower left = left → join lower right = right → join lower meet = meet))))

Logical form (Lean):

```lean
theorem AlgebraicLatticeJoinOrderIsOrderLattice
    {Carrier : Type u}
    {join meet : LRA.Operation.BinaryEndoOperation Carrier}
    (laws : LRA.AlgebraicStructures.LatticeLaws join meet) :
    LRA.Order.Lattice (OrderFromJoin join)
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
theorem AlgebraicLatticeJoinOrderIsOrderLattice
    {Carrier : Type u}
    {join meet : LRA.Operation.BinaryEndoOperation Carrier}
    (laws : LRA.AlgebraicStructures.LatticeLaws join meet) :
    LRA.Order.Lattice (OrderFromJoin join) := by
  sorry

/--
`AlgebraicLatticeMeetOrderIsOrderLattice` TODO

Predicate logic:

  LRA.Order.Lattice (OrderFromMeet meet)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {join meet : Carrier → Carrier → Carrier}, ((∀ (first second third : Carrier), join (join first second) third = join first (join second third) ∧ (∀ (first second : Carrier), join first second = join second first ∧ ∀ (element : Carrier), join element element = element)) ∧ ((∀ (first second third : Carrier), meet (meet first second) third = meet first (meet second third) ∧ (∀ (first second : Carrier), meet first second = meet second first ∧ ∀ (element : Carrier), meet element element = element)) ∧ (∀ (left right : Carrier), join left (meet left right) = left ∧ ∀ (left right : Carrier), meet left (join left right) = left))) → ((∀ (x : Carrier), meet x x = x ∧ (∀ (x y : Carrier), meet x y = x → meet y x = y → x = y ∧ ∀ (x y z : Carrier), meet x y = x → meet y z = y → meet x z = x)) ∧ ∀ (left right : Carrier), (Exists fun join => (meet left join = left ∧ (meet right join = right ∧ ∀ (upper : Carrier), meet left upper = left → meet right upper = right → meet join upper = join)) ∧ Exists fun meet_1 => (meet meet_1 left = meet_1 ∧ (meet meet_1 right = meet_1 ∧ ∀ (lower : Carrier), meet lower left = lower → meet lower right = lower → meet lower meet_1 = lower))))

Logical form (Lean):

```lean
theorem AlgebraicLatticeMeetOrderIsOrderLattice
    {Carrier : Type u}
    {join meet : LRA.Operation.BinaryEndoOperation Carrier}
    (laws : LRA.AlgebraicStructures.LatticeLaws join meet) :
    LRA.Order.Lattice (OrderFromMeet meet)
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
theorem AlgebraicLatticeMeetOrderIsOrderLattice
    {Carrier : Type u}
    {join meet : LRA.Operation.BinaryEndoOperation Carrier}
    (laws : LRA.AlgebraicStructures.LatticeLaws join meet) :
    LRA.Order.Lattice (OrderFromMeet meet) := by
  sorry

/--
`OrderLatticeOperationsAreAlgebraic` TODO

Predicate logic:

  LRA.AlgebraicStructures.LatticeLaws join meet

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {join meet : Carrier → Carrier → Carrier}, (((∀ (x : Carrier), relation x x ∧ (∀ (x y : Carrier), relation x y → relation y x → x = y ∧ ∀ (x y z : Carrier), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Carrier), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Carrier), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Carrier), relation lower left → relation lower right → relation lower meet)))) ∧ (∀ (left right : Carrier), (relation left (join left right) ∧ (relation right (join left right) ∧ ∀ (upper : Carrier), relation left upper → relation right upper → relation (join left right) upper)) ∧ ∀ (left right : Carrier), (relation (meet left right) left ∧ (relation (meet left right) right ∧ ∀ (lower : Carrier), relation lower left → relation lower right → relation lower (meet left right))))) → ((∀ (first second third : Carrier), join (join first second) third = join first (join second third) ∧ (∀ (first second : Carrier), join first second = join second first ∧ ∀ (element : Carrier), join element element = element)) ∧ ((∀ (first second third : Carrier), meet (meet first second) third = meet first (meet second third) ∧ (∀ (first second : Carrier), meet first second = meet second first ∧ ∀ (element : Carrier), meet element element = element)) ∧ (∀ (left right : Carrier), join left (meet left right) = left ∧ ∀ (left right : Carrier), meet left (join left right) = left)))

Logical form (Lean):

```lean
theorem OrderLatticeOperationsAreAlgebraic
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {join meet : LRA.Operation.BinaryEndoOperation Carrier}
    (orderLattice : LRA.Order.Lattice relation)
    (joinSpec :
      forall left right : Carrier, LRA.Order.Join relation left right (join left right))
    (meetSpec :
      forall left right : Carrier, LRA.Order.Meet relation left right (meet left right)) :
    LRA.AlgebraicStructures.LatticeLaws join meet
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem OrderLatticeOperationsAreAlgebraic
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {join meet : LRA.Operation.BinaryEndoOperation Carrier}
    (orderLattice : LRA.Order.Lattice relation)
    (joinSpec :
      forall left right : Carrier, LRA.Order.Join relation left right (join left right))
    (meetSpec :
      forall left right : Carrier, LRA.Order.Meet relation left right (meet left right)) :
    LRA.AlgebraicStructures.LatticeLaws join meet := by
  sorry

end LRA.Order.Interop.AlgebraicLattice
