import LRA.VolumeI.Function.Inverse.Definition
import LRA.VolumeI.Function.Bijective.Definition
import LRA.VolumeI.Function.Preimage.Definition
import LRA.VolumeI.Function.Image.Definition
import LRA.VolumeI.Function.Image.Theorems

namespace LRA.Function.Inverse

open LRA.Set
open LRA.Function

universe u v w₁ w₂

section TypedInverse

variable {Domain : Type u} {Codomain : Type v}

/--
**[Theorem — InverseFunctionLeftCancellation]**

An inverse function cancels the original map on the left.

Logical form:

```lean
theorem InverseFunctionLeftCancellation
    (map : Function Domain Codomain)
    (inverse : InverseFunction map)
    (input : Domain) :
    inverse.inverse (map input) = input
```
-/
theorem InverseFunctionLeftCancellation
    (map : Function Domain Codomain)
    (inverse : InverseFunction map)
    (input : Domain) :
    inverse.inverse (map input) = input := by
  sorry

/--
**[Theorem — InverseFunctionRightCancellation]**

An inverse function cancels the original map on the right.

Logical form:

```lean
theorem InverseFunctionRightCancellation
    (map : Function Domain Codomain)
    (inverse : InverseFunction map)
    (output : Codomain) :
    map (inverse.inverse output) = output
```
-/
theorem InverseFunctionRightCancellation
    (map : Function Domain Codomain)
    (inverse : InverseFunction map)
    (output : Codomain) :
    map (inverse.inverse output) = output := by
  sorry

/--
**[Theorem — TwoSidedInverseBijective]**

Any two-sided inverse is bijective as a map in the reverse direction.

Logical form:

```lean
theorem TwoSidedInverseBijective
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (inverseLaw : TwoSidedInverse map inverse) :
    LRA.Function.Bijective.Bijective inverse
```
-/
theorem TwoSidedInverseBijective
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (inverseLaw : TwoSidedInverse map inverse) :
    LRA.Function.Bijective.Bijective inverse := by
  sorry

/--
**[Theorem — InverseFunctionBijective]**

An inverse function is bijective.

Logical form:

```lean
theorem InverseFunctionBijective
    (map : Function Domain Codomain)
    (inverse : InverseFunction map) :
    LRA.Function.Bijective.Bijective inverse.inverse
```
-/
theorem InverseFunctionBijective
    (map : Function Domain Codomain)
    (inverse : InverseFunction map) :
    LRA.Function.Bijective.Bijective inverse.inverse := by
  sorry

/--
**[Theorem — LeftInverseImpliesLeftInverseOn]**

A global left inverse restricts to any source set.

Logical form:

```lean
theorem LeftInverseImpliesLeftInverseOn
    {DomainSet : Type w₁} [Membership Domain DomainSet]
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (source : DomainSet)
    (leftInverse : LeftInverse map inverse) :
    LeftInverseOn map inverse source
```
-/
theorem LeftInverseImpliesLeftInverseOn
    {DomainSet : Type w₁} [Membership Domain DomainSet]
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (source : DomainSet)
    (leftInverse : LeftInverse map inverse) :
    LeftInverseOn map inverse source := by
  sorry
/--
**[Theorem — RightInverseImpliesRightInverseOn]**

A global right inverse restricts to any target set.

Logical form:

```lean
theorem RightInverseImpliesRightInverseOn
    {CodomainSet : Type w₂} [Membership Codomain CodomainSet]
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (target : CodomainSet)
    (rightInverse : RightInverse map inverse) :
    RightInverseOn map inverse target
```
-/
theorem RightInverseImpliesRightInverseOn
    {CodomainSet : Type w₂} [Membership Codomain CodomainSet]
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (target : CodomainSet)
    (rightInverse : RightInverse map inverse) :
    RightInverseOn map inverse target := by
  sorry
/--
**[Theorem — TwoSidedInverseImpliesTwoSidedInverseOn]**

A two-sided inverse restricts to any chosen source and target.

Logical form:

```lean
theorem TwoSidedInverseImpliesTwoSidedInverseOn
    {DomainSet : Type w₁} {CodomainSet : Type w₂}
    [Membership Domain DomainSet] [Membership Codomain CodomainSet]
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (source : DomainSet)
    (target : CodomainSet)
    (inverseLaw : TwoSidedInverse map inverse) :
    TwoSidedInverseOn map inverse source target
```
-/
theorem TwoSidedInverseImpliesTwoSidedInverseOn
    {DomainSet : Type w₁} {CodomainSet : Type w₂}
    [Membership Domain DomainSet] [Membership Codomain CodomainSet]
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (source : DomainSet)
    (target : CodomainSet)
    (inverseLaw : TwoSidedInverse map inverse) :
    TwoSidedInverseOn map inverse source target := by
  sorry
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
**[Theorem — RightInverseOnImageOfLeftInverseOn]**

If an inverse recovers every point of a source after applying the map, then it
is a right inverse on the image of that source.

Logical form:

```lean
theorem RightInverseOnImageOfLeftInverseOn
    (map : Function DomainElement CodomainElement)
    (inverse : Function CodomainElement DomainElement)
    (source : DomainSet)
    (leftInverse : LeftInverseOn map inverse source) :
    RightInverseOn map inverse
      (LRA.Function.Image.Image map source : CodomainSet)
```
-/
theorem RightInverseOnImageOfLeftInverseOn
    (map : Function DomainElement CodomainElement)
    (inverse : Function CodomainElement DomainElement)
    (source : DomainSet)
    (leftInverse : LeftInverseOn map inverse source) :
    RightInverseOn map inverse
      (LRA.Function.Image.Image map source : CodomainSet) := by
  sorry

/--
**[Theorem — TwoSidedInverseOnImageOfLeftInverseOn]**

An inverse on a source is automatically a two-sided inverse between the source
and its image.

Logical form:

```lean
theorem TwoSidedInverseOnImageOfLeftInverseOn
    (map : Function DomainElement CodomainElement)
    (inverse : Function CodomainElement DomainElement)
    (source : DomainSet)
    (leftInverse : LeftInverseOn map inverse source) :
    TwoSidedInverseOn map inverse source
      (LRA.Function.Image.Image map source : CodomainSet)
```
-/
theorem TwoSidedInverseOnImageOfLeftInverseOn
    (map : Function DomainElement CodomainElement)
    (inverse : Function CodomainElement DomainElement)
    (source : DomainSet)
    (leftInverse : LeftInverseOn map inverse source) :
    TwoSidedInverseOn map inverse source
      (LRA.Function.Image.Image map source : CodomainSet) := by
  sorry
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
**[Theorem — PreimageEqualsImageOfInverseFunction]**

For a bijective map with inverse function, set-valued preimage agrees with
direct image under the inverse function.

Logical form:

```lean
theorem PreimageEqualsImageOfInverseFunction
    (map : Function DomainElement CodomainElement)
    (inverse : InverseFunction map)
    (target : CodomainSet) :
    (LRA.Function.Preimage.Preimage map target : DomainSet) =
      LRA.Function.Image.Image inverse.inverse target
```
-/
theorem PreimageEqualsImageOfInverseFunction
    (map : Function DomainElement CodomainElement)
    (inverse : InverseFunction map)
    (target : CodomainSet) :
    (LRA.Function.Preimage.Preimage map target : DomainSet) =
      LRA.Function.Image.Image inverse.inverse target := by
  sorry

end SetPreimageCompatibility

end LRA.Function.Inverse
