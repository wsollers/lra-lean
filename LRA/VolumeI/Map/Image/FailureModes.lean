import LRA.VolumeI.Map.Image.Theorems
import LRA.VolumeI.Map.Injective.FailureModes
import LRA.VolumeI.Map.Surjective.FailureModes

namespace LRA.Map.Image

open LRA.Set
open LRA.Map.Typed

universe u₁ u₂ v₁ v₂

/--
The unit of the image/preimage adjunction is proper when pushing forward and
pulling back strictly enlarges the source.
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
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : Prop :=
  source ⊆
      (LRA.Map.Preimage.Preimage map
        (Image map source : CodomainSet) : DomainSet) /\
    (LRA.Map.Preimage.Preimage map
      (Image map source : CodomainSet) : DomainSet) ≠ source

/--
The counit of the image/preimage adjunction is proper when pulling back and
pushing forward strictly shrinks the target.
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
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) : Prop :=
  (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) ⊆
      target /\
    (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) ≠
      target

end LRA.Map.Image
