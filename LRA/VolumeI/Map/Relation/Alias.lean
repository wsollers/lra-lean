import LRA.VolumeI.Map.Relation.Definition

namespace LRA.Map.Relation

universe u v w x

/--
**[Abbreviation — RangeOfRelation]**

Sources: relation-algebra and set-theory texts use "range" for the second
projection of a relation.

Logical form:

```lean
abbrev RangeOfRelation {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain) :
    Codomain -> Prop
```
-/
abbrev RangeOfRelation {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain) :
    Codomain -> Prop :=
  RelationRange relation

/--
**[Abbreviation — DirectRelationImage]**

Sources: image/direct-image terminology extends from functions to arbitrary
relations in set-theoretic presentations.

Logical form:

```lean
abbrev DirectRelationImage {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w} {CodomainSet : Type x}
    [Membership Domain DomainSet]
    [Membership Codomain CodomainSet]
    [LRA.Set.HasSeparation Codomain CodomainSet]
    [LRA.Set.HasUniversal CodomainSet]
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain)
    (source : DomainSet) : CodomainSet
```
-/
abbrev DirectRelationImage {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w} {CodomainSet : Type x}
    [Membership Domain DomainSet]
    [Membership Codomain CodomainSet]
    [LRA.Set.HasSeparation Codomain CodomainSet]
    [LRA.Set.HasUniversal CodomainSet]
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain)
    (source : DomainSet) : CodomainSet :=
  RelationImage relation source

/--
**[Abbreviation — InverseRelationImage]**

Sources: inverse-image terminology is also used for relations, where a target
can pull back through any related output.

Logical form:

```lean
abbrev InverseRelationImage {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w} {CodomainSet : Type x}
    [Membership Domain DomainSet]
    [Membership Codomain CodomainSet]
    [LRA.Set.HasSeparation Domain DomainSet]
    [LRA.Set.HasUniversal DomainSet]
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain)
    (target : CodomainSet) : DomainSet
```
-/
abbrev InverseRelationImage {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w} {CodomainSet : Type x}
    [Membership Domain DomainSet]
    [Membership Codomain CodomainSet]
    [LRA.Set.HasSeparation Domain DomainSet]
    [LRA.Set.HasUniversal DomainSet]
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain)
    (target : CodomainSet) : DomainSet :=
  RelationPreimage relation target

end LRA.Map.Relation
