import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Set.Interface.RelationLaws

namespace LRA.Function.SetTheoretic

open LRA.Set

universe u v w x

/--
**[Structure — SetTheoreticFunctionTriple]**

Raw domain/codomain/graph data for a set-theoretic function convention.

Logical form:

```lean
structure SetTheoreticFunctionTriple
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x)
```
-/
structure SetTheoreticFunctionTriple
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x) where
  domain : DomainObject
  codomain : CodomainObject
  graph : GraphObject

/--
**[Structure — SetTheoreticRelationTriple]**

Raw left-domain/right-domain/graph data for a set-theoretic relation
convention.

Logical form:

```lean
structure SetTheoreticRelationTriple
    (LeftDomainObject : Type v) (RightDomainObject : Type w)
    (GraphObject : Type x)
```
-/
structure SetTheoreticRelationTriple
    (LeftDomainObject : Type v) (RightDomainObject : Type w)
    (GraphObject : Type x) where
  leftDomain : LeftDomainObject
  rightDomain : RightDomainObject
  graph : GraphObject

/--
**[Definition — IsSetTheoreticRelation]**

The relation condition for a raw set-theoretic relation triple: every graph
member is an ordered pair whose coordinates belong to the displayed left and
right domains.

Logical form:

```lean
def IsSetTheoreticRelation
    {LeftElement RightElement Pair : Type u}
    {LeftDomainObject : Type v} {RightDomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing LeftElement RightElement Pair]
    [Membership LeftElement LeftDomainObject]
    [Membership RightElement RightDomainObject]
    [Membership Pair GraphObject]
    (triple : SetTheoreticRelationTriple
      LeftDomainObject RightDomainObject GraphObject) : Prop
```
-/
def IsSetTheoreticRelation
    {LeftElement RightElement Pair : Type u}
    {LeftDomainObject : Type v} {RightDomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing LeftElement RightElement Pair]
    [Membership LeftElement LeftDomainObject]
    [Membership RightElement RightDomainObject]
    [Membership Pair GraphObject]
    (triple : SetTheoreticRelationTriple
      LeftDomainObject RightDomainObject GraphObject) : Prop :=
  forall member : Pair, member ∈ triple.graph ->
    exists (left : LeftElement) (right : RightElement),
      member = OrderedPair left right /\
      left ∈ triple.leftDomain /\ right ∈ triple.rightDomain

/--
**[Structure — SetTheoreticRelation]**

A raw set-theoretic relation triple bundled with its graph-typing condition.

Logical form:

```lean
structure SetTheoreticRelation
    (LeftElement RightElement Pair : Type u)
    (LeftDomainObject : Type v) (RightDomainObject : Type w)
    (GraphObject : Type x)
    [HasPairing LeftElement RightElement Pair]
    [Membership LeftElement LeftDomainObject]
    [Membership RightElement RightDomainObject]
    [Membership Pair GraphObject]
```
-/
structure SetTheoreticRelation
    (LeftElement RightElement Pair : Type u)
    (LeftDomainObject : Type v) (RightDomainObject : Type w)
    (GraphObject : Type x)
    [HasPairing LeftElement RightElement Pair]
    [Membership LeftElement LeftDomainObject]
    [Membership RightElement RightDomainObject]
    [Membership Pair GraphObject] where
  triple : SetTheoreticRelationTriple
    LeftDomainObject RightDomainObject GraphObject
  isRelation : IsSetTheoreticRelation triple

/--
**[Definition — IsSetTheoreticFunction]**

The function condition for a raw set-theoretic function triple.

Logical form:

```lean
def IsSetTheoreticFunction
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (triple : SetTheoreticFunctionTriple
      DomainObject CodomainObject GraphObject) : Prop
```
-/
def IsSetTheoreticFunction
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (triple : SetTheoreticFunctionTriple
      DomainObject CodomainObject GraphObject) : Prop :=
  (forall member : Pair, member ∈ triple.graph ->
    exists (input : DomainElement) (output : CodomainElement),
      member = OrderedPair input output /\
      input ∈ triple.domain /\ output ∈ triple.codomain) /\
  (forall input : DomainElement, input ∈ triple.domain ->
    exists output : CodomainElement,
      output ∈ triple.codomain /\ Relates triple.graph input output) /\
  (forall input : DomainElement, forall firstOutput secondOutput : CodomainElement,
    Relates triple.graph input firstOutput ->
    Relates triple.graph input secondOutput ->
    firstOutput = secondOutput)

/--
**[Structure — SetTheoreticFunction]**

A raw set-theoretic function triple bundled with its function condition.

Logical form:

```lean
structure SetTheoreticFunction
    (DomainElement CodomainElement Pair : Type u)
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x)
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
```
-/
structure SetTheoreticFunction
    (DomainElement CodomainElement Pair : Type u)
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x)
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject] where
  triple : SetTheoreticFunctionTriple
    DomainObject CodomainObject GraphObject
  isMap : IsSetTheoreticFunction triple

end LRA.Function.SetTheoretic
