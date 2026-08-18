import LRA.VolumeI.Map.Image.Theorems
import LRA.Function.Definition

namespace LRA.Map.Image

open LRA.Set

universe u₁ u₂ v₁ v₂

/--
**[Definition — UnitProper]**

The unit of the image/preimage adjunction is proper when pushing forward and
pulling back strictly enlarges the source.

Logical form:

```lean
def UnitProper
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    [HasSubset DomainSet]
    [HasSeparation DomainElement DomainSet]
    [HasUniversal DomainSet]
    [HasSeparation CodomainElement CodomainSet]
    [HasUniversal CodomainSet]
    (map : LRA.Function DomainElement CodomainElement)
    (source : DomainSet) : Prop
```
-/
def UnitProper
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    [HasSubset DomainSet]
    [HasSeparation DomainElement DomainSet]
    [HasUniversal DomainSet]
    [HasSeparation CodomainElement CodomainSet]
    [HasUniversal CodomainSet]
    (map : LRA.Function DomainElement CodomainElement)
    (source : DomainSet) : Prop :=
  source ⊆
      (LRA.Map.Preimage.Preimage map
        (Image map source : CodomainSet) : DomainSet) /\
    (LRA.Map.Preimage.Preimage map
      (Image map source : CodomainSet) : DomainSet) ≠ source

/--
**[Definition — CounitProper]**

The counit of the image/preimage adjunction is proper when pulling back and
pushing forward strictly shrinks the target.

Logical form:

```lean
def CounitProper
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    [HasSubset CodomainSet]
    [HasSeparation DomainElement DomainSet]
    [HasUniversal DomainSet]
    [HasSeparation CodomainElement CodomainSet]
    [HasUniversal CodomainSet]
    (map : LRA.Function DomainElement CodomainElement)
    (target : CodomainSet) : Prop
```
-/
def CounitProper
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    [HasSubset CodomainSet]
    [HasSeparation DomainElement DomainSet]
    [HasUniversal DomainSet]
    [HasSeparation CodomainElement CodomainSet]
    [HasUniversal CodomainSet]
    (map : LRA.Function DomainElement CodomainElement)
    (target : CodomainSet) : Prop :=
  (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) ⊆
      target /\
    (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) ≠
      target

end LRA.Map.Image
