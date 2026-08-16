import LRA.VolumeI.Map.SetTheoretic.Theorems
import LRA.VolumeI.Map.SetTheoretic.Definition
import LRA.VolumeI.Map.Typed.Definition
import LRA.VolumeI.Set.Interface.RelationSets

namespace LRA.Map.SetTheoretic

open LRA.Set

open LRA.Map.Typed

universe u v w x y z

/--
**[Theorem — SingleValuedOfIsSetTheoreticMap]**

The graph of a set-theoretic map triple is single-valued.

Logical form:

```lean
theorem SingleValuedOfIsSetTheoreticMap
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    {triple : SetTheoreticMapTriple
      DomainObject CodomainObject GraphObject}
    (isMap : IsSetTheoreticMap
      (DomainElement := DomainElement)
      (CodomainElement := CodomainElement)
      (Pair := Pair)
      triple) :
    IsSingleValued DomainElement CodomainElement triple.graph
```
-/
theorem SingleValuedOfIsSetTheoreticMap
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    {triple : SetTheoreticMapTriple
      DomainObject CodomainObject GraphObject}
    (isMap : IsSetTheoreticMap
      (DomainElement := DomainElement)
      (CodomainElement := CodomainElement)
      (Pair := Pair)
      triple) :
    IsSingleValued DomainElement CodomainElement triple.graph := by
  sorry

/--
**[Theorem — BundledSingleValued]**

The graph of a bundled set-theoretic map is single-valued.

Logical form:

```lean
theorem BundledSingleValued
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (map : SetTheoreticMap
      DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject) :
    IsSingleValued DomainElement CodomainElement map.triple.graph
```
-/
theorem BundledSingleValued
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (map : SetTheoreticMap
      DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject) :
    IsSingleValued DomainElement CodomainElement map.triple.graph := by
  sorry

/--
**[Theorem — TypedMapGraphRepresentation]**

A typed map with explicit coordinate encodings and an ambient pair set has a
set-theoretic map representation whose graph evaluates to the encoded map.

Logical form:

```lean
theorem TypedMapGraphRepresentation
    (map : TypedMap Domain Codomain)
    (encodeDomain : Domain -> DomainElement)
    (encodeCodomain : Codomain -> CodomainElement)
    (domainEncoding : DomainObject)
    (codomainEncoding : CodomainObject)
    (ambientPairs : GraphObject)
    (encodeDomainInjective : Function.Injective encodeDomain)
    (domainEncodingExact : forall encoded : DomainElement,
      encoded ∈ domainEncoding <->
        exists input : Domain, encodeDomain input = encoded)
    (codomainEncodingCovers : forall output : Codomain,
      encodeCodomain output ∈ codomainEncoding)
    (graphPairsExist : forall input : Domain,
      (OrderedPair (encodeDomain input) (encodeCodomain (map input)) : Pair) ∈
        ambientPairs) :
    exists represented : SetTheoreticMap
        DomainElement CodomainElement Pair
        DomainObject CodomainObject GraphObject,
      represented.triple.domain = domainEncoding /\
      represented.triple.codomain = codomainEncoding /\
      represented.triple.graph =
        HasSeparation.separation ambientPairs
          (fun member : Pair => exists input : Domain,
            member = OrderedPair (encodeDomain input)
              (encodeCodomain (map input))) /\
      forall input : Domain,
        Relates represented.triple.graph
          (encodeDomain input) (encodeCodomain (map input))
```
-/
theorem TypedMapGraphRepresentation
    {Domain : Type y} {Codomain : Type z}
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [PairingLaws DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    [HasSeparation Pair GraphObject]
    [SeparationLaws Pair GraphObject]
    (map : TypedMap Domain Codomain)
    (encodeDomain : Domain -> DomainElement)
    (encodeCodomain : Codomain -> CodomainElement)
    (domainEncoding : DomainObject)
    (codomainEncoding : CodomainObject)
    (ambientPairs : GraphObject)
    (encodeDomainInjective : Function.Injective encodeDomain)
    (domainEncodingExact : forall encoded : DomainElement,
      encoded ∈ domainEncoding <->
        exists input : Domain, encodeDomain input = encoded)
    (codomainEncodingCovers : forall output : Codomain,
      encodeCodomain output ∈ codomainEncoding)
    (graphPairsExist : forall input : Domain,
      (OrderedPair (encodeDomain input) (encodeCodomain (map input)) : Pair) ∈
        ambientPairs) :
    exists represented : SetTheoreticMap
        DomainElement CodomainElement Pair
        DomainObject CodomainObject GraphObject,
      represented.triple.domain = domainEncoding /\
      represented.triple.codomain = codomainEncoding /\
      represented.triple.graph =
        HasSeparation.separation ambientPairs
          (fun member : Pair => exists input : Domain,
            member = OrderedPair (encodeDomain input)
              (encodeCodomain (map input))) /\
      forall input : Domain,
        Relates represented.triple.graph
          (encodeDomain input) (encodeCodomain (map input)) := by
  sorry
end LRA.Map.SetTheoretic
