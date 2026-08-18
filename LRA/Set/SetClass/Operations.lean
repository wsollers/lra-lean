import LRA.Set.SetClass.Definition

namespace LRA.Set

universe u

namespace SetClass

variable {α : Type u}

/-- The empty class contains no objects. -/
def Empty : SetClass α := fun _ => False

/-- The universal class contains every object of the carrier. -/
def Universal : SetClass α := fun _ => True

/-- Union of set classes. -/
def Union (left right : SetClass α) : SetClass α :=
  fun element => left element ∨ right element

/-- Intersection of set classes. -/
def Intersection (left right : SetClass α) : SetClass α :=
  fun element => left element ∧ right element

/-- Difference of set classes. -/
def Difference (left right : SetClass α) : SetClass α :=
  fun element => left element ∧ ¬ right element

/-- Complement of a set class relative to its carrier. -/
def Complement (setClass : SetClass α) : SetClass α :=
  fun element => ¬ setClass element

/-- Inclusion of set classes. -/
def Included (left right : SetClass α) : Prop :=
  ∀ element, left element → right element

end SetClass

end LRA.Set
