import LRA.VolumeI.Relations.Basic.Relations
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Set.Interface.Operations

namespace LRA.Relation

open LRA.Set

universe u v w x

/-!
Direct and inverse images for arbitrary heterogeneous relations.
-/

/--
**[Definition - RelationImage]**

The image of a backend source set under a heterogeneous relation.
-/
def RelationImage {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w} {CodomainSet : Type x}
    [Membership Domain DomainSet]
    [Membership Codomain CodomainSet]
    [HasSeparation Codomain CodomainSet]
    [HasUniversal CodomainSet]
    (relation : HeterogeneousRelation Domain Codomain)
    (source : DomainSet) : CodomainSet :=
  HasSeparation.separation (𝒰 : CodomainSet)
    (fun output : Codomain =>
      exists input : Domain, input ∈ source /\ relation input output)

/--
**[Definition - RelationPreimage]**

The preimage of a backend target set under a heterogeneous relation.
-/
def RelationPreimage {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w} {CodomainSet : Type x}
    [Membership Domain DomainSet]
    [Membership Codomain CodomainSet]
    [HasSeparation Domain DomainSet]
    [HasUniversal DomainSet]
    (relation : HeterogeneousRelation Domain Codomain)
    (target : CodomainSet) : DomainSet :=
  HasSeparation.separation (𝒰 : DomainSet)
    (fun input : Domain =>
      exists output : Codomain, output ∈ target /\ relation input output)

end LRA.Relation
