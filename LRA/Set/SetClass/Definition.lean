namespace LRA.Set

universe u

/-- A set class on a carrier is a predicate selecting objects of that carrier. -/
abbrev SetClass (α : Type u) := α → Prop

/-- An object belongs to a set class exactly when the class predicate holds. -/
def BelongsToClass {α : Type u} (element : α) (setClass : SetClass α) : Prop :=
  setClass element

end LRA.Set
