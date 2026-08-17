import LRA.Function.Operations.Inverse.Definition
import LRA.VolumeI.Map.Typed.Definition
import LRA.Set.Interface.Membership

namespace LRA.Map.Inverse

open LRA.Map.Typed
open LRA.Set
universe u v w₁ w₂

/-- Historical typed-map spelling of left inverse. -/
abbrev LeftInverse {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain) : Prop :=
  LRA.Function.LeftInverseTyped map inverse

/-- Historical typed-map spelling of right inverse. -/
abbrev RightInverse {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain) : Prop :=
  LRA.Function.RightInverseTyped map inverse

/-- Historical typed-map spelling of two-sided inverse. -/
abbrev TwoSidedInverse {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain) : Prop :=
  LRA.Function.TwoSidedInverseTyped map inverse

/-- Historical typed-map spelling of the inverse-function relationship. -/
abbrev IsInverseFunction {Domain : Type u} {Codomain : Type v}
    (inverse : TypedMap Codomain Domain)
    (map : TypedMap Domain Codomain) : Prop :=
  LRA.Function.IsInverseTypedFunction inverse map

/-! Legacy set-backed restrictions of the inverse laws. -/
def LeftInverseOn {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w₁} [Membership Domain DomainSet]
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain)
    (source : DomainSet) : Prop :=
  ∀ input, input ∈ source → inverse (map input) = input

def RightInverseOn {Domain : Type u} {Codomain : Type v}
    {CodomainSet : Type w₂} [Membership Codomain CodomainSet]
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain)
    (target : CodomainSet) : Prop :=
  ∀ output, output ∈ target → map (inverse output) = output

def TwoSidedInverseOn {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w₁} {CodomainSet : Type w₂}
    [Membership Domain DomainSet] [Membership Codomain CodomainSet]
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain)
    (source : DomainSet)
    (target : CodomainSet) : Prop :=
  LeftInverseOn map inverse source ∧ RightInverseOn map inverse target

/-- Historical package for a typed inverse together with its cancellation laws. -/
structure InverseFunction {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) where
  inverse : TypedMap Codomain Domain
  isInverse : IsInverseFunction inverse map

end LRA.Map.Inverse
