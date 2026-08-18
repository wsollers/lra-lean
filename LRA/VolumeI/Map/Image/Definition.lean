import LRA.Function.Calculus.Classes.Definition
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Operations
import LRA.Function.Definition

namespace LRA.Map.Image

open LRA.Set

universe u₁ u₂ v₁ v₂

section Image

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁} {CodomainSet : Type v₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]

/-- Historical set-backed spelling of canonical `MapsIntoClass`. -/
def MapsInto
    (map : LRA.Function DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) : Prop :=
  LRA.Function.MapsIntoClass
    (map)
    (fun input => input ∈ source)
    (fun output => output ∈ target)

/-- Historical set-backed spelling of canonical image characterization. -/
def IsImageOf
    (imageSet : CodomainSet)
    (map : LRA.Function DomainElement CodomainElement)
    (source : DomainSet) : Prop :=
  LRA.Function.IsImageClassOf
    (fun output => output ∈ imageSet)
    (map)
    (fun input => input ∈ source)

section WithSeparation

variable [HasSeparation CodomainElement CodomainSet]
variable [HasUniversal CodomainSet]

/-- Legacy backend realization of an image by Separation. -/
def Image
    (map : LRA.Function DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet :=
  HasSeparation.separation (𝒰 : CodomainSet)
    (fun output : CodomainElement =>
      ∃ input : DomainElement, input ∈ source ∧ map input = output)

/-- Legacy backend realization of the range as the image of an ambient domain. -/
def Range
    (map : LRA.Function DomainElement CodomainElement)
    (ambientDomain : DomainSet) : CodomainSet :=
  Image map ambientDomain

end WithSeparation

end Image

section FiniteImage

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁}
variable [Membership DomainElement DomainSet]

/-- Project-local finite enumeration predicate retained as legacy adapter machinery. -/
def FinitelyEnumerates
    {Element : Type u₁}
    (values : List Element)
    (predicate : Element → Prop) : Prop :=
  ∀ value : Element, value ∈ values ↔ predicate value

/-- A predicate has a finite list enumeration. -/
def HasFiniteEnumeration
    {Element : Type u₁}
    (predicate : Element → Prop) : Prop :=
  ∃ values : List Element, FinitelyEnumerates values predicate

/-- Legacy finiteness predicate for an image. -/
def FiniteImage
    (map : LRA.Function DomainElement CodomainElement)
    (source : DomainSet) : Prop :=
  HasFiniteEnumeration
    (fun output : CodomainElement =>
      ∃ input : DomainElement, input ∈ source ∧ map input = output)

/-- Legacy finiteness predicate for a range relative to an ambient domain. -/
def FiniteRange
    (map : LRA.Function DomainElement CodomainElement)
    (ambientDomain : DomainSet) : Prop :=
  FiniteImage map ambientDomain

end FiniteImage

end LRA.Map.Image
