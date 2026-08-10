import Mathlib.Data.Set.Finite.Basic
import LRA.VolumeI.Set.Algebra.CollectionAlgebra
import LRA.VolumeI.Set.Implementations.MathlibSet.BooleanIndexed
import LRA.VolumeI.Set.Implementations.MathlibSet.PowerSet

universe u

namespace LRA.VolumeI.Set.Implementations.MathlibSet

namespace CollectionAlgebraAdapter

open LRA.VolumeI.Set.Algebra.Collection

/-!
Adapters from mathlib `Set` operations into the generic collection-algebra
surface.
-/

/-- Boolean collection-algebra operations for mathlib sets. -/
def booleanOperations (Alpha : Type u) :
    CollectionBooleanOperations (collectionSetOperations Alpha) where
  empty := (MathlibSet.booleanOperations Alpha).empty
  universal := (MathlibSet.booleanOperations Alpha).universal
  union := (MathlibSet.booleanOperations Alpha).union
  intersection := (MathlibSet.booleanOperations Alpha).intersection
  complement := (MathlibSet.booleanOperations Alpha).complement
  difference := (MathlibSet.booleanOperations Alpha).difference
  symmetricDifference := (MathlibSet.booleanOperations Alpha).symmetricDifference

/-- Countable collection-algebra operations for mathlib sets. -/
def countableOperations (Alpha : Type u) :
    CollectionCountableOperations (collectionSetOperations Alpha) where
  countableUnion := (MathlibSet.booleanIndexedOperations Alpha).countableUnion
  countableIntersection :=
    (MathlibSet.booleanIndexedOperations Alpha).countableIntersection

/-- Finite collection predicate for mathlib collections of subsets. -/
def finiteCollectionPredicate (Alpha : Type u) :
    FiniteCollectionPredicate (collectionSetOperations Alpha) :=
  fun collection => _root_.Set.Finite collection

/-- Nonempty set predicate for mathlib base-level sets. -/
def nonemptySetPredicate (Alpha : Type u) :
    NonemptySetPredicate (collectionSetOperations Alpha) :=
  fun (setObject : Set Alpha) => ∃ element, element ∈ setObject

/-- Mathlib set adapters satisfy the countable Boolean operation laws. -/
theorem countableOperationLaws (Alpha : Type u) :
    CollectionCountableOperationLaws
      (collectionSetOperations Alpha)
      (booleanOperations Alpha)
      (countableOperations Alpha) := by
  sorry

/-- Mathlib finite collection predicates satisfy the generic finite transport laws. -/
theorem finiteCollectionLaws (Alpha : Type u) :
    FiniteCollectionLaws
      (collectionSetOperations Alpha)
      (finiteCollectionPredicate Alpha) := by
  sorry

/-- Mathlib nonempty set predicates satisfy the generic nonempty membership law. -/
theorem nonemptySetLaws (Alpha : Type u) :
    NonemptySetLaws
      (collectionSetOperations Alpha)
      (nonemptySetPredicate Alpha) := by
  sorry

/-- Mathlib relative-complement collections satisfy the generic transport laws. -/
theorem relativeComplementCollectionLaws (Alpha : Type u) :
    RelativeComplementCollectionLaws (collectionSetOperations Alpha) := by
  sorry

end CollectionAlgebraAdapter

end LRA.VolumeI.Set.Implementations.MathlibSet
