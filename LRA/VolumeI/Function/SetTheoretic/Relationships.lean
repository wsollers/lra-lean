import LRA.VolumeI.Function.SetTheoretic.Theorems
import LRA.VolumeI.Function.SetTheoretic.Definition
import LRA.VolumeI.Function.Typed.Definition
import LRA.VolumeI.Set.Interface.RelationSets

namespace LRA.Function.SetTheoretic

open LRA.Set

open LRA.Function

universe u v w x y z

/--
**[Theorem — SingleValuedOfIsSetTheoreticFunction]**

The graph of a set-theoretic function triple is single-valued.

Logical form:

```lean
theorem SingleValuedOfIsSetTheoreticFunction
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    {triple : SetTheoreticFunctionTriple
      DomainObject CodomainObject GraphObject}
    (isFunction : IsSetTheoreticFunction
      (DomainElement := DomainElement)
      (CodomainElement := CodomainElement)
      (Pair := Pair)
      triple) :
    IsSingleValued DomainElement CodomainElement triple.graph
```
-/
theorem SingleValuedOfIsSetTheoreticFunction
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    {triple : SetTheoreticFunctionTriple
      DomainObject CodomainObject GraphObject}
    (isFunction : IsSetTheoreticFunction
      (DomainElement := DomainElement)
      (CodomainElement := CodomainElement)
      (Pair := Pair)
      triple) :
    IsSingleValued DomainElement CodomainElement triple.graph := by
  sorry

/--
**[Theorem — BundledSingleValued]**

The graph of a bundled set-theoretic function is single-valued.

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
    (function : SetTheoreticFunction
      DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject) :
    IsSingleValued DomainElement CodomainElement function.triple.graph
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
    (function : SetTheoreticFunction
      DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject) :
    IsSingleValued DomainElement CodomainElement function.triple.graph := by
  sorry

/--
**[Theorem — TypedFunctionGraphRepresentation]**

A typed function with explicit coordinate encodings and an ambient pair set has a
set-theoretic function representation whose graph evaluates to the encoded map.

Logical form:

```lean
theorem TypedFunctionGraphRepresentation
    (map : Function Domain Codomain)
    (encodeDomain : Domain -> DomainElement)
    (encodeCodomain : Codomain -> CodomainElement)
    (domainEncoding : DomainObject)
    (codomainEncoding : CodomainObject)
    (ambientPairs : GraphObject)
    (encodeDomainInjective : _root_.Function.Injective encodeDomain)
    (domainEncodingExact : forall encoded : DomainElement,
      encoded ∈ domainEncoding <->
        exists input : Domain, encodeDomain input = encoded)
    (codomainEncodingCovers : forall output : Codomain,
      encodeCodomain output ∈ codomainEncoding)
    (graphPairsExist : forall input : Domain,
      (OrderedPair (encodeDomain input) (encodeCodomain (map input)) : Pair) ∈
        ambientPairs) :
    exists represented : SetTheoreticFunction
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
theorem TypedFunctionGraphRepresentation
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
    (map : Function Domain Codomain)
    (encodeDomain : Domain -> DomainElement)
    (encodeCodomain : Codomain -> CodomainElement)
    (domainEncoding : DomainObject)
    (codomainEncoding : CodomainObject)
    (ambientPairs : GraphObject)
    (encodeDomainInjective : _root_.Function.Injective encodeDomain)
    (domainEncodingExact : forall encoded : DomainElement,
      encoded ∈ domainEncoding <->
        exists input : Domain, encodeDomain input = encoded)
    (codomainEncodingCovers : forall output : Codomain,
      encodeCodomain output ∈ codomainEncoding)
    (graphPairsExist : forall input : Domain,
      (OrderedPair (encodeDomain input) (encodeCodomain (map input)) : Pair) ∈
        ambientPairs) :
    exists represented : SetTheoreticFunction
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
end LRA.Function.SetTheoretic
