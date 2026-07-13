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

end LRASet

end LRA.Foundation
