import LRA.VolumeI.Map.Inverse.Definition
import LRA.VolumeI.Map.Preimage.Definition
import LRA.VolumeI.Map.Image.Definition
import LRA.VolumeI.Map.Image.Theorems
import LRA.Function.Definition
import LRA.Function.Properties.Definition

namespace LRA.Map.Inverse

open LRA.Set

universe u v w₁ w₂

section TypedInverse

variable {Domain : Type u} {Codomain : Type v}

/--
**[Theorem — InverseFunctionLeftCancellation]**

An inverse function cancels the original map on the left.

Logical form:

```lean
theorem InverseFunctionLeftCancellation
    (map : LRA.Function Domain Codomain)
    (inverse : InverseFunction map)
    (input : Domain) :
    inverse.inverse (map input) = input
```
-/
theorem InverseFunctionLeftCancellation
    (map : LRA.Function Domain Codomain)
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
    (map : LRA.Function Domain Codomain)
    (inverse : InverseFunction map)
    (output : Codomain) :
    map (inverse.inverse output) = output
```
-/
theorem InverseFunctionRightCancellation
    (map : LRA.Function Domain Codomain)
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
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (inverseLaw : TwoSidedInverse map inverse) :
    LRA.Function.Bijective inverse
```
-/
theorem TwoSidedInverseBijective
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (inverseLaw : TwoSidedInverse map inverse) :
    LRA.Function.Bijective inverse := by
  sorry

/--
**[Theorem — InverseFunctionBijective]**

An inverse function is bijective.

Logical form:

```lean
theorem InverseFunctionBijective
    (map : LRA.Function Domain Codomain)
    (inverse : InverseFunction map) :
    LRA.Function.Bijective inverse.inverse
```
-/
theorem InverseFunctionBijective
    (map : LRA.Function Domain Codomain)
    (inverse : InverseFunction map) :
    LRA.Function.Bijective inverse.inverse := by
  sorry

/--
**[Theorem — LeftInverseImpliesLeftInverseOn]**

A global left inverse restricts to any source set.

Logical form:

```lean
theorem LeftInverseImpliesLeftInverseOn
    {DomainSet : Type w₁} [Membership Domain DomainSet]
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (source : DomainSet)
    (leftInverse : LeftInverse map inverse) :
    LeftInverseOn map inverse source
```
-/
theorem LeftInverseImpliesLeftInverseOn
    {DomainSet : Type w₁} [Membership Domain DomainSet]
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
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
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (target : CodomainSet)
    (rightInverse : RightInverse map inverse) :
    RightInverseOn map inverse target
```
-/
theorem RightInverseImpliesRightInverseOn
    {CodomainSet : Type w₂} [Membership Codomain CodomainSet]
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
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
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (source : DomainSet)
    (target : CodomainSet)
    (inverseLaw : TwoSidedInverse map inverse) :
    TwoSidedInverseOn map inverse source target
```
-/
theorem TwoSidedInverseImpliesTwoSidedInverseOn
    {DomainSet : Type w₁} {CodomainSet : Type w₂}
    [Membership Domain DomainSet] [Membership Codomain CodomainSet]
    (map : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
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
    (map : LRA.Function DomainElement CodomainElement)
    (inverse : LRA.Function CodomainElement DomainElement)
    (source : DomainSet)
    (leftInverse : LeftInverseOn map inverse source) :
    RightInverseOn map inverse
      (LRA.Map.Image.Image map source : CodomainSet)
```
-/
theorem RightInverseOnImageOfLeftInverseOn
    (map : LRA.Function DomainElement CodomainElement)
    (inverse : LRA.Function CodomainElement DomainElement)
    (source : DomainSet)
    (leftInverse : LeftInverseOn map inverse source) :
    RightInverseOn map inverse
      (LRA.Map.Image.Image map source : CodomainSet) := by
  sorry

/--
**[Theorem — TwoSidedInverseOnImageOfLeftInverseOn]**

An inverse on a source is automatically a two-sided inverse between the source
and its image.

Logical form:

```lean
theorem TwoSidedInverseOnImageOfLeftInverseOn
    (map : LRA.Function DomainElement CodomainElement)
    (inverse : LRA.Function CodomainElement DomainElement)
    (source : DomainSet)
    (leftInverse : LeftInverseOn map inverse source) :
    TwoSidedInverseOn map inverse source
      (LRA.Map.Image.Image map source : CodomainSet)
```
-/
theorem TwoSidedInverseOnImageOfLeftInverseOn
    (map : LRA.Function DomainElement CodomainElement)
    (inverse : LRA.Function CodomainElement DomainElement)
    (source : DomainSet)
    (leftInverse : LeftInverseOn map inverse source) :
    TwoSidedInverseOn map inverse source
      (LRA.Map.Image.Image map source : CodomainSet) := by
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
    (map : LRA.Function DomainElement CodomainElement)
    (inverse : InverseFunction map)
    (target : CodomainSet) :
    (LRA.Map.Preimage.Preimage map target : DomainSet) =
      LRA.Map.Image.Image inverse.inverse target
```
-/
theorem PreimageEqualsImageOfInverseFunction
    (map : LRA.Function DomainElement CodomainElement)
    (inverse : InverseFunction map)
    (target : CodomainSet) :
    (LRA.Map.Preimage.Preimage map target : DomainSet) =
      LRA.Map.Image.Image inverse.inverse target := by
  sorry

end SetPreimageCompatibility

end LRA.Map.Inverse
