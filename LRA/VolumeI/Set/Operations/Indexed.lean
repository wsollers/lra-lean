import LRA.VolumeI.Set.Operations.Boolean

universe u v

namespace LRA.VolumeI.Set.Operations

/-!
Indexed extensions of the public set-operation interface.
-/

/-- Public indexed set operations. -/
structure IndexedSetOperations extends PublicSetOperations where
  indexedUnion : {Index : Type u} → (Index → SetObject) → SetObject
  indexedIntersection : {Index : Type u} → (Index → SetObject) → SetObject
  countableUnion : (Nat → SetObject) → SetObject
  countableIntersection : (Nat → SetObject) → SetObject

/-- Membership readings for indexed set operations. -/
structure IndexedSetOperationLaws (operations : IndexedSetOperations.{u, v}) : Prop
    extends PublicSetOperationLaws operations.toPublicSetOperations where
  indexedUnionMembership :
    ∀ {Index : Type u} (element : operations.Element) (family : Index → operations.SetObject),
      operations.member element (operations.indexedUnion (Index := Index) family) ↔
        ∃ index, operations.member element (family index)
  indexedIntersectionMembership :
    ∀ {Index : Type u} (element : operations.Element) (family : Index → operations.SetObject),
      operations.member element (operations.indexedIntersection (Index := Index) family) ↔
        ∀ index, operations.member element (family index)
  countableUnionMembership :
    ∀ element family,
      operations.member element (operations.countableUnion family) ↔
        ∃ index : Nat, operations.member element (family index)
  countableIntersectionMembership :
    ∀ element family,
      operations.member element (operations.countableIntersection family) ↔
        ∀ index : Nat, operations.member element (family index)

/-- Laws for indexed set operations with extensionality. -/
structure IndexedSetInterfaceLaws (operations : IndexedSetOperations.{u, v}) : Prop
    extends IndexedSetOperationLaws operations where
  extensionality :
    ∀ {left right : operations.SetObject},
      (∀ element, operations.member element left ↔ operations.member element right) →
        left = right

/-- Public operations with both Boolean and indexed structure. This is the
interface expected by sigma-algebra style constructions. -/
structure BooleanIndexedSetOperations extends BooleanSetOperations where
  indexedUnion : {Index : Type u} → (Index → SetObject) → SetObject
  indexedIntersection : {Index : Type u} → (Index → SetObject) → SetObject
  countableUnion : (Nat → SetObject) → SetObject
  countableIntersection : (Nat → SetObject) → SetObject

namespace BooleanIndexedSetOperations

/-- Forget Boolean-indexed operations to their indexed part. -/
def toIndexedSetOperations
    (operations : BooleanIndexedSetOperations.{u, v}) : IndexedSetOperations.{u, v} where
  toPublicSetOperations := operations.toPublicSetOperations
  indexedUnion := operations.indexedUnion
  indexedIntersection := operations.indexedIntersection
  countableUnion := operations.countableUnion
  countableIntersection := operations.countableIntersection

end BooleanIndexedSetOperations

/-- Membership readings for operations with both Boolean and indexed structure. -/
structure BooleanIndexedSetOperationLaws
    (operations : BooleanIndexedSetOperations.{u, v}) : Prop
    extends BooleanSetOperationLaws operations.toBooleanSetOperations,
      IndexedSetOperationLaws operations.toIndexedSetOperations

/-- Laws for operations with both Boolean and indexed structure, with
extensionality. -/
structure BooleanIndexedSetInterfaceLaws
    (operations : BooleanIndexedSetOperations.{u, v}) : Prop
    extends BooleanIndexedSetOperationLaws operations where
  extensionality :
    ∀ {left right : operations.SetObject},
      (∀ element, operations.member element left ↔ operations.member element right) →
        left = right

end LRA.VolumeI.Set.Operations

namespace LRA.VolumeI.Set.Generic

open LRA.VolumeI.Set.Operations

/-- Indexed union operation in an indexed set interface. -/
abbrev IndexedUnion (operations : IndexedSetOperations.{u, v})
    {Index : Type u} (family : Index → operations.SetObject) : operations.SetObject :=
  operations.indexedUnion family

/-- Indexed intersection operation in an indexed set interface. -/
abbrev IndexedIntersection (operations : IndexedSetOperations.{u, v})
    {Index : Type u} (family : Index → operations.SetObject) : operations.SetObject :=
  operations.indexedIntersection family

/-- Countable union operation in an indexed set interface. -/
abbrev CountableUnion (operations : IndexedSetOperations.{u, v})
    (family : Nat → operations.SetObject) : operations.SetObject :=
  operations.countableUnion family

/-- Countable intersection operation in an indexed set interface. -/
abbrev CountableIntersection (operations : IndexedSetOperations.{u, v})
    (family : Nat → operations.SetObject) : operations.SetObject :=
  operations.countableIntersection family

end LRA.VolumeI.Set.Generic
