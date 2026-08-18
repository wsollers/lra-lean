import LRA.Function.Calculus.Classes.Definition
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Operations
import LRA.Function.Definition

namespace LRA.Map.Preimage

open LRA.Set

universe u₁ u₂ v₁ v₂

section Preimage

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁} {CodomainSet : Type v₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]

/-- Historical set-backed spelling of canonical preimage characterization. -/
def IsPreimageOf
    (preimageSet : DomainSet)
    (map : LRA.Function DomainElement CodomainElement)
    (target : CodomainSet) : Prop :=
  LRA.Function.IsPreimageClassOf
    (fun input => input ∈ preimageSet)
    (map)
    (fun output => output ∈ target)

section WithSeparation

variable [HasSeparation DomainElement DomainSet]
variable [HasUniversal DomainSet]

/-- Legacy backend realization of a preimage by Separation. -/
def Preimage
    (map : LRA.Function DomainElement CodomainElement)
    (target : CodomainSet) : DomainSet :=
  HasSeparation.separation (𝒰 : DomainSet)
    (fun input : DomainElement => map input ∈ target)

end WithSeparation

end Preimage

end LRA.Map.Preimage
