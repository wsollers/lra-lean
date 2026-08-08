import LRA.VolumeI.Set.Operations.Comprehension

universe u v w x

namespace LRA.VolumeI.Set.Operations

/-!
Higher-order powerset interface.

This layer separates the interface for sets of elements from the interface for
sets whose elements represent subsets. A member of `powerset ambient` is not a
raw predicate; it is an element of the collection-level interface obtained from
a base-level set object by `subsetElement`.
-/

/-- A generic powerset interface linking sets of elements to sets of subsets. -/
structure PowerSetOperations where
  elementOperations : ComprehensionSetOperations.{u, v}
  collectionOperations : ComprehensionSetOperations.{w, x}
  subsetElement : elementOperations.SetObject → collectionOperations.Element
  powerset : elementOperations.SetObject → collectionOperations.SetObject

/-- Laws for the generic powerset interface. -/
structure PowerSetOperationLaws
    (operations : PowerSetOperations.{u, v, w, x}) : Prop where
  elementLaws :
    ComprehensionSetOperationLaws operations.elementOperations
  collectionLaws :
    ComprehensionSetOperationLaws operations.collectionOperations
  powersetMembership :
    ∀ ambient candidate,
      operations.collectionOperations.member
          (operations.subsetElement candidate)
          (operations.powerset ambient) ↔
        operations.elementOperations.subset candidate ambient

/-- Powerset laws bundled with extensionality at both levels. -/
structure PowerSetInterfaceLaws
    (operations : PowerSetOperations.{u, v, w, x}) : Prop
    extends PowerSetOperationLaws operations where
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

/-- View a base-level set as a collection-level element. -/
abbrev SubsetElement
    (operations : PowerSetOperations.{u, v, w, x})
    (setObject : operations.elementOperations.SetObject) :
    operations.collectionOperations.Element :=
  operations.subsetElement setObject

/-- Powerset operation in a higher-order set interface. -/
abbrev PowerSet
    (operations : PowerSetOperations.{u, v, w, x})
    (ambient : operations.elementOperations.SetObject) :
    operations.collectionOperations.SetObject :=
  operations.powerset ambient

/-- A base-level set is represented as a member of a collection-level set. -/
def ContainsSubset
    (operations : PowerSetOperations.{u, v, w, x})
    (collection : operations.collectionOperations.SetObject)
    (setObject : operations.elementOperations.SetObject) : Prop :=
  operations.collectionOperations.member
    (SubsetElement operations setObject)
    collection

/-- A collection object is a family/class of subsets of an ambient set. -/
def IsFamilyOfSubsets
    (operations : PowerSetOperations.{u, v, w, x})
    (ambient : operations.elementOperations.SetObject)
    (collection : operations.collectionOperations.SetObject) : Prop :=
  operations.collectionOperations.subset collection (PowerSet operations ambient)

end LRA.VolumeI.Set.Generic
