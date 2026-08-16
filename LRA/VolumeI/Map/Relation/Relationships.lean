import LRA.VolumeI.Map.Relation.Theorems
import LRA.VolumeI.Map.Graph.Definition
import LRA.VolumeI.Map.Image.Definition
import LRA.VolumeI.Map.Preimage.Definition

namespace LRA.Map.Relation

open LRA.Map.Typed
open LRA.Set

universe u v w x

/--
**[Theorem — GraphRelationDomain]**

Every input belongs to the relation-domain predicate of the graph of a typed
map.

Logical form:

```lean
theorem GraphRelationDomain
    (map : TypedMap Domain Codomain)
    (input : Domain) :
    RelationDomain (LRA.Map.Graph.Graph map) input
```
-/
theorem GraphRelationDomain
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (input : Domain) :
    RelationDomain (LRA.Map.Graph.Graph map) input := by
  sorry

/--
**[Theorem — GraphRelationRangeIff]**

The relation-range predicate of a typed map graph consists exactly of values
hit by the map.

Logical form:

```lean
theorem GraphRelationRangeIff
    (map : TypedMap Domain Codomain)
    (output : Codomain) :
    RelationRange (LRA.Map.Graph.Graph map) output <->
      exists input : Domain, map input = output
```
-/
theorem GraphRelationRangeIff
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain) :
    RelationRange (LRA.Map.Graph.Graph map) output <->
      exists input : Domain, map input = output := by
  sorry

/--
**[Theorem — GraphRelationImageEqualsMapImage]**

The image under the graph relation of a typed map equals the direct image
under that map.

Logical form:

```lean
theorem GraphRelationImageEqualsMapImage
    (map : TypedMap Domain Codomain)
    (source : DomainSet) :
    RelationImage (LRA.Map.Graph.Graph map) source =
      (LRA.Map.Image.Image map source : CodomainSet)
```
-/
theorem GraphRelationImageEqualsMapImage
    {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w} {CodomainSet : Type x}
    [Membership Domain DomainSet]
    [Membership Codomain CodomainSet]
    [HasSeparation Codomain CodomainSet]
    [HasUniversal CodomainSet]
    (map : TypedMap Domain Codomain)
    (source : DomainSet) :
    RelationImage (LRA.Map.Graph.Graph map) source =
      (LRA.Map.Image.Image map source : CodomainSet) := by
  sorry

/--
**[Theorem — GraphRelationPreimageEqualsMapPreimage]**

The preimage under the graph relation of a typed map equals the preimage under
that map.

Logical form:

```lean
theorem GraphRelationPreimageEqualsMapPreimage
    [HasComplement DomainSet]
    [ExtensionalityLaw Domain DomainSet]
    [SeparationLaws Domain DomainSet]
    [UniversalMembershipLaws Domain DomainSet]
    (map : TypedMap Domain Codomain)
    (target : CodomainSet) :
    RelationPreimage (LRA.Map.Graph.Graph map) target =
      (LRA.Map.Preimage.Preimage map target : DomainSet)
```
-/
theorem GraphRelationPreimageEqualsMapPreimage
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
    (map : TypedMap Domain Codomain)
    (target : CodomainSet) :
    RelationPreimage (LRA.Map.Graph.Graph map) target =
      (LRA.Map.Preimage.Preimage map target : DomainSet) := by
  sorry

end LRA.Map.Relation
