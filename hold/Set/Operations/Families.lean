import LRA.VolumeI.Set.Operations.PowerSet

universe u v w x y

namespace LRA.VolumeI.Set.Operations

/-!
Generic operations on set-theoretic families/classes of subsets.
-/

/-- Operations for collections whose members represent subsets of a base set. -/
structure CollectionSetOperations extends PowerSetOperations.{u, v, w, x} where
  collectionUnion :
    collectionOperations.SetObject → elementOperations.SetObject
  collectionIntersection :
    collectionOperations.SetObject → elementOperations.SetObject

/-- Laws for generic collection union and intersection. -/
structure CollectionSetOperationLaws
    (operations : CollectionSetOperations.{u, v, w, x}) : Prop
    extends PowerSetOperationLaws operations.toPowerSetOperations where
  collectionUnionMembership :
    ∀ element collection,
      operations.elementOperations.member element
          (operations.collectionUnion collection) ↔
        ∃ memberSet,
          operations.collectionOperations.member
              (operations.subsetElement memberSet)
              collection ∧
            operations.elementOperations.member element memberSet
  collectionIntersectionMembership :
    ∀ element collection,
      operations.elementOperations.member element
          (operations.collectionIntersection collection) ↔
        ∀ memberSet,
          operations.collectionOperations.member
              (operations.subsetElement memberSet)
              collection →
            operations.elementOperations.member element memberSet

/-- Collection laws bundled with extensionality at both levels. -/
structure CollectionSetInterfaceLaws
    (operations : CollectionSetOperations.{u, v, w, x}) : Prop
    extends CollectionSetOperationLaws operations where
  elementExtensionality :
    ∀ {left right : operations.elementOperations.SetObject},
      (∀ element,
        operations.elementOperations.member element left ↔
          operations.elementOperations.member element right) →
        left = right
  collectionExtensionality :
    ∀ {left right : operations.collectionOperations.SetObject},
      (∀ element,
        operations.collectionOperations.member element left ↔
          operations.collectionOperations.member element right) →
        left = right

end LRA.VolumeI.Set.Operations

namespace LRA.VolumeI.Set.Generic

open LRA.VolumeI.Set.Operations

/-- A set-theoretic family/class of subsets represented as a collection object. -/
abbrev SetFamily
    (operations : CollectionSetOperations.{u, v, w, x}) :=
  operations.collectionOperations.SetObject

/-- A Lean-indexed family of base-level set objects. -/
abbrev IndexedSetFamily
    (operations : PowerSetOperations.{u, v, w, x})
    (Index : Type y) :=
  Index → operations.elementOperations.SetObject

/-- Union over a set-theoretic family/class of subsets. -/
abbrev CollectionUnion
    (operations : CollectionSetOperations.{u, v, w, x})
    (collection : operations.collectionOperations.SetObject) :
    operations.elementOperations.SetObject :=
  operations.collectionUnion collection

/-- Intersection over a set-theoretic family/class of subsets. -/
abbrev CollectionIntersection
    (operations : CollectionSetOperations.{u, v, w, x})
    (collection : operations.collectionOperations.SetObject) :
    operations.elementOperations.SetObject :=
  operations.collectionIntersection collection

/-- A collection covers a target set when the target is contained in its union. -/
def Covers
    (operations : CollectionSetOperations.{u, v, w, x})
    (collection : operations.collectionOperations.SetObject)
    (target : operations.elementOperations.SetObject) : Prop :=
  operations.elementOperations.subset target (CollectionUnion operations collection)

/-- A subcover is a subcollection that still covers the same target. -/
def Subcover
    (operations : CollectionSetOperations.{u, v, w, x})
    (subcollection collection : operations.collectionOperations.SetObject)
    (target : operations.elementOperations.SetObject) : Prop :=
  operations.collectionOperations.subset subcollection collection ∧
    Covers operations subcollection target

/-- A relative complement collection, built by separating the powerset of a
target by the image of complements of members of a source collection. -/
def RelativeComplementCollection
    (operations : CollectionSetOperations.{u, v, w, x})
    (target : operations.elementOperations.SetObject)
    (collection : operations.collectionOperations.SetObject) :
    operations.collectionOperations.SetObject :=
  operations.collectionOperations.separation
    (PowerSet operations.toPowerSetOperations target)
    (fun candidate =>
      ∃ memberSet,
        ContainsSubset operations.toPowerSetOperations collection memberSet ∧
          candidate =
            SubsetElement operations.toPowerSetOperations
              (operations.elementOperations.separation target
                (fun element =>
                  ¬ operations.elementOperations.member element memberSet)))

end LRA.VolumeI.Set.Generic
