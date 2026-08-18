import LRA.VolumeI.Relations.DomainRange.Definition
import LRA.VolumeI.Relations.Images.Definition
import LRA.VolumeI.Function.Graph.Definition
import LRA.VolumeI.Function.Image.Definition
import LRA.VolumeI.Function.Preimage.Definition

namespace LRA.Relation

open LRA.Function
open LRA.Set

universe u v w x

/--
**[Theorem — GraphRelationDomain]**

Every input belongs to the relation-domain predicate of the graph of a typed
map.

Logical form:

```lean
theorem GraphRelationDomain
    (map : Function Domain Codomain)
    (input : Domain) :
    RelationDomain (LRA.Function.Graph.Graph map) input
```
-/
theorem GraphRelationDomain
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain)
    (input : Domain) :
    RelationDomain (LRA.Function.Graph.Graph map) input := by
  sorry

/--
**[Theorem — GraphRelationRangeIff]**

The relation-range predicate of a typed function graph consists exactly of values
hit by the map.

Logical form:

```lean
theorem GraphRelationRangeIff
    (map : Function Domain Codomain)
    (output : Codomain) :
    RelationRange (LRA.Function.Graph.Graph map) output <->
      exists input : Domain, map input = output
```
-/
theorem GraphRelationRangeIff
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain)
    (output : Codomain) :
    RelationRange (LRA.Function.Graph.Graph map) output <->
      exists input : Domain, map input = output := by
  sorry

/--
**[Theorem — GraphRelationImageEqualsFunctionImage]**

The image under the graph relation of a typed function equals the direct image
under that map.

Logical form:

```lean
theorem GraphRelationImageEqualsFunctionImage
    (map : Function Domain Codomain)
    (source : DomainSet) :
    RelationImage (LRA.Function.Graph.Graph map) source =
      (LRA.Function.Image.Image map source : CodomainSet)
```
-/
theorem GraphRelationImageEqualsFunctionImage
    {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w} {CodomainSet : Type x}
    [Membership Domain DomainSet]
    [Membership Codomain CodomainSet]
    [HasSeparation Codomain CodomainSet]
    [HasUniversal CodomainSet]
    [ExtensionalityLaw Codomain CodomainSet]
    [SeparationLaws Codomain CodomainSet]
    (map : Function Domain Codomain)
    (source : DomainSet) :
    RelationImage (LRA.Function.Graph.Graph map) source =
      (LRA.Function.Image.Image map source : CodomainSet) := by
  sorry

/--
**[Theorem — GraphRelationPreimageEqualsFunctionPreimage]**

The preimage under the graph relation of a typed function equals the preimage under
that map.

Logical form:

```lean
theorem GraphRelationPreimageEqualsFunctionPreimage
    [HasComplement DomainSet]
    [ExtensionalityLaw Domain DomainSet]
    [SeparationLaws Domain DomainSet]
    [UniversalMembershipLaws Domain DomainSet]
    (map : Function Domain Codomain)
    (target : CodomainSet) :
    RelationPreimage (LRA.Function.Graph.Graph map) target =
      (LRA.Function.Preimage.Preimage map target : DomainSet)
```
-/
theorem GraphRelationPreimageEqualsFunctionPreimage
    {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w} {CodomainSet : Type x}
    [Membership Domain DomainSet]
    [Membership Codomain CodomainSet]
    [HasSeparation Domain DomainSet]
    [HasUniversal DomainSet]
    [HasComplement DomainSet]
    [ExtensionalityLaw Domain DomainSet]
    [SeparationLaws Domain DomainSet]
    [UniversalMembershipLaws Domain DomainSet]
    (map : Function Domain Codomain)
    (target : CodomainSet) :
    RelationPreimage (LRA.Function.Graph.Graph map) target =
      (LRA.Function.Preimage.Preimage map target : DomainSet) := by
  sorry

end LRA.Relation
