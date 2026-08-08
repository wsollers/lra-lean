import Mathlib.Data.Set.Finite.Basic
import LRA.VolumeI.Set.Implementations.LRASet.Operations.Families.Indexed

namespace LRA.VolumeI.Set.Implementations.LRASet

/-- A collection of subsets of `Alpha`, represented as a typed set whose
members are typed subsets of `Alpha`. -/
abbrev SetCollection (Alpha : LRACarrier) := LRASet (LRASet Alpha)

/-- A family of subsets selected by an index type. This name emphasizes that
each indexed value is itself a subset of the common carrier. -/
abbrev IndexedFamilyOfSubsets (Index Alpha : LRACarrier) :=
  IndexedFamily Index Alpha

/-- The union of a collection of subsets is the set of elements belonging to at
least one member of the collection. -/
def CollectionUnion {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : LRASet Alpha :=
  fun element => ∃ MemberSet : LRASet Alpha,
    LRASet.Member MemberSet Collection ∧ LRASet.Member element MemberSet

/-- The intersection of a collection of subsets is the set of elements
belonging to every member of the collection. -/
def CollectionIntersection {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : LRASet Alpha :=
  fun element => ∀ MemberSet : LRASet Alpha,
    LRASet.Member MemberSet Collection → LRASet.Member element MemberSet

/-- A collection covers a target set when each target element lies in some
member of the collection. -/
def Covers {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) (Target : LRASet Alpha) : Prop :=
  LRASet.Subset Target (CollectionUnion Collection)

/-- A subcover is a subcollection that still covers the same target set. -/
def Subcover {Alpha : LRACarrier}
    (Subcollection Collection : SetCollection Alpha)
    (Target : LRASet Alpha) : Prop :=
  LRASet.Subset Subcollection Collection ∧ Covers Subcollection Target

/-- A finite collection of subsets. -/
def FiniteCollection {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  _root_.Set.Finite Collection

/-- A finite subcover is a finite subcollection that still covers the same
target set. -/
def FiniteSubcover {Alpha : LRACarrier}
    (Subcollection Collection : SetCollection Alpha)
    (Target : LRASet Alpha) : Prop :=
  Subcover Subcollection Collection Target ∧ FiniteCollection Subcollection

/-- A collection has no finite subcover of a target when no finite
subcollection covers the target. -/
def HasNoFiniteSubcover {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) (Target : LRASet Alpha) : Prop :=
  ∀ Subcollection : SetCollection Alpha,
    LRASet.Subset Subcollection Collection →
      FiniteCollection Subcollection →
        ¬ Covers Subcollection Target

/-- A collection has a finite subcover of a target when some finite
subcollection covers the target. -/
def HasFiniteSubcover {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) (Target : LRASet Alpha) : Prop :=
  ∃ Subcollection : SetCollection Alpha,
    LRASet.Subset Subcollection Collection ∧
      FiniteCollection Subcollection ∧
        Covers Subcollection Target

/-- A collection has the finite intersection property when every finite
subcollection has nonempty intersection. -/
def FiniteIntersectionProperty {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  ∀ Subcollection : SetCollection Alpha,
    LRASet.Subset Subcollection Collection →
      FiniteCollection Subcollection →
        LRASet.Nonempty (CollectionIntersection Subcollection)

/-- The collection of complements relative to a fixed target set. If
`Collection` is a family of candidate covering sets for `Target`, then
`RelativeComplementCollection Target Collection` contains the sets
`Target \ U` for `U ∈ Collection`. -/
def RelativeComplementCollection {Alpha : LRACarrier}
    (Target : LRASet Alpha) (Collection : SetCollection Alpha) :
    SetCollection Alpha :=
  fun Candidate => ∃ MemberSet : LRASet Alpha,
    LRASet.Member MemberSet Collection ∧
      Candidate = LRASet.Difference Target MemberSet

/-- Cover membership expanded elementwise. -/
theorem CoversElementwiseIff {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) (Target : LRASet Alpha) :
    Covers Collection Target ↔
      ∀ element, LRASet.Member element Target →
        ∃ MemberSet : LRASet Alpha,
          LRASet.Member MemberSet Collection ∧
            LRASet.Member element MemberSet := by
  sorry

/-- Subcover membership expanded into subcollection and cover conditions. -/
theorem SubcoverIff {Alpha : LRACarrier}
    (Subcollection Collection : SetCollection Alpha)
    (Target : LRASet Alpha) :
    Subcover Subcollection Collection Target ↔
      LRASet.Subset Subcollection Collection ∧
        Covers Subcollection Target := by
  sorry

/-- Finite subcover membership expanded into subcover and finiteness
conditions. -/
theorem FiniteSubcoverIff {Alpha : LRACarrier}
    (Subcollection Collection : SetCollection Alpha)
    (Target : LRASet Alpha) :
    FiniteSubcover Subcollection Collection Target ↔
      Subcover Subcollection Collection Target ∧
        FiniteCollection Subcollection := by
  sorry

/-- A collection fails to cover a target exactly when the intersection of the
relative complements of its members inside the target is nonempty. -/
theorem CoverFailureIffRelativeComplementIntersectionNonempty {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) (Target : LRASet Alpha) :
    ¬ Covers Collection Target ↔
      LRASet.Nonempty
        (CollectionIntersection (RelativeComplementCollection Target Collection)) := by
  sorry

/-- A collection has no finite subcover of a target exactly when the relative
complement collection has the finite intersection property. -/
theorem NoFiniteSubcoverIffRelativeComplementFIP {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) (Target : LRASet Alpha) :
    HasNoFiniteSubcover Collection Target ↔
      FiniteIntersectionProperty (RelativeComplementCollection Target Collection) := by
  sorry

/-- A collection has a finite subcover of a target exactly when the relative
complement collection fails the finite intersection property. -/
theorem FiniteSubcoverIffRelativeComplementNotFIP {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) (Target : LRASet Alpha) :
    HasFiniteSubcover Collection Target ↔
      ¬ FiniteIntersectionProperty (RelativeComplementCollection Target Collection) := by
  sorry

end LRA.VolumeI.Set.Implementations.LRASet
