import LRA.VolumeI.Set.Operations.Families
import LRA.VolumeI.Set.Operations.Indexed

universe u v w x y

namespace LRA.VolumeI.Set.Algebra.Collection

open LRA.VolumeI.Set.Operations
open LRA.VolumeI.Set.Generic

/-!
Generic algebraic predicates for collections of subsets.

The objects here are phrased over `CollectionSetOperations`: a collection is a
set-level object whose members represent subsets of a base carrier.  This is the
generic target used by topology, rings of sets, sigma-algebras, generated
collections, compactness-style cover language, and related Volume I material.
-/

/-- A collection of subsets represented by the generic collection interface. -/
abbrev SetCollection
    (operations : CollectionSetOperations.{u, v, w, x}) :=
  operations.collectionOperations.SetObject

/-- Membership of a base-level set object in a collection of subsets. -/
def Contains
    (operations : CollectionSetOperations.{u, v, w, x})
    (collection : SetCollection operations)
    (setObject : operations.elementOperations.SetObject) : Prop :=
  ContainsSubset operations.toPowerSetOperations collection setObject

/-- A finite-collection predicate supplied by an implementation or later
finite-set interface. -/
abbrev FiniteCollectionPredicate
    (operations : CollectionSetOperations.{u, v, w, x}) :=
  SetCollection operations → Prop

/-- A nonempty-set predicate supplied by an implementation or later
foundational interface. -/
abbrev NonemptySetPredicate
    (operations : CollectionSetOperations.{u, v, w, x}) :=
  operations.elementOperations.SetObject → Prop

/-- A finite subcover is a subcover whose chosen subcollection is finite. -/
def FiniteSubcover
    (operations : CollectionSetOperations.{u, v, w, x})
    (IsFinite : FiniteCollectionPredicate operations)
    (subcollection collection : SetCollection operations)
    (target : operations.elementOperations.SetObject) : Prop :=
  Subcover operations subcollection collection target ∧ IsFinite subcollection

/-- A collection has no finite subcover of a target. -/
def HasNoFiniteSubcover
    (operations : CollectionSetOperations.{u, v, w, x})
    (IsFinite : FiniteCollectionPredicate operations)
    (collection : SetCollection operations)
    (target : operations.elementOperations.SetObject) : Prop :=
  ∀ subcollection : SetCollection operations,
    operations.collectionOperations.subset subcollection collection →
      IsFinite subcollection →
        ¬ Covers operations subcollection target

/-- A collection has some finite subcover of a target. -/
def HasFiniteSubcover
    (operations : CollectionSetOperations.{u, v, w, x})
    (IsFinite : FiniteCollectionPredicate operations)
    (collection : SetCollection operations)
    (target : operations.elementOperations.SetObject) : Prop :=
  ∃ subcollection : SetCollection operations,
    operations.collectionOperations.subset subcollection collection ∧
      IsFinite subcollection ∧
        Covers operations subcollection target

/-- A collection has the finite intersection property when every finite
subcollection has nonempty intersection. -/
def FiniteIntersectionProperty
    (operations : CollectionSetOperations.{u, v, w, x})
    (IsFinite : FiniteCollectionPredicate operations)
    (IsNonempty : NonemptySetPredicate operations)
    (collection : SetCollection operations) : Prop :=
  ∀ subcollection : SetCollection operations,
    operations.collectionOperations.subset subcollection collection →
      IsFinite subcollection →
        IsNonempty (CollectionIntersection operations subcollection)

/-- Closure under a unary operation on base-level set objects. -/
def ClosedUnderUnaryOperation
    (operations : CollectionSetOperations.{u, v, w, x})
    (collection : SetCollection operations)
    (operation :
      operations.elementOperations.SetObject →
        operations.elementOperations.SetObject) : Prop :=
  ∀ setObject,
    Contains operations collection setObject →
      Contains operations collection (operation setObject)

/-- Closure under a binary operation on base-level set objects. -/
def ClosedUnderBinaryOperation
    (operations : CollectionSetOperations.{u, v, w, x})
    (collection : SetCollection operations)
    (operation :
      operations.elementOperations.SetObject →
        operations.elementOperations.SetObject →
          operations.elementOperations.SetObject) : Prop :=
  ∀ left right,
    Contains operations collection left →
      Contains operations collection right →
        Contains operations collection (operation left right)

/-- Closure under an arbitrary indexed operation on base-level set objects. -/
def ClosedUnderIndexedOperation
    (operations : CollectionSetOperations.{u, v, w, x})
    (collection : SetCollection operations)
    {Index : Type y}
    (operation :
      (Index → operations.elementOperations.SetObject) →
        operations.elementOperations.SetObject) : Prop :=
  ∀ family,
    (∀ index, Contains operations collection (family index)) →
      Contains operations collection (operation family)

/-- Closure under countable operations. -/
def ClosedUnderCountableOperation
    (operations : CollectionSetOperations.{u, v, w, x})
    (collection : SetCollection operations)
    (operation :
      (Nat → operations.elementOperations.SetObject) →
        operations.elementOperations.SetObject) : Prop :=
  ClosedUnderIndexedOperation operations collection operation

/-- Closure under set-theoretic union over a subcollection. -/
def ClosedUnderCollectionUnion
    (operations : CollectionSetOperations.{u, v, w, x})
    (collection : SetCollection operations) : Prop :=
  ∀ subcollection,
    operations.collectionOperations.subset subcollection collection →
      Contains operations collection (CollectionUnion operations subcollection)

/-- Closure under set-theoretic intersection over a subcollection. -/
def ClosedUnderCollectionIntersection
    (operations : CollectionSetOperations.{u, v, w, x})
    (collection : SetCollection operations) : Prop :=
  ∀ subcollection,
    operations.collectionOperations.subset subcollection collection →
      Contains operations collection
        (CollectionIntersection operations subcollection)

/-- Finite union folded from a list using supplied empty and union operations. -/
def FiniteUnionFromList
    {SetObject : Type u}
    (empty : SetObject)
    (union : SetObject → SetObject → SetObject) :
    List SetObject → SetObject
  | [] => empty
  | head :: tail => union head (FiniteUnionFromList empty union tail)

/-- Finite intersection folded from a nonempty-style list using supplied
universal and intersection operations. -/
def FiniteIntersectionFromList
    {SetObject : Type u}
    (universal : SetObject)
    (intersection : SetObject → SetObject → SetObject) :
    List SetObject → SetObject
  | [] => universal
  | head :: tail =>
      intersection head
        (FiniteIntersectionFromList universal intersection tail)

/-- Closure under finite unions expressed through lists of collection members. -/
def ClosedUnderFiniteUnions
    (operations : CollectionSetOperations.{u, v, w, x})
    (collection : SetCollection operations)
    (empty : operations.elementOperations.SetObject)
    (union :
      operations.elementOperations.SetObject →
        operations.elementOperations.SetObject →
          operations.elementOperations.SetObject) : Prop :=
  ∀ sets : List operations.elementOperations.SetObject,
    (∀ setObject, setObject ∈ sets → Contains operations collection setObject) →
      Contains operations collection (FiniteUnionFromList empty union sets)

/-- Closure under finite intersections expressed through lists of collection
members. -/
def ClosedUnderFiniteIntersections
    (operations : CollectionSetOperations.{u, v, w, x})
    (collection : SetCollection operations)
    (universal : operations.elementOperations.SetObject)
    (intersection :
      operations.elementOperations.SetObject →
        operations.elementOperations.SetObject →
          operations.elementOperations.SetObject) : Prop :=
  ∀ sets : List operations.elementOperations.SetObject,
    (∀ setObject, setObject ∈ sets → Contains operations collection setObject) →
      Contains operations collection
        (FiniteIntersectionFromList universal intersection sets)

/-- Boolean operations needed to state rings, algebras, and topology
generically over collection objects. -/
structure CollectionBooleanOperations
    (operations : CollectionSetOperations.{u, v, w, x}) where
  empty : operations.elementOperations.SetObject
  universal : operations.elementOperations.SetObject
  union :
    operations.elementOperations.SetObject →
      operations.elementOperations.SetObject →
        operations.elementOperations.SetObject
  intersection :
    operations.elementOperations.SetObject →
      operations.elementOperations.SetObject →
        operations.elementOperations.SetObject
  complement :
    operations.elementOperations.SetObject →
      operations.elementOperations.SetObject
  difference :
    operations.elementOperations.SetObject →
      operations.elementOperations.SetObject →
        operations.elementOperations.SetObject
  symmetricDifference :
    operations.elementOperations.SetObject →
      operations.elementOperations.SetObject →
        operations.elementOperations.SetObject

/-- Countable operations needed to state sigma-style closure generically over
collection objects. -/
structure CollectionCountableOperations
    (operations : CollectionSetOperations.{u, v, w, x}) where
  countableUnion :
    (Nat → operations.elementOperations.SetObject) →
      operations.elementOperations.SetObject
  countableIntersection :
    (Nat → operations.elementOperations.SetObject) →
      operations.elementOperations.SetObject

/-- Closure under complements in a collection of subsets. -/
def ClosedUnderComplements
    (operations : CollectionSetOperations.{u, v, w, x})
    (boolean : CollectionBooleanOperations operations)
    (collection : SetCollection operations) : Prop :=
  ClosedUnderUnaryOperation operations collection boolean.complement

/-- Closure under pairwise unions in a collection of subsets. -/
def ClosedUnderPairwiseUnions
    (operations : CollectionSetOperations.{u, v, w, x})
    (boolean : CollectionBooleanOperations operations)
    (collection : SetCollection operations) : Prop :=
  ClosedUnderBinaryOperation operations collection boolean.union

/-- Closure under pairwise intersections in a collection of subsets. -/
def ClosedUnderPairwiseIntersections
    (operations : CollectionSetOperations.{u, v, w, x})
    (boolean : CollectionBooleanOperations operations)
    (collection : SetCollection operations) : Prop :=
  ClosedUnderBinaryOperation operations collection boolean.intersection

/-- Closure under pairwise differences in a collection of subsets. -/
def ClosedUnderPairwiseDifferences
    (operations : CollectionSetOperations.{u, v, w, x})
    (boolean : CollectionBooleanOperations operations)
    (collection : SetCollection operations) : Prop :=
  ClosedUnderBinaryOperation operations collection boolean.difference

/-- Closure under pairwise symmetric differences in a collection of subsets. -/
def ClosedUnderPairwiseSymmetricDifferences
    (operations : CollectionSetOperations.{u, v, w, x})
    (boolean : CollectionBooleanOperations operations)
    (collection : SetCollection operations) : Prop :=
  ClosedUnderBinaryOperation operations collection boolean.symmetricDifference

/-- Closure under countable unions in a collection of subsets. -/
def ClosedUnderCountableUnions
    (operations : CollectionSetOperations.{u, v, w, x})
    (countable : CollectionCountableOperations operations)
    (collection : SetCollection operations) : Prop :=
  ClosedUnderCountableOperation operations collection countable.countableUnion

/-- Closure under countable intersections in a collection of subsets. -/
def ClosedUnderCountableIntersections
    (operations : CollectionSetOperations.{u, v, w, x})
    (countable : CollectionCountableOperations operations)
    (collection : SetCollection operations) : Prop :=
  ClosedUnderCountableOperation operations collection
    countable.countableIntersection

/-- A ring of sets, stated as closure properties of a generic collection
object. -/
def SetRing
    (operations : CollectionSetOperations.{u, v, w, x})
    (boolean : CollectionBooleanOperations operations)
    (collection : SetCollection operations) : Prop :=
  Contains operations collection boolean.empty ∧
    ClosedUnderPairwiseUnions operations boolean collection ∧
      ClosedUnderPairwiseIntersections operations boolean collection ∧
        ClosedUnderPairwiseDifferences operations boolean collection ∧
          ClosedUnderPairwiseSymmetricDifferences operations boolean collection

/-- An algebra of sets, stated as a ring of sets with the universal set and
complements. -/
def SetAlgebra
    (operations : CollectionSetOperations.{u, v, w, x})
    (boolean : CollectionBooleanOperations operations)
    (collection : SetCollection operations) : Prop :=
  SetRing operations boolean collection ∧
    Contains operations collection boolean.universal ∧
      ClosedUnderComplements operations boolean collection

/-- A sigma-ring is a ring of sets closed under countable unions. -/
def SigmaRing
    (operations : CollectionSetOperations.{u, v, w, x})
    (boolean : CollectionBooleanOperations operations)
    (countable : CollectionCountableOperations operations)
    (collection : SetCollection operations) : Prop :=
  SetRing operations boolean collection ∧
    ClosedUnderCountableUnions operations countable collection

/-- A sigma-algebra is an algebra of sets closed under countable unions. -/
def SigmaAlgebra
    (operations : CollectionSetOperations.{u, v, w, x})
    (boolean : CollectionBooleanOperations operations)
    (countable : CollectionCountableOperations operations)
    (collection : SetCollection operations) : Prop :=
  SetAlgebra operations boolean collection ∧
    ClosedUnderCountableUnions operations countable collection

/-- A topology on the generic base set: empty and whole space, arbitrary unions,
and finite intersections. -/
def TopologyOn
    (operations : CollectionSetOperations.{u, v, w, x})
    (boolean : CollectionBooleanOperations operations)
    (collection : SetCollection operations) : Prop :=
  Contains operations collection boolean.empty ∧
    Contains operations collection boolean.universal ∧
      ClosedUnderCollectionUnion operations collection ∧
        ClosedUnderFiniteIntersections operations collection
          boolean.universal boolean.intersection

/-- The extra interface needed for systems of collections, one level above a
collection of subsets.  This keeps generated collections honest: intersecting a
system of closed collections is not the same operation as intersecting a
collection of base subsets. -/
structure CollectionSystemOperations
    (operations : CollectionSetOperations.{u, v, w, x}) where
  SystemObject : Type y
  systemMember : SetCollection operations → SystemObject → Prop
  systemSubset : SystemObject → SystemObject → Prop
  systemSeparation :
    SystemObject →
      (SetCollection operations → Prop) →
        SystemObject
  systemIntersection : SystemObject → SetCollection operations

/-- A system of collections is closed under intersections of its subsystems. -/
def ClosureSystem
    (operations : CollectionSetOperations.{u, v, w, x})
    (systemOperations :
      CollectionSystemOperations.{u, v, w, x, y} operations)
    (system : systemOperations.SystemObject) : Prop :=
  ∀ subsystem,
    systemOperations.systemSubset subsystem system →
      systemOperations.systemMember
        (systemOperations.systemIntersection subsystem)
        system

/-- A closed collection contains the generating family. -/
def ContainsGeneratingFamily
    (operations : CollectionSetOperations.{u, v, w, x})
    (generator closedCollection : SetCollection operations) : Prop :=
  operations.collectionOperations.subset generator closedCollection

/-- The collection generated by a family relative to a system of closed
collections is the intersection of all closed collections in the system that
contain the generator. -/
def GeneratedCollection
    (operations : CollectionSetOperations.{u, v, w, x})
    (systemOperations :
      CollectionSystemOperations.{u, v, w, x, y} operations)
    (system : systemOperations.SystemObject)
    (generator : SetCollection operations) :
    SetCollection operations :=
  systemOperations.systemIntersection
    (systemOperations.systemSeparation system
      (fun closedCollection =>
        ContainsGeneratingFamily operations generator closedCollection))

/-- The generated collection contains its generator. -/
theorem GeneratedCollectionExtensive
    (operations : CollectionSetOperations.{u, v, w, x})
    (systemOperations :
      CollectionSystemOperations.{u, v, w, x, y} operations)
    (system : systemOperations.SystemObject)
    (generator : SetCollection operations)
    (systemClosed : ClosureSystem operations systemOperations system) :
    operations.collectionOperations.subset generator
      (GeneratedCollection operations systemOperations system generator) := by
  sorry

/-- Generated collection is monotone in the generator. -/
theorem GeneratedCollectionMonotone
    (operations : CollectionSetOperations.{u, v, w, x})
    (systemOperations :
      CollectionSystemOperations.{u, v, w, x, y} operations)
    (system : systemOperations.SystemObject)
    {leftGenerator rightGenerator : SetCollection operations}
    (generatorSubset :
      operations.collectionOperations.subset leftGenerator rightGenerator)
    (systemClosed : ClosureSystem operations systemOperations system) :
    operations.collectionOperations.subset
      (GeneratedCollection operations systemOperations system leftGenerator)
      (GeneratedCollection operations systemOperations system rightGenerator) := by
  sorry

/-- Generated collection belongs to a closed system. -/
theorem GeneratedCollectionClosed
    (operations : CollectionSetOperations.{u, v, w, x})
    (systemOperations :
      CollectionSystemOperations.{u, v, w, x, y} operations)
    (system : systemOperations.SystemObject)
    (generator : SetCollection operations)
    (systemClosed : ClosureSystem operations systemOperations system) :
    systemOperations.systemMember
      (GeneratedCollection operations systemOperations system generator)
      system := by
  sorry

/-- Generated collection is idempotent for a closed system. -/
theorem GeneratedCollectionIdempotent
    (operations : CollectionSetOperations.{u, v, w, x})
    (systemOperations :
      CollectionSystemOperations.{u, v, w, x, y} operations)
    (system : systemOperations.SystemObject)
    (generator : SetCollection operations)
    (systemClosed : ClosureSystem operations systemOperations system) :
    GeneratedCollection operations systemOperations system
        (GeneratedCollection operations systemOperations system generator) =
      GeneratedCollection operations systemOperations system generator := by
  sorry

/-- No finite subcover iff the relative complement collection has FIP. -/
theorem NoFiniteSubcoverIffRelativeComplementFIP
    (operations : CollectionSetOperations.{u, v, w, x})
    (IsFinite : FiniteCollectionPredicate operations)
    (IsNonempty : NonemptySetPredicate operations)
    (collection : SetCollection operations)
    (target : operations.elementOperations.SetObject) :
    HasNoFiniteSubcover operations IsFinite collection target ↔
      FiniteIntersectionProperty operations IsFinite IsNonempty
        (RelativeComplementCollection operations target collection) := by
  sorry

/-- Finite subcover iff the relative complement collection fails FIP. -/
theorem FiniteSubcoverIffRelativeComplementNotFIP
    (operations : CollectionSetOperations.{u, v, w, x})
    (IsFinite : FiniteCollectionPredicate operations)
    (IsNonempty : NonemptySetPredicate operations)
    (collection : SetCollection operations)
    (target : operations.elementOperations.SetObject) :
    HasFiniteSubcover operations IsFinite collection target ↔
      ¬ FiniteIntersectionProperty operations IsFinite IsNonempty
        (RelativeComplementCollection operations target collection) := by
  sorry

end LRA.VolumeI.Set.Algebra.Collection
