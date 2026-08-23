import LRA.Function.SetTheoretic.Definition

namespace LRA.Function.SetTheoretic

open LRA.Set

universe u v w x

                                                                             
                         
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
    ∃ (left : LeftElement) (right : RightElement),
      member = OrderedPair left right ∧
      left ∈ relation.triple.leftDomain ∧
      right ∈ relation.triple.rightDomain := by
  sorry

                                                                           
                                           
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
    ∃ output : CodomainElement,
      output ∈ setFunction.triple.codomain ∧
      Relates setFunction.triple.graph input output := by
  sorry

                                                                     
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
    firstOutput = secondOutput := by
  sorry

                                                                               
                                   
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
