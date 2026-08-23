import LRA.Set.SetClass.Definition

namespace LRA.Set

universe u v

                                                                   
def ClassOfSet {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setObject : SetObject) : SetClass Element :=
  fun element => element ∈ setObject

                                                                               
def Represents {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setObject : SetObject) (setClass : SetClass Element) : Prop :=
  ∀ element, element ∈ setObject ↔ setClass element

                                                                                
def Representable {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setClass : SetClass Element) : Prop :=
  ∃ setObject : SetObject, Represents setObject setClass

                                                                                         
def ProperClass {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setClass : SetClass Element) : Prop :=
  ¬ Representable (SetObject := SetObject) setClass

end LRA.Set
