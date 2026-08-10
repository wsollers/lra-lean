import LRA.VolumeI.Set.Implementations.LRASet.Operations.Families.Collections

namespace LRA.VolumeI.Set.Implementations.LRASet

/-- A collection system is a family whose members are themselves collections of
subsets of `Alpha`.  This is the typed-set analogue of working inside
`𝒫(𝒫(Alpha))`. -/
abbrev CollectionSystem (Alpha : LRACarrier) := LRASet (SetCollection Alpha)

/-- A collection system is a closure system when arbitrary intersections of
members of the system are again members of the system. -/
def ClosureSystem {Alpha : LRACarrier}
    (System : CollectionSystem Alpha) : Prop :=
  ∀ Subsystem : CollectionSystem Alpha,
    LRASet.Subset Subsystem System →
      LRASet.Member (CollectionIntersection Subsystem) System

/-- A generating family is contained in a closed collection. -/
def ContainsGeneratingFamily {Alpha : LRACarrier}
    (Generator ClosedCollection : SetCollection Alpha) : Prop :=
  LRASet.Subset Generator ClosedCollection

/-- The generated collection determined by a closure system is the intersection
of all closed collections containing the generator. -/
def GeneratedCollection {Alpha : LRACarrier}
    (System : CollectionSystem Alpha) (Generator : SetCollection Alpha) :
    SetCollection Alpha :=
  CollectionIntersection
    (fun ClosedCollection =>
      LRASet.Member ClosedCollection System ∧
        ContainsGeneratingFamily Generator ClosedCollection)

/-- A generator is contained in its generated collection. -/
theorem GeneratedCollectionExtensive {Alpha : LRACarrier}
    (System : CollectionSystem Alpha) (Generator : SetCollection Alpha)
    (SystemNonempty :
      LRASet.Nonempty
        (fun ClosedCollection =>
          LRASet.Member ClosedCollection System ∧
            ContainsGeneratingFamily Generator ClosedCollection)) :
    LRASet.Subset Generator (GeneratedCollection System Generator) := by
  sorry

/-- Generation is monotone with respect to the generating family. -/
theorem GeneratedCollectionMonotone {Alpha : LRACarrier}
    (System : CollectionSystem Alpha)
    {LeftGenerator RightGenerator : SetCollection Alpha}
    (LeftSubsetRight : LRASet.Subset LeftGenerator RightGenerator) :
    LRASet.Subset
      (GeneratedCollection System LeftGenerator)
      (GeneratedCollection System RightGenerator) := by
  sorry

/-- If the ambient system is a closure system and there is at least one closed
collection containing the generator, then the generated collection is itself
closed. -/
theorem GeneratedCollectionClosed {Alpha : LRACarrier}
    (System : CollectionSystem Alpha) (Generator : SetCollection Alpha)
    (SystemClosed : ClosureSystem System)
    (SystemNonempty :
      LRASet.Nonempty
        (fun ClosedCollection =>
          LRASet.Member ClosedCollection System ∧
            ContainsGeneratingFamily Generator ClosedCollection)) :
    LRASet.Member (GeneratedCollection System Generator) System := by
  sorry

/-- Generating an already generated collection is idempotent. -/
theorem GeneratedCollectionIdempotent {Alpha : LRACarrier}
    (System : CollectionSystem Alpha) (Generator : SetCollection Alpha)
    (SystemClosed : ClosureSystem System)
    (SystemNonempty :
      LRASet.Nonempty
        (fun ClosedCollection =>
          LRASet.Member ClosedCollection System ∧
            ContainsGeneratingFamily Generator ClosedCollection)) :
    GeneratedCollection System (GeneratedCollection System Generator) =
      GeneratedCollection System Generator := by
  sorry

/-- A collection is closed under a unary set operation when applying the
operation to any admitted set produces another admitted set. -/
def ClosedUnderUnaryOperation {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (Operation : LRASet Alpha → LRASet Alpha) : Prop :=
  ∀ SetObject : LRASet Alpha,
    LRASet.Member SetObject Collection →
      LRASet.Member (Operation SetObject) Collection

/-- A collection is closed under a binary set operation when applying the
operation to any two admitted sets produces another admitted set. -/
def ClosedUnderBinaryOperation {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (Operation : LRASet Alpha → LRASet Alpha → LRASet Alpha) : Prop :=
  ∀ Left Right : LRASet Alpha,
    LRASet.Member Left Collection →
      LRASet.Member Right Collection →
        LRASet.Member (Operation Left Right) Collection

/-- A collection is closed under an indexed operation when applying the
operation to any indexed family of admitted sets produces another admitted
set. -/
def ClosedUnderIndexedOperation {Index Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (Operation : IndexedFamily Index Alpha → LRASet Alpha) : Prop :=
  ∀ Family : IndexedFamily Index Alpha,
    (∀ IndexValue, LRASet.Member (Family IndexValue) Collection) →
      LRASet.Member (Operation Family) Collection

/-- A collection is closed under a collection operation when applying the
operation to any subcollection produces another admitted set. -/
def ClosedUnderCollectionOperation {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (Operation : SetCollection Alpha → LRASet Alpha) : Prop :=
  ∀ Subcollection : SetCollection Alpha,
    LRASet.Subset Subcollection Collection →
      LRASet.Member (Operation Subcollection) Collection

/-- Closure under complements. -/
def ClosedUnderComplements {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  ClosedUnderUnaryOperation Collection LRASet.Complement

/-- Closure under pairwise unions. -/
def ClosedUnderPairwiseUnions {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  ClosedUnderBinaryOperation Collection LRASet.Union

/-- Closure under pairwise intersections. -/
def ClosedUnderPairwiseIntersections {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  ClosedUnderBinaryOperation Collection LRASet.Intersection

/-- Closure under pairwise set differences. -/
def ClosedUnderPairwiseDifferences {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  ClosedUnderBinaryOperation Collection LRASet.Difference

/-- Closure under pairwise symmetric differences. -/
def ClosedUnderPairwiseSymmetricDifferences {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  ClosedUnderBinaryOperation Collection LRASet.SymmetricDifference

/-- Closure under countable unions, represented by `Nat`-indexed families. -/
def ClosedUnderCountableUnions {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  ClosedUnderIndexedOperation (Index := Nat) Collection IndexedUnion

/-- Closure under countable intersections, represented by `Nat`-indexed
families. -/
def ClosedUnderCountableIntersections {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  ClosedUnderIndexedOperation (Index := Nat) Collection IndexedIntersection

/-- Closure under arbitrary unions of subcollections. -/
def ClosedUnderArbitraryUnions {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  ClosedUnderCollectionOperation Collection CollectionUnion

/-- Closure under arbitrary intersections of subcollections. -/
def ClosedUnderArbitraryIntersections {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  ClosedUnderCollectionOperation Collection CollectionIntersection

/-- The finite union of a list of sets, with empty finite union equal to the
empty set. -/
def FiniteUnionFromList {Alpha : LRACarrier} :
    List (LRASet Alpha) → LRASet Alpha
  | [] => LRASet.Empty Alpha
  | SetObject :: Tail => LRASet.Union SetObject (FiniteUnionFromList Tail)

/-- The finite intersection of a list of sets, with empty finite intersection
equal to the universal set. -/
def FiniteIntersectionFromList {Alpha : LRACarrier} :
    List (LRASet Alpha) → LRASet Alpha
  | [] => LRASet.Universal Alpha
  | SetObject :: Tail =>
      LRASet.Intersection SetObject (FiniteIntersectionFromList Tail)

/-- Closure under finite unions represented by finite lists. -/
def ClosedUnderFiniteUnions {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  ∀ Sets : List (LRASet Alpha),
    (∀ SetObject : LRASet Alpha,
      SetObject ∈ Sets → LRASet.Member SetObject Collection) →
        LRASet.Member (FiniteUnionFromList Sets) Collection

/-- Closure under finite intersections represented by finite lists. -/
def ClosedUnderFiniteIntersections {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  ∀ Sets : List (LRASet Alpha),
    (∀ SetObject : LRASet Alpha,
      SetObject ∈ Sets → LRASet.Member SetObject Collection) →
        LRASet.Member (FiniteIntersectionFromList Sets) Collection

/-- Pairwise union closure plus membership of the empty set gives finite-union
closure. -/
theorem PairwiseUnionClosureImpliesFiniteUnionClosure {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (EmptyMember : LRASet.Member (LRASet.Empty Alpha) Collection)
    (PairwiseUnionClosed : ClosedUnderPairwiseUnions Collection) :
    ClosedUnderFiniteUnions Collection := by
  sorry

/-- Pairwise intersection closure plus membership of the universal set gives
finite-intersection closure. -/
theorem PairwiseIntersectionClosureImpliesFiniteIntersectionClosure
    {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (UniversalMember : LRASet.Member (LRASet.Universal Alpha) Collection)
    (PairwiseIntersectionClosed :
      ClosedUnderPairwiseIntersections Collection) :
    ClosedUnderFiniteIntersections Collection := by
  sorry

/-- Complement closure converts pairwise union closure into pairwise
intersection closure. -/
theorem ComplementAndPairwiseUnionClosureImpliesPairwiseIntersectionClosure
    {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (ComplementClosed : ClosedUnderComplements Collection)
    (PairwiseUnionClosed : ClosedUnderPairwiseUnions Collection) :
    ClosedUnderPairwiseIntersections Collection := by
  sorry

/-- Complement closure converts pairwise intersection closure into pairwise
union closure. -/
theorem ComplementAndPairwiseIntersectionClosureImpliesPairwiseUnionClosure
    {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (ComplementClosed : ClosedUnderComplements Collection)
    (PairwiseIntersectionClosed :
      ClosedUnderPairwiseIntersections Collection) :
    ClosedUnderPairwiseUnions Collection := by
  sorry

/-- Complement closure converts finite-union closure into finite-intersection
closure. -/
theorem ComplementAndFiniteUnionClosureImpliesFiniteIntersectionClosure
    {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (ComplementClosed : ClosedUnderComplements Collection)
    (FiniteUnionClosed : ClosedUnderFiniteUnions Collection) :
    ClosedUnderFiniteIntersections Collection := by
  sorry

/-- Complement closure converts finite-intersection closure into finite-union
closure. -/
theorem ComplementAndFiniteIntersectionClosureImpliesFiniteUnionClosure
    {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (ComplementClosed : ClosedUnderComplements Collection)
    (FiniteIntersectionClosed : ClosedUnderFiniteIntersections Collection) :
    ClosedUnderFiniteUnions Collection := by
  sorry

end LRA.VolumeI.Set.Implementations.LRASet
