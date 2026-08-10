import LRA.VolumeI.Set.Algebra.CollectionAlgebra
import LRA.VolumeI.Set.Finiteness
import LRA.VolumeI.Set.Implementations.TT.Boolean
import LRA.VolumeI.Set.Implementations.TT.PowerSet

universe u

namespace LRA.VolumeI.Set.TTSet

namespace CollectionAlgebraAdapter

open LRA.VolumeI.Set
open LRA.VolumeI.Set.Algebra.Collection
open LRA.VolumeI.Set.Finiteness

/-!
Adapters from typed predicate sets into the generic collection-algebra surface.
-/

/-- Boolean collection-algebra operations for typed predicate sets. -/
def booleanOperations (Alpha : TTCarrier.{u}) :
    CollectionBooleanOperations (collectionSetOperations Alpha) where
  empty := Empty Alpha
  universal := Universal Alpha
  union := Union
  intersection := Intersection
  complement := Complement
  difference := Difference
  symmetricDifference := SymmetricDifference

/-- Countable collection-algebra operations for typed predicate sets. -/
def countableOperations (Alpha : TTCarrier.{u}) :
    CollectionCountableOperations (collectionSetOperations Alpha) where
  countableUnion := fun family => IndexedUnion family
  countableIntersection := fun family => IndexedIntersection family

/-- Finite collection predicate for typed collections of subsets. -/
def finiteCollectionPredicate (Alpha : TTCarrier.{u}) :
    FiniteCollectionPredicate (collectionSetOperations Alpha) :=
  fun collection => FinitePredicate (fun memberSet => TTSet.Member memberSet collection)

/-- Nonempty set predicate for typed predicate sets. -/
def nonemptySetPredicate (Alpha : TTCarrier.{u}) :
    NonemptySetPredicate (collectionSetOperations Alpha) :=
  Nonempty

/-- Typed predicate-set adapters satisfy the countable Boolean operation laws. -/
theorem countableOperationLaws (Alpha : TTCarrier.{u}) :
    CollectionCountableOperationLaws
      (collectionSetOperations Alpha)
      (booleanOperations Alpha)
      (countableOperations Alpha) := by
  sorry

/-- Typed finite collection predicates satisfy the generic finite transport laws. -/
theorem finiteCollectionLaws (Alpha : TTCarrier.{u}) :
    FiniteCollectionLaws
      (collectionSetOperations Alpha)
      (finiteCollectionPredicate Alpha) := by
  sorry

/-- Typed nonempty set predicates satisfy the generic nonempty membership law. -/
theorem nonemptySetLaws (Alpha : TTCarrier.{u}) :
    NonemptySetLaws
      (collectionSetOperations Alpha)
      (nonemptySetPredicate Alpha) := by
  sorry

/-- Typed relative-complement collections satisfy the generic transport laws. -/
theorem relativeComplementCollectionLaws (Alpha : TTCarrier.{u}) :
    RelativeComplementCollectionLaws (collectionSetOperations Alpha) := by
  sorry

end CollectionAlgebraAdapter

end LRA.VolumeI.Set.TTSet
