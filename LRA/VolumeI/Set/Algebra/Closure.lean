import LRA.VolumeI.Set.Operations.Boolean
import LRA.VolumeI.Set.Operations.Indexed

universe u v w

namespace LRA.VolumeI.Set.Algebra

/-!
Generic closure predicates for collections of set-objects.

These predicates are independent of any particular backend. They express the
common algebraic pattern: a collection is closed when applying an operation to
members of the collection returns another member of the collection.
-/

/-- A collection of objects from a carrier. -/
abbrev Collection (Carrier : Type u) := Carrier → Prop

/-- Membership in a collection. -/
def Contains {Carrier : Type u} (collection : Collection Carrier)
    (object : Carrier) : Prop :=
  collection object

/-- A collection contains every object satisfying a predicate. -/
def ContainsPredicate {Carrier : Type u} (collection : Collection Carrier)
    (predicate : Carrier → Prop) : Prop :=
  ∀ object, predicate object → collection object

/-- A collection is closed under a nullary operation when it contains the
distinguished object. -/
def ClosedUnderNullary {Carrier : Type u} (collection : Collection Carrier)
    (object : Carrier) : Prop :=
  collection object

/-- Closure under unary operations. -/
def ClosedUnderUnary {Carrier : Type u} (collection : Collection Carrier)
    (operation : Carrier → Carrier) : Prop :=
  ∀ object, collection object → collection (operation object)

/-- Closure under binary operations. -/
def ClosedUnderBinary {Carrier : Type u} (collection : Collection Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ left right,
    collection left → collection right → collection (operation left right)

/-- Closure under indexed operations over an arbitrary index carrier. -/
def ClosedUnderIndexed {Carrier : Type u} (collection : Collection Carrier)
    {Index : Type w} (operation : (Index → Carrier) → Carrier) : Prop :=
  ∀ family,
    (∀ index, collection (family index)) →
      collection (operation family)

/-- Closure under countable operations. -/
def ClosedUnderCountable {Carrier : Type u} (collection : Collection Carrier)
    (operation : (Nat → Carrier) → Carrier) : Prop :=
  ClosedUnderIndexed collection operation

/-- Closure under finite list operations. -/
def ClosedUnderFinite {Carrier : Type u} (collection : Collection Carrier)
    (operation : List Carrier → Carrier) : Prop :=
  ∀ objects,
    (∀ object, object ∈ objects → collection object) →
      collection (operation objects)

namespace FromOperations

open LRA.VolumeI.Set.Operations

/-- A collection is closed under the core finite set operations. -/
structure CoreClosed (operations : PublicSetOperations.{u, v})
    (collection : Collection operations.SetObject) : Prop where
  empty : ClosedUnderNullary collection operations.empty
  singleton :
    ∀ element, collection (operations.singleton element)
  pair :
    ∀ left right, collection (operations.pair left right)
  union : ClosedUnderBinary collection operations.union
  intersection : ClosedUnderBinary collection operations.intersection

/-- A collection is closed under Boolean set operations. -/
structure BooleanClosed (operations : BooleanSetOperations.{u, v})
    (collection : Collection operations.SetObject) : Prop
    extends CoreClosed operations.toPublicSetOperations collection where
  universal : ClosedUnderNullary collection operations.universal
  complement : ClosedUnderUnary collection operations.complement
  difference : ClosedUnderBinary collection operations.difference
  symmetricDifference : ClosedUnderBinary collection operations.symmetricDifference

/-- A collection is closed under indexed set operations. -/
structure IndexedClosed (operations : IndexedSetOperations.{u, v})
    (collection : Collection operations.SetObject) : Prop
    extends CoreClosed operations.toPublicSetOperations collection where
  indexedUnion :
    ∀ {Index : Type u}, ClosedUnderIndexed collection (@operations.indexedUnion Index)
  indexedIntersection :
    ∀ {Index : Type u}, ClosedUnderIndexed collection (@operations.indexedIntersection Index)
  countableUnion : ClosedUnderCountable collection operations.countableUnion
  countableIntersection : ClosedUnderCountable collection operations.countableIntersection

/-- A collection is closed under both Boolean and indexed set operations. -/
structure BooleanIndexedClosed (operations : BooleanIndexedSetOperations.{u, v})
    (collection : Collection operations.SetObject) : Prop
    extends BooleanClosed operations.toBooleanSetOperations collection,
      IndexedClosed operations.toIndexedSetOperations collection

end FromOperations

end LRA.VolumeI.Set.Algebra
