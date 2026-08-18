import LRA.Function.Calculus.Classes.Definition

/-!
Finiteness of an image or a range, by list enumeration.

**Why this has no relation-level analogue.** The §7.1.2 audit relocated every
image and preimage law that holds of an arbitrary relation to
`LRA.Set.Interface.RelationLaws`. This concept could not be relocated, because
neither `LRA.Set.Interface.RelationSets` nor `LRA.Relation.Calculus` has any
finiteness vocabulary at all — there is no relation-level notion of a finite
image to specialize. The predicate below is therefore stated here, over a list
enumeration, and is the only genuinely new mathematics the audit found in
`LRA/VolumeI/Map/{Image,Preimage,Fiber,Inverse}`.
-/

namespace LRA.Function

open LRA.Set
universe u v

/-- A list enumerates a class exactly when membership in the list and the class
agree. -/
def FinitelyEnumerates {Element : Type u}
    (values : List Element) (selected : SetClass Element) : Prop :=
  ∀ value : Element, value ∈ values ↔ selected value

/-- A class has a finite enumeration when some list enumerates it. -/
def HasFiniteEnumeration {Element : Type u}
    (selected : SetClass Element) : Prop :=
  ∃ values : List Element, FinitelyEnumerates values selected

/-- The image of a source class under a function is finite. -/
def FiniteImage {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  HasFiniteEnumeration (ImageClass function source)

/-- The range of a function is finite. -/
def FiniteRange {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  HasFiniteEnumeration (RangeClass function)

end LRA.Function
