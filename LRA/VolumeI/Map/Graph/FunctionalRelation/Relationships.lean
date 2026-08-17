import LRA.VolumeI.Relations.DomainRange.Definition
import LRA.VolumeI.Relations.Images.Definition
import LRA.VolumeI.Map.Graph.Definition
import LRA.VolumeI.Map.Image.Definition
import LRA.VolumeI.Map.Preimage.Definition

namespace LRA.Relation

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
  exact ⟨map input, rfl⟩

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
  rfl

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
    [ExtensionalityLaw Codomain CodomainSet]
    [SeparationLaws Codomain CodomainSet]
    (map : TypedMap Domain Codomain)
    (source : DomainSet) :
    RelationImage (LRA.Map.Graph.Graph map) source =
      (LRA.Map.Image.Image map source : CodomainSet) := by
  apply SetExtensionality
  intro output
  unfold RelationImage LRA.Map.Image.Image LRA.Map.Graph.Graph
  exact Iff.rfl

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
  apply SetExtensionality
  intro input
  unfold RelationPreimage LRA.Map.Preimage.Preimage LRA.Map.Graph.Graph
  rw [SeparationMembership, SeparationMembership]
  constructor
  · intro membership
    rcases membership.2 with ⟨output, output_mem_target, map_eq_output⟩
    exact ⟨membership.1, by
      rw [map_eq_output]
      exact output_mem_target⟩
  · intro membership
    exact ⟨membership.1, ⟨map input, membership.2, rfl⟩⟩

end LRA.Relation
