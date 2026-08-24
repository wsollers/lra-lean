
universe u v w

namespace LRA.SetSystems

/--
`Collection` TODO

Predicate logic:

  abbrev Collection (Carrier : Type u) := Carrier → Prop

Predicate logic (unfolded):

  abbrev Collection (Carrier : Type u) := Carrier → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Collection (Carrier : Type u) := Carrier → Prop
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
abbrev Collection (Carrier : Type u) := Carrier → Prop

/--
`Contains` TODO

Predicate logic:

  ∀ {Carrier : Type u} (collection : LRA.SetSystems.Collection Carrier) (object : Carrier), collection object

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (collection : Carrier → Prop) (object : Carrier), collection object

Logical form (Lean):

```lean
def Contains {Carrier : Type u} (collection : Collection Carrier)
    (object : Carrier) : Prop :=
  collection object
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
def Contains {Carrier : Type u} (collection : Collection Carrier)
    (object : Carrier) : Prop :=
  collection object

/--
`ContainsPredicate` TODO

Predicate logic:

  ∀ {Carrier : Type u} (collection : LRA.SetSystems.Collection Carrier) (predicate : Carrier → Prop) (object : Carrier), predicate object → collection object

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (collection predicate : Carrier → Prop) (object : Carrier), predicate object → collection object

Logical form (Lean):

```lean
def ContainsPredicate {Carrier : Type u} (collection : Collection Carrier)
    (predicate : Carrier → Prop) : Prop :=
  ∀ object, predicate object → collection object
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def ContainsPredicate {Carrier : Type u} (collection : Collection Carrier)
    (predicate : Carrier → Prop) : Prop :=
  ∀ object, predicate object → collection object

/--
`ClosedUnderNullary` TODO

Predicate logic:

  ∀ {Carrier : Type u} (collection : LRA.SetSystems.Collection Carrier) (object : Carrier), collection object

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (collection : Carrier → Prop) (object : Carrier), collection object

Logical form (Lean):

```lean
def ClosedUnderNullary {Carrier : Type u} (collection : Collection Carrier)
    (object : Carrier) : Prop :=
  collection object
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
def ClosedUnderNullary {Carrier : Type u} (collection : Collection Carrier)
    (object : Carrier) : Prop :=
  collection object

/--
`ClosedUnderUnary` TODO

Predicate logic:

  ∀ {Carrier : Type u} (collection : LRA.SetSystems.Collection Carrier) (operation : Carrier → Carrier) (object : Carrier), collection object → collection (operation object)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (collection : Carrier → Prop) (operation : Carrier → Carrier) (object : Carrier), collection object → collection (operation object)

Logical form (Lean):

```lean
def ClosedUnderUnary {Carrier : Type u} (collection : Collection Carrier)
    (operation : Carrier → Carrier) : Prop :=
  ∀ object, collection object → collection (operation object)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def ClosedUnderUnary {Carrier : Type u} (collection : Collection Carrier)
    (operation : Carrier → Carrier) : Prop :=
  ∀ object, collection object → collection (operation object)

/--
`ClosedUnderBinary` TODO

Predicate logic:

  ∀ {Carrier : Type u} (collection : LRA.SetSystems.Collection Carrier) (operation : Carrier → Carrier → Carrier) (left right : Carrier), (collection left ∧ collection right) → collection (operation left right)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (collection : Carrier → Prop) (operation : Carrier → Carrier → Carrier) (left right : Carrier), (collection left ∧ collection right) → collection (operation left right)

Logical form (Lean):

```lean
def ClosedUnderBinary {Carrier : Type u} (collection : Collection Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ left right,
    collection left → collection right → collection (operation left right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def ClosedUnderBinary {Carrier : Type u} (collection : Collection Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ left right,
    collection left → collection right → collection (operation left right)

/--
`ClosedUnderIndexed` TODO

Predicate logic:

  ∀ {Carrier : Type u} (collection : LRA.SetSystems.Collection Carrier) {Index : Type w} (operation : (Index → Carrier) → Carrier) (family : Index → Carrier), (∀ (index : Index), collection (family index)) → collection (operation family)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (collection : Carrier → Prop) {Index : Type w} (operation : (Index → Carrier) → Carrier) (family : Index → Carrier), (∀ (index : Index), collection (family index)) → collection (operation family)

Logical form (Lean):

```lean
def ClosedUnderIndexed {Carrier : Type u} (collection : Collection Carrier)
    {Index : Type w} (operation : (Index → Carrier) → Carrier) : Prop :=
  ∀ family,
    (∀ index, collection (family index)) →
      collection (operation family)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def ClosedUnderIndexed {Carrier : Type u} (collection : Collection Carrier)
    {Index : Type w} (operation : (Index → Carrier) → Carrier) : Prop :=
  ∀ family,
    (∀ index, collection (family index)) →
      collection (operation family)

/--
`ClosedUnderCountable` TODO

Predicate logic:

  ∀ {Carrier : Type u} (collection : LRA.SetSystems.Collection Carrier) (operation : (Nat → Carrier) → Carrier) (family : Nat → Carrier), (∀ (index : Nat), collection (family index)) → collection (operation family)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (collection : Carrier → Prop) (operation : (Nat → Carrier) → Carrier) (family : Nat → Carrier), (∀ (index : Nat), collection (family index)) → collection (operation family)

Logical form (Lean):

```lean
def ClosedUnderCountable {Carrier : Type u} (collection : Collection Carrier)
    (operation : (Nat → Carrier) → Carrier) : Prop :=
  ClosedUnderIndexed collection operation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def ClosedUnderCountable {Carrier : Type u} (collection : Collection Carrier)
    (operation : (Nat → Carrier) → Carrier) : Prop :=
  ClosedUnderIndexed collection operation

/--
`ClosedUnderFinite` TODO

Predicate logic:

  ∀ {Carrier : Type u} (collection : LRA.SetSystems.Collection Carrier) (operation : List Carrier → Carrier) (objects : List Carrier), (∀ (object : Carrier), List.instMembership.mem objects object → collection object) → collection (operation objects)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (collection : Carrier → Prop) (operation : List Carrier → Carrier) (objects : List Carrier), (∀ (object : Carrier), List.instMembership.1 objects object → collection object) → collection (operation objects)

Logical form (Lean):

```lean
def ClosedUnderFinite {Carrier : Type u} (collection : Collection Carrier)
    (operation : List Carrier → Carrier) : Prop :=
  ∀ objects,
    (∀ object, object ∈ objects → collection object) →
      collection (operation objects)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def ClosedUnderFinite {Carrier : Type u} (collection : Collection Carrier)
    (operation : List Carrier → Carrier) : Prop :=
  ∀ objects,
    (∀ object, object ∈ objects → collection object) →
      collection (operation objects)

end LRA.SetSystems
