import LRA.VolumeI.Map.SetTheoretic.Definition

namespace LRA.Map.SetTheoretic

open LRA.Set

universe u v w x

/--
**[Theorem — RelationGraphMemberCoordinates]**

Every graph member of a bundled set-theoretic relation has coordinates in the
displayed left and right domains.

Logical form:

```lean
theorem RelationGraphMemberCoordinates
    (relation : SetTheoreticRelation LeftElement RightElement Pair
      LeftDomainObject RightDomainObject GraphObject)
    (member : Pair)
    (memberInGraph : member ∈ relation.triple.graph) :
    exists (left : LeftElement) (right : RightElement),
      member = OrderedPair left right /\
      left ∈ relation.triple.leftDomain /\
      right ∈ relation.triple.rightDomain
```
-/
theorem RelationGraphMemberCoordinates
    {LeftElement RightElement Pair : Type u}
    {LeftDomainObject : Type v} {RightDomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing LeftElement RightElement Pair]
    [Membership LeftElement LeftDomainObject]
    [Membership RightElement RightDomainObject]
    [Membership Pair GraphObject]
    (relation : SetTheoreticRelation LeftElement RightElement Pair
      LeftDomainObject RightDomainObject GraphObject)
    (member : Pair)
    (memberInGraph : member ∈ relation.triple.graph) :
    exists (left : LeftElement) (right : RightElement),
      member = OrderedPair left right /\
      left ∈ relation.triple.leftDomain /\
      right ∈ relation.triple.rightDomain := by
  sorry

/--
**[Theorem — EvaluationExists]**

Every member of the domain of a set-theoretic map has an encoded value in its
codomain.

Logical form:

```lean
theorem EvaluationExists
    (setMap : SetTheoreticMap DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement)
    (inputInDomain : input ∈ setMap.triple.domain) :
    exists output : CodomainElement,
      output ∈ setMap.triple.codomain /\
      Relates setMap.triple.graph input output
```
-/
theorem EvaluationExists
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (setMap : SetTheoreticMap DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement)
    (inputInDomain : input ∈ setMap.triple.domain) :
    exists output : CodomainElement,
      output ∈ setMap.triple.codomain /\
      Relates setMap.triple.graph input output :=
  setMap.isMap.2.1 input inputInDomain

/--
**[Theorem — EvaluationUnique]**

Evaluation in the graph of a set-theoretic map is unique.

Logical form:

```lean
theorem EvaluationUnique
    (setMap : SetTheoreticMap DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement)
    (firstOutput secondOutput : CodomainElement)
    (firstEvaluation : Relates setMap.triple.graph input firstOutput)
    (secondEvaluation : Relates setMap.triple.graph input secondOutput) :
    firstOutput = secondOutput
```
-/
theorem EvaluationUnique
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (setMap : SetTheoreticMap DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement)
    (firstOutput secondOutput : CodomainElement)
    (firstEvaluation : Relates setMap.triple.graph input firstOutput)
    (secondEvaluation : Relates setMap.triple.graph input secondOutput) :
    firstOutput = secondOutput :=
  setMap.isMap.2.2 input firstOutput secondOutput
    firstEvaluation secondEvaluation

/--
**[Theorem — SetTheoreticMapExt]**

Two bundled set-theoretic maps are equal when their domains, codomains, and
graphs are equal.

Logical form:

```lean
theorem SetTheoreticMapExt
    {left right : SetTheoreticMap DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject}
    (sameDomain : left.triple.domain = right.triple.domain)
    (sameCodomain : left.triple.codomain = right.triple.codomain)
    (sameGraph : left.triple.graph = right.triple.graph) :
    left = right
```
-/
@[ext] theorem SetTheoreticMapExt
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    {left right : SetTheoreticMap DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject}
    (sameDomain : left.triple.domain = right.triple.domain)
    (sameCodomain : left.triple.codomain = right.triple.codomain)
    (sameGraph : left.triple.graph = right.triple.graph) :
    left = right := by
  sorry

end LRA.Map.SetTheoretic
