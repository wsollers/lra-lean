import LRA.VolumeI.Function.SetTheoretic.Definition

namespace LRA.Function.SetTheoretic

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

Every member of the domain of a set-theoretic function has an encoded value in its
codomain.

Logical form:

```lean
theorem EvaluationExists
    (setFunction : SetTheoreticFunction DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement)
    (inputInDomain : input ∈ setFunction.triple.domain) :
    exists output : CodomainElement,
      output ∈ setFunction.triple.codomain /\
      Relates setFunction.triple.graph input output
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
    (setFunction : SetTheoreticFunction DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement)
    (inputInDomain : input ∈ setFunction.triple.domain) :
    exists output : CodomainElement,
      output ∈ setFunction.triple.codomain /\
      Relates setFunction.triple.graph input output :=
  setFunction.isFunction.2.1 input inputInDomain

/--
**[Theorem — EvaluationUnique]**

Evaluation in the graph of a set-theoretic function is unique.

Logical form:

```lean
theorem EvaluationUnique
    (setFunction : SetTheoreticFunction DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement)
    (firstOutput secondOutput : CodomainElement)
    (firstEvaluation : Relates setFunction.triple.graph input firstOutput)
    (secondEvaluation : Relates setFunction.triple.graph input secondOutput) :
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
    (setFunction : SetTheoreticFunction DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement)
    (firstOutput secondOutput : CodomainElement)
    (firstEvaluation : Relates setFunction.triple.graph input firstOutput)
    (secondEvaluation : Relates setFunction.triple.graph input secondOutput) :
    firstOutput = secondOutput :=
  setFunction.isFunction.2.2 input firstOutput secondOutput
    firstEvaluation secondEvaluation

/--
**[Theorem — SetTheoreticFunctionExt]**

Two bundled set-theoretic functions are equal when their domains, codomains, and
graphs are equal.

Logical form:

```lean
theorem SetTheoreticFunctionExt
    {left right : SetTheoreticFunction DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject}
    (sameDomain : left.triple.domain = right.triple.domain)
    (sameCodomain : left.triple.codomain = right.triple.codomain)
    (sameGraph : left.triple.graph = right.triple.graph) :
    left = right
```
-/
@[ext] theorem SetTheoreticFunctionExt
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    {left right : SetTheoreticFunction DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject}
    (sameDomain : left.triple.domain = right.triple.domain)
    (sameCodomain : left.triple.codomain = right.triple.codomain)
    (sameGraph : left.triple.graph = right.triple.graph) :
    left = right := by
  sorry

end LRA.Function.SetTheoretic
