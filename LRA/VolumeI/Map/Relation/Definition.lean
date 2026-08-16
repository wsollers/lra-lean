import LRA.VolumeI.Relations.Basic.Relations
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Set.Interface.Operations

namespace LRA.Map.Relation

open LRA.Set

universe u v w x

/--
The domain predicate of a heterogeneous relation.
-/
def RelationDomain {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain) :
    Domain -> Prop :=
  fun input => exists output, relation input output

/--
The range predicate of a heterogeneous relation.
-/
def RelationRange {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain) :
    Codomain -> Prop :=
  fun output => exists input, relation input output

/--
The image of a backend source set under a heterogeneous relation.
-/
def RelationImage {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w} {CodomainSet : Type x}
    [Membership Domain DomainSet]
    [Membership Codomain CodomainSet]
    [HasSeparation Codomain CodomainSet]
    [HasUniversal CodomainSet]
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain)
    (source : DomainSet) : CodomainSet :=
  HasSeparation.separation (𝒰 : CodomainSet)
    (fun output : Codomain =>
      exists input : Domain, input ∈ source /\ relation input output)

/--
The preimage of a backend target set under a heterogeneous relation.
-/
def RelationPreimage {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w} {CodomainSet : Type x}
    [Membership Domain DomainSet]
    [Membership Codomain CodomainSet]
    [HasSeparation Domain DomainSet]
    [HasUniversal DomainSet]
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain)
    (target : CodomainSet) : DomainSet :=
  HasSeparation.separation (𝒰 : DomainSet)
    (fun input : Domain =>
      exists output : Codomain, output ∈ target /\ relation input output)

end LRA.Map.Relation
