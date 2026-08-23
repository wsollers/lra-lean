import LRA.Set.SetClass.Definition

namespace LRA.Set

universe u

namespace SetClass

variable {α : Type u}

                                           
def Empty : SetClass α := fun _ => False

                                                                
def Universal : SetClass α := fun _ => True

                            
def Union (left right : SetClass α) : SetClass α :=
  fun element => left element ∨ right element

                                   
def Intersection (left right : SetClass α) : SetClass α :=
  fun element => left element ∧ right element

                                 
def Difference (left right : SetClass α) : SetClass α :=
  fun element => left element ∧ ¬ right element

                                                         
def Complement (setClass : SetClass α) : SetClass α :=
  fun element => ¬ setClass element

                                
def Included (left right : SetClass α) : Prop :=
  ∀ element, left element → right element

end SetClass

end LRA.Set
