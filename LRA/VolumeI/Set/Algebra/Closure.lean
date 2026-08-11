/-
Resurrected from `hold/Set/Algebra/` with the record-dependent sections
(`FromOperations` / `fromBooleanOperations` constructors against the retired
`PublicSetOperations`-family records) removed. The signature/laws/model
bundles are self-contained: a collection algebra is a first-class object,
so bundling is appropriate here, unlike for set backends. Modern
`fromBackend` constructors against the capability classes
(`Membership`/`Union`/.../`HasComplement`) are the planned replacement for
the removed sections.
-/

universe u v w

namespace LRA.VolumeI.Set.Algebra

/-!
Generic closure predicates for collections of set-objects.

These predicates are independent of any particular backend. They express the
common algebraic pattern: a collection is closed when applying an operation to
members of the collection returns another member of the collection.
-/

/-- A collection of objects from a carrier.

Logical form:

```lean
abbrev Collection (Carrier : Type u) := Carrier → Prop
```
-/
abbrev Collection (Carrier : Type u) := Carrier → Prop

/-- Membership in a collection.

Logical form:

```lean
def Contains {Carrier : Type u} (collection : Collection Carrier)
    (object : Carrier) : Prop :=
  collection object
```
-/
def Contains {Carrier : Type u} (collection : Collection Carrier)
    (object : Carrier) : Prop :=
  collection object

/-- A collection contains every object satisfying a predicate.

Logical form:

```lean
def ContainsPredicate {Carrier : Type u} (collection : Collection Carrier)
    (predicate : Carrier → Prop) : Prop :=
  ∀ object, predicate object → collection object
```
-/
def ContainsPredicate {Carrier : Type u} (collection : Collection Carrier)
    (predicate : Carrier → Prop) : Prop :=
  ∀ object, predicate object → collection object

/-- A collection is closed under a nullary operation when it contains the
distinguished object.

Logical form:

```lean
def ClosedUnderNullary {Carrier : Type u} (collection : Collection Carrier)
    (object : Carrier) : Prop :=
  collection object
```
-/
def ClosedUnderNullary {Carrier : Type u} (collection : Collection Carrier)
    (object : Carrier) : Prop :=
  collection object

/-- Closure under unary operations.

Logical form:

```lean
def ClosedUnderUnary {Carrier : Type u} (collection : Collection Carrier)
    (operation : Carrier → Carrier) : Prop :=
  ∀ object, collection object → collection (operation object)
```
-/
def ClosedUnderUnary {Carrier : Type u} (collection : Collection Carrier)
    (operation : Carrier → Carrier) : Prop :=
  ∀ object, collection object → collection (operation object)

/-- Closure under binary operations.

Logical form:

```lean
def ClosedUnderBinary {Carrier : Type u} (collection : Collection Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ left right,
    collection left → collection right → collection (operation left right)
```
-/
def ClosedUnderBinary {Carrier : Type u} (collection : Collection Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ left right,
    collection left → collection right → collection (operation left right)

/-- Closure under indexed operations over an arbitrary index carrier.

Logical form:

```lean
def ClosedUnderIndexed {Carrier : Type u} (collection : Collection Carrier)
    {Index : Type w} (operation : (Index → Carrier) → Carrier) : Prop :=
  ∀ family,
    (∀ index, collection (family index)) →
      collection (operation family)
```
-/
def ClosedUnderIndexed {Carrier : Type u} (collection : Collection Carrier)
    {Index : Type w} (operation : (Index → Carrier) → Carrier) : Prop :=
  ∀ family,
    (∀ index, collection (family index)) →
      collection (operation family)

/-- Closure under countable operations.

Logical form:

```lean
def ClosedUnderCountable {Carrier : Type u} (collection : Collection Carrier)
    (operation : (Nat → Carrier) → Carrier) : Prop :=
  ClosedUnderIndexed collection operation
```
-/
def ClosedUnderCountable {Carrier : Type u} (collection : Collection Carrier)
    (operation : (Nat → Carrier) → Carrier) : Prop :=
  ClosedUnderIndexed collection operation

/-- Closure under finite list operations.

Logical form:

```lean
def ClosedUnderFinite {Carrier : Type u} (collection : Collection Carrier)
    (operation : List Carrier → Carrier) : Prop :=
  ∀ objects,
    (∀ object, object ∈ objects → collection object) →
      collection (operation objects)
```
-/
def ClosedUnderFinite {Carrier : Type u} (collection : Collection Carrier)
    (operation : List Carrier → Carrier) : Prop :=
  ∀ objects,
    (∀ object, object ∈ objects → collection object) →
      collection (operation objects)

end LRA.VolumeI.Set.Algebra
