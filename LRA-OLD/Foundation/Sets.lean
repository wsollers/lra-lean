import LRA.Foundation.Definitions

namespace LRA.Foundation

universe u v

abbrev SetFamily (ι : LRACarrier) (α : LRACarrier) := ι → LRASet α

namespace LRASet

def member {α : LRACarrier} (element : α) (subset : LRASet α) : Prop :=
  subset element

def empty (α : LRACarrier) : LRASet α :=
  fun _ => False

def universal (α : LRACarrier) : LRASet α :=
  fun _ => True

def singleton {α : LRACarrier} (element : α) : LRASet α :=
  fun candidate => candidate = element

def union {α : LRACarrier} (left right : LRASet α) : LRASet α :=
  fun element => member element left ∨ member element right

def intersection {α : LRACarrier} (left right : LRASet α) : LRASet α :=
  fun element => member element left ∧ member element right

def complement {α : LRACarrier} (subset : LRASet α) : LRASet α :=
  fun element => ¬ member element subset

def difference {α : LRACarrier} (left right : LRASet α) : LRASet α :=
  fun element => member element left ∧ ¬ member element right

def symmetricDifference {α : LRACarrier} (left right : LRASet α) : LRASet α :=
  union (difference left right) (difference right left)

def subset {α : LRACarrier} (left right : LRASet α) : Prop :=
  ∀ element, member element left → member element right

def properSubset {α : LRACarrier} (left right : LRASet α) : Prop :=
  subset left right ∧ ¬ subset right left

def disjoint {α : LRACarrier} (left right : LRASet α) : Prop :=
  ∀ element, member element left → member element right → False

def nonempty {α : LRACarrier} (subset : LRASet α) : Prop :=
  ∃ element, member element subset

def indexedUnion {ι α : LRACarrier} (family : SetFamily ι α) : LRASet α :=
  fun element => ∃ index, member element (family index)

def indexedIntersection {ι α : LRACarrier} (family : SetFamily ι α) : LRASet α :=
  fun element => ∀ index, member element (family index)

def powerSet {α : LRACarrier} (baseSet : LRASet α) : LRASet (LRASet α) :=
  fun candidate => subset candidate baseSet

def inclusionMonotone {α β : LRACarrier} (operation : LRASet α → LRASet β) : Prop :=
  ∀ left right, subset left right → subset (operation left) (operation right)

def inclusionAntitone {α β : LRACarrier} (operation : LRASet α → LRASet β) : Prop :=
  ∀ left right, subset left right → subset (operation right) (operation left)

def finiteSet {α : LRACarrier} (subset : LRASet α) : Prop :=
  ∃ size : Nat, ∃ enumeration : Fin size → α,
    ∀ element, member element subset → ∃ index, enumeration index = element

def covers {α : LRACarrier} (collection : LRASet (LRASet α)) (target : LRASet α) :
    Prop :=
  ∀ element, member element target → ∃ coveringSet,
    member coveringSet collection ∧ member element coveringSet

def subcover {α : LRACarrier} (subcollection collection : LRASet (LRASet α))
    (target : LRASet α) : Prop :=
  subset subcollection collection ∧ covers subcollection target

def finiteCover {α : LRACarrier} (collection : LRASet (LRASet α))
    (target : LRASet α) : Prop :=
  covers collection target ∧ finiteSet collection

def openCover {α : LRACarrier} (topology collection : LRASet (LRASet α))
    (target : LRASet α) : Prop :=
  covers collection target ∧ subset collection topology

def finiteIntersectionProperty {α : LRACarrier} (collection : LRASet (LRASet α)) :
    Prop :=
  ∀ finiteSubcollection,
    subset finiteSubcollection collection →
      finiteSet finiteSubcollection →
        ∃ element, ∀ memberSet,
          member memberSet finiteSubcollection → member element memberSet

theorem extensionality {α : LRACarrier} {left right : LRASet α}
    (sameMembers : ∀ element, member element left ↔ member element right) :
    left = right := by
  funext element
  exact propext (sameMembers element)

theorem intersection_union_distributes_left
    {α : LRACarrier} (left middle right : LRASet α) :
    intersection left (union middle right) =
      union (intersection left middle) (intersection left right) := by
  apply extensionality
  intro element
  constructor
  · intro elementInLeftAndUnion
    exact
      match elementInLeftAndUnion with
      | ⟨elementInLeft, Or.inl elementInMiddle⟩ =>
          Or.inl ⟨elementInLeft, elementInMiddle⟩
      | ⟨elementInLeft, Or.inr elementInRight⟩ =>
          Or.inr ⟨elementInLeft, elementInRight⟩
  · intro elementInUnionOfIntersections
    exact
      match elementInUnionOfIntersections with
      | Or.inl ⟨elementInLeft, elementInMiddle⟩ =>
          ⟨elementInLeft, Or.inl elementInMiddle⟩
      | Or.inr ⟨elementInLeft, elementInRight⟩ =>
          ⟨elementInLeft, Or.inr elementInRight⟩

theorem union_commutative {α : LRACarrier} (left right : LRASet α) :
    union left right = union right left := by
  apply extensionality
  intro element
  constructor
  · intro elementInUnion
    exact Or.elim elementInUnion Or.inr Or.inl
  · intro elementInUnion
    exact Or.elim elementInUnion Or.inr Or.inl

theorem intersection_commutative {α : LRACarrier} (left right : LRASet α) :
    intersection left right = intersection right left := by
  apply extensionality
  intro element
  constructor
  · intro elementInIntersection
    exact ⟨elementInIntersection.2, elementInIntersection.1⟩
  · intro elementInIntersection
    exact ⟨elementInIntersection.2, elementInIntersection.1⟩

theorem union_monotone_inclusion {α : LRACarrier} {left right fixed : LRASet α}
    (leftSubsetRight : subset left right) :
    subset (union left fixed) (union right fixed) ∧
      subset (union fixed left) (union fixed right) := by
  constructor
  · intro element elementInUnion
    exact
      match elementInUnion with
      | Or.inl elementInLeft => Or.inl (leftSubsetRight element elementInLeft)
      | Or.inr elementInFixed => Or.inr elementInFixed
  · intro element elementInUnion
    exact
      match elementInUnion with
      | Or.inl elementInFixed => Or.inl elementInFixed
      | Or.inr elementInLeft => Or.inr (leftSubsetRight element elementInLeft)

theorem intersection_monotone_inclusion {α : LRACarrier} {left right fixed : LRASet α}
    (leftSubsetRight : subset left right) :
    subset (intersection left fixed) (intersection right fixed) ∧
      subset (intersection fixed left) (intersection fixed right) := by
  constructor
  · intro element elementInIntersection
    exact ⟨leftSubsetRight element elementInIntersection.1, elementInIntersection.2⟩
  · intro element elementInIntersection
    exact ⟨elementInIntersection.1, leftSubsetRight element elementInIntersection.2⟩

theorem power_set_monotone_inclusion {α : LRACarrier} {left right : LRASet α}
    (leftSubsetRight : subset left right) :
    subset (powerSet left) (powerSet right) := by
  intro candidate candidateSubsetLeft element elementInCandidate
  exact leftSubsetRight element (candidateSubsetLeft element elementInCandidate)

theorem complement_antitone_inclusion {α : LRACarrier} {left right : LRASet α}
    (leftSubsetRight : subset left right) :
    subset (complement right) (complement left) := by
  intro element elementNotInRight elementInLeft
  exact elementNotInRight (leftSubsetRight element elementInLeft)

theorem set_difference_monotone_left {α : LRACarrier} {left right fixed : LRASet α}
    (leftSubsetRight : subset left right) :
    subset (difference left fixed) (difference right fixed) := by
  intro element elementInDifference
  exact ⟨leftSubsetRight element elementInDifference.1, elementInDifference.2⟩

theorem set_difference_antitone_right {α : LRACarrier} {base left right : LRASet α}
    (leftSubsetRight : subset left right) :
    subset (difference base right) (difference base left) := by
  intro element elementInDifference
  exact ⟨elementInDifference.1, fun elementInLeft =>
    elementInDifference.2 (leftSubsetRight element elementInLeft)⟩

theorem de_morgan_union {α : LRACarrier} (left right : LRASet α) :
    complement (union left right) = intersection (complement left) (complement right) := by
  apply extensionality
  intro element
  constructor
  · intro elementNotInUnion
    exact ⟨fun elementInLeft => elementNotInUnion (Or.inl elementInLeft),
      fun elementInRight => elementNotInUnion (Or.inr elementInRight)⟩
  · intro elementNotInBoth elementInUnion
    exact
      match elementInUnion with
      | Or.inl elementInLeft => elementNotInBoth.1 elementInLeft
      | Or.inr elementInRight => elementNotInBoth.2 elementInRight

theorem de_morgan_intersection {α : LRACarrier} (left right : LRASet α) :
    complement (intersection left right) = union (complement left) (complement right) := by
  classical
  apply extensionality
  intro element
  constructor
  · intro elementNotInIntersection
    by_cases elementInLeft : member element left
    · exact Or.inr (fun elementInRight => elementNotInIntersection ⟨elementInLeft, elementInRight⟩)
    · exact Or.inl elementInLeft
  · intro elementNotInEither elementInIntersection
    exact
      match elementNotInEither with
      | Or.inl elementNotInLeft => elementNotInLeft elementInIntersection.1
      | Or.inr elementNotInRight => elementNotInRight elementInIntersection.2

theorem indexed_de_morgan_union {ι α : LRACarrier} (family : SetFamily ι α) :
    complement (indexedUnion family) =
      indexedIntersection fun index => complement (family index) := by
  apply extensionality
  intro element
  constructor
  · intro elementNotInUnion index elementInFamily
    exact elementNotInUnion ⟨index, elementInFamily⟩
  · intro elementInAllComplements elementInUnion
    obtain ⟨index, elementInFamily⟩ := elementInUnion
    exact elementInAllComplements index elementInFamily

theorem indexed_de_morgan_intersection {ι α : LRACarrier} (family : SetFamily ι α) :
    complement (indexedIntersection family) =
      indexedUnion fun index => complement (family index) := by
  classical
  apply extensionality
  intro element
  constructor
  · intro elementNotInIntersection
    by_cases complementWitness : ∃ index, ¬ member element (family index)
    · exact complementWitness
    · exact False.elim (elementNotInIntersection fun index =>
        Classical.byContradiction fun elementNotInFamily =>
          complementWitness ⟨index, elementNotInFamily⟩)
  · intro elementInIndexedUnion elementInIntersection
    obtain ⟨index, elementNotInFamily⟩ := elementInIndexedUnion
    exact elementNotInFamily (elementInIntersection index)

theorem indexed_intersection_union_distributes_left
    {ι α : LRACarrier} (left : LRASet α) (family : SetFamily ι α) :
    intersection left (indexedUnion family) =
      indexedUnion fun index => intersection left (family index) := by
  apply extensionality
  intro element
  constructor
  · intro elementInIntersection
    obtain ⟨index, elementInFamily⟩ := elementInIntersection.2
    exact ⟨index, ⟨elementInIntersection.1, elementInFamily⟩⟩
  · intro elementInIndexedUnion
    obtain ⟨index, elementInIntersection⟩ := elementInIndexedUnion
    exact ⟨elementInIntersection.1, ⟨index, elementInIntersection.2⟩⟩

theorem indexed_union_intersection_distributes_left
    {ι α : LRACarrier} (left : LRASet α) (family : SetFamily ι α) :
    union left (indexedIntersection family) =
      indexedIntersection fun index => union left (family index) := by
  classical
  apply extensionality
  intro element
  constructor
  · intro elementInUnion index
    exact
      match elementInUnion with
      | Or.inl elementInLeft => Or.inl elementInLeft
      | Or.inr elementInEveryFamily => Or.inr (elementInEveryFamily index)
  · intro elementInEveryUnion
    by_cases elementInLeft : member element left
    · exact Or.inl elementInLeft
    · exact Or.inr fun index =>
        match elementInEveryUnion index with
        | Or.inl contradictoryElementInLeft => False.elim (elementInLeft contradictoryElementInLeft)
        | Or.inr elementInFamily => elementInFamily

end LRASet

end LRA.Foundation
