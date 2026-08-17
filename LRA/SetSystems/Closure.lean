/-
Generic closure machinery for structured collections of set-objects.
-/

universe u v w

namespace LRA.SetSystems

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

/-- Closure under a distinguished nullary value. -/
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

/-- Closure under indexed operations. -/
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

end LRA.SetSystems

namespace LRA.Set.Algebra
export LRA.SetSystems
  (Collection Contains ContainsPredicate ClosedUnderNullary ClosedUnderUnary
   ClosedUnderBinary ClosedUnderIndexed ClosedUnderCountable ClosedUnderFinite)
end LRA.Set.Algebra
