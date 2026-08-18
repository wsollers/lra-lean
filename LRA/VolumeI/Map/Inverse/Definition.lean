import LRA.Function.Operations.Inverse.Definition
import LRA.Set.Interface.Membership
import LRA.Function.Definition

namespace LRA.Map.Inverse

open LRA.Set
universe u v w₁ w₂

/-- Historical typed-map spelling of left inverse. -/
abbrev LeftInverse {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  LRA.Function.LeftInverse map inverse

/-- Historical typed-map spelling of right inverse. -/
abbrev RightInverse {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  LRA.Function.RightInverse map inverse

/-- Historical typed-map spelling of two-sided inverse. -/
abbrev TwoSidedInverse {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  LRA.Function.TwoSidedInverse map inverse

/-- Historical typed-map spelling of the inverse-function relationship. -/
abbrev IsInverseFunction {Domain : Type u} {Codomain : Type v}
    (inverse : LRA.Function Codomain Domain)
    (map : LRA.Function Domain Codomain) : Prop :=
  LRA.Function.IsInverseFunction inverse map

/-! Legacy set-backed restrictions of the inverse laws. -/
def LeftInverseOn {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w₁} [Membership Domain DomainSet]
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (source : DomainSet) : Prop :=
  ∀ input, input ∈ source → inverse (map input) = input

def RightInverseOn {Domain : Type u} {Codomain : Type v}
    {CodomainSet : Type w₂} [Membership Codomain CodomainSet]
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (target : CodomainSet) : Prop :=
  ∀ output, output ∈ target → map (inverse output) = output

def TwoSidedInverseOn {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w₁} {CodomainSet : Type w₂}
    [Membership Domain DomainSet] [Membership Codomain CodomainSet]
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (source : DomainSet)
    (target : CodomainSet) : Prop :=
  LeftInverseOn map inverse source ∧ RightInverseOn map inverse target

/-- Historical package for a typed inverse together with its cancellation laws. -/
structure InverseFunction {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) where
  inverse : LRA.Function Codomain Domain
  isInverse : IsInverseFunction inverse map

end LRA.Map.Inverse
