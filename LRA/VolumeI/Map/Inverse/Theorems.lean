import LRA.VolumeI.Map.Inverse.Definition
import LRA.VolumeI.Map.Bijective.Definition
import LRA.VolumeI.Map.Preimage.Definition
import LRA.VolumeI.Map.Image.Definition
import LRA.VolumeI.Map.Image.Theorems

namespace LRA.Map.Inverse

open LRA.Set
open LRA.Map.Typed

universe u v w₁ w₂

section TypedInverse

variable {Domain : Type u} {Codomain : Type v}

/--
An inverse function cancels the original map on the left.
-/
theorem InverseFunctionLeftCancellation
    (map : TypedMap Domain Codomain)
    (inverse : InverseFunction map)
    (input : Domain) :
    inverse.inverse (map input) = input := by
  sorry

/--
An inverse function cancels the original map on the right.
-/
theorem InverseFunctionRightCancellation
    (map : TypedMap Domain Codomain)
    (inverse : InverseFunction map)
    (output : Codomain) :
    map (inverse.inverse output) = output := by
  sorry

/--
Any two-sided inverse is bijective as a map in the reverse direction.
-/
theorem TwoSidedInverseBijective
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain)
    (inverseLaw : TwoSidedInverse map inverse) :
    LRA.Map.Bijective.Bijective inverse := by
  sorry

/--
An inverse function is bijective.
-/
theorem InverseFunctionBijective
    (map : TypedMap Domain Codomain)
    (inverse : InverseFunction map) :
    LRA.Map.Bijective.Bijective inverse.inverse := by
  sorry

/--
A global left inverse restricts to any source set.
-/
theorem LeftInverseImpliesLeftInverseOn
    {DomainSet : Type w₁} [Membership Domain DomainSet]
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain)
    (source : DomainSet)
    (leftInverse : LeftInverse map inverse) :
    LeftInverseOn map inverse source := by
  intro input _
  exact leftInverse input

/--
A global right inverse restricts to any target set.
-/
theorem RightInverseImpliesRightInverseOn
    {CodomainSet : Type w₂} [Membership Codomain CodomainSet]
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain)
    (target : CodomainSet)
    (rightInverse : RightInverse map inverse) :
    RightInverseOn map inverse target := by
  intro output _
  exact rightInverse output

/--
A two-sided inverse restricts to any chosen source and target.
-/
theorem TwoSidedInverseImpliesTwoSidedInverseOn
    {DomainSet : Type w₁} {CodomainSet : Type w₂}
    [Membership Domain DomainSet] [Membership Codomain CodomainSet]
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain)
    (source : DomainSet)
    (target : CodomainSet)
    (inverseLaw : TwoSidedInverse map inverse) :
    TwoSidedInverseOn map inverse source target := by
  exact
    ⟨LeftInverseImpliesLeftInverseOn map inverse source inverseLaw.1,
      RightInverseImpliesRightInverseOn map inverse target inverseLaw.2⟩

end TypedInverse

section InverseOnImage

variable {DomainElement : Type u} {CodomainElement : Type v}
variable {DomainSet : Type w₁} {CodomainSet : Type w₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]
variable [HasSeparation CodomainElement CodomainSet]
variable [HasUniversal CodomainSet]
variable [HasComplement CodomainSet]
variable [SeparationLaws CodomainElement CodomainSet]
variable [UniversalMembershipLaws CodomainElement CodomainSet]

/--
If an inverse recovers every point of a source after applying the map, then it
is a right inverse on the image of that source.
-/
theorem RightInverseOnImageOfLeftInverseOn
    (map : TypedMap DomainElement CodomainElement)
    (inverse : TypedMap CodomainElement DomainElement)
    (source : DomainSet)
    (leftInverse : LeftInverseOn map inverse source) :
    RightInverseOn map inverse
      (LRA.Map.Image.Image map source : CodomainSet) := by
  sorry

/--
An inverse on a source is automatically a two-sided inverse between the source
and its image.
-/
theorem TwoSidedInverseOnImageOfLeftInverseOn
    (map : TypedMap DomainElement CodomainElement)
    (inverse : TypedMap CodomainElement DomainElement)
    (source : DomainSet)
    (leftInverse : LeftInverseOn map inverse source) :
    TwoSidedInverseOn map inverse source
      (LRA.Map.Image.Image map source : CodomainSet) := by
  exact
    ⟨leftInverse,
      RightInverseOnImageOfLeftInverseOn map inverse source leftInverse⟩

end InverseOnImage

section SetPreimageCompatibility

variable {DomainElement : Type u} {CodomainElement : Type v}
variable {DomainSet : Type w₁} {CodomainSet : Type w₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]
variable [HasSeparation DomainElement DomainSet]
variable [HasUniversal DomainSet]
variable [HasComplement DomainSet]
variable [HasSeparation CodomainElement CodomainSet]
variable [HasUniversal CodomainSet]
variable [ExtensionalityLaw DomainElement DomainSet]
variable [SeparationLaws DomainElement DomainSet]
variable [UniversalMembershipLaws DomainElement DomainSet]

/--
For a bijective map with inverse function, set-valued preimage agrees with
direct image under the inverse function.
-/
theorem PreimageEqualsImageOfInverseFunction
    (map : TypedMap DomainElement CodomainElement)
    (inverse : InverseFunction map)
    (target : CodomainSet) :
    (LRA.Map.Preimage.Preimage map target : DomainSet) =
      LRA.Map.Image.Image inverse.inverse target := by
  sorry

end SetPreimageCompatibility

end LRA.Map.Inverse
