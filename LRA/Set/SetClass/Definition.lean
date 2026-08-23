namespace LRA.Set

universe u

                                                                                 
abbrev SetClass (α : Type u) := α → Prop

                                                                               
def BelongsToClass {α : Type u} (element : α) (setClass : SetClass α) : Prop :=
  setClass element

end LRA.Set
