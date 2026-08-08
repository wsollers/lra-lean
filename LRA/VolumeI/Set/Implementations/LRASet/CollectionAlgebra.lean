import Mathlib.Data.Set.Finite.Basic
import LRA.VolumeI.Set.Algebra.CollectionAlgebra
import LRA.VolumeI.Set.Implementations.LRASet.Boolean
import LRA.VolumeI.Set.Implementations.LRASet.PowerSet
import LRA.VolumeI.Set.Implementations.LRASet.Operations.CountableIndexed

universe u

namespace LRA.VolumeI.Set.Implementations.LRASet

namespace CollectionAlgebraAdapter

open LRA.VolumeI.Set.Algebra.Collection

/-!
Adapters from the compatibility `LRASet` backend into the generic
collection-algebra surface.
-/

/-- Boolean collection-algebra operations for `LRASet`. -/
def booleanOperations (Alpha : LRACarrier.{u}) :
    CollectionBooleanOperations (collectionSetOperations Alpha) where
  empty := LRASet.Empty Alpha
  universal := LRASet.Universal Alpha
  union := LRASet.Union
  intersection := LRASet.Intersection
  complement := LRASet.Complement
  difference := LRASet.Difference
  symmetricDifference := LRASet.SymmetricDifference

/-- Countable collection-algebra operations for `LRASet`. -/
def countableOperations (Alpha : LRACarrier.{u}) :
    CollectionCountableOperations (collectionSetOperations Alpha) where
  countableUnion := CountableUnion
  countableIntersection := CountableIntersection

/-- Finite collection predicate for `LRASet` collections of subsets. -/
def finiteCollectionPredicate (Alpha : LRACarrier.{u}) :
    FiniteCollectionPredicate (collectionSetOperations Alpha) :=
  fun collection => _root_.Set.Finite collection

/-- Nonempty set predicate for `LRASet` base-level sets. -/
def nonemptySetPredicate (Alpha : LRACarrier.{u}) :
    NonemptySetPredicate (collectionSetOperations Alpha) :=
  LRASet.Nonempty

/-- LRASet adapters satisfy the countable Boolean operation laws. -/
theorem countableOperationLaws (Alpha : LRACarrier.{u}) :
    CollectionCountableOperationLaws
      (collectionSetOperations Alpha)
      (booleanOperations Alpha)
      (countableOperations Alpha) := by
  sorry

/-- LRASet finite collection predicates satisfy the generic finite transport laws. -/
theorem finiteCollectionLaws (Alpha : LRACarrier.{u}) :
    FiniteCollectionLaws
      (collectionSetOperations Alpha)
      (finiteCollectionPredicate Alpha) := by
  sorry

/-- LRASet nonempty set predicates satisfy the generic nonempty membership law. -/
theorem nonemptySetLaws (Alpha : LRACarrier.{u}) :
    NonemptySetLaws
      (collectionSetOperations Alpha)
      (nonemptySetPredicate Alpha) := by
  sorry

/-- LRASet relative-complement collections satisfy the generic transport laws. -/
theorem relativeComplementCollectionLaws (Alpha : LRACarrier.{u}) :
    RelativeComplementCollectionLaws (collectionSetOperations Alpha) := by
  sorry

end CollectionAlgebraAdapter

end LRA.VolumeI.Set.Implementations.LRASet
