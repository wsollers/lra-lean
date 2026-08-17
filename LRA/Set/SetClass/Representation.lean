import LRA.Set.SetClass.Definition

namespace LRA.Set

universe u v

/-- Every actual set object determines the class of its members. -/
def ClassOfSet {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setObject : SetObject) : SetClass Element :=
  fun element => element ∈ setObject

/-- A set object represents a class when it has exactly the class's members. -/
def Represents {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setObject : SetObject) (setClass : SetClass Element) : Prop :=
  ∀ element, element ∈ setObject ↔ setClass element

/-- A class is representable in a backend when some set object represents it. -/
def Representable {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setClass : SetClass Element) : Prop :=
  ∃ setObject : SetObject, Represents setObject setClass

/-- A proper class relative to a backend is a class not represented by any set object. -/
def ProperClass {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setClass : SetClass Element) : Prop :=
  ¬ Representable (SetObject := SetObject) setClass

end LRA.Set
