import LRA.Set.Interface.Membership
import LRA.Set.Interface.RelationLaws

namespace LRA.Function.SetTheoretic

open LRA.Set

universe u v w x

                                                                              
structure SetTheoreticFunctionTriple
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x) where
  domain : DomainObject
  codomain : CodomainObject
  graph : GraphObject

                                                                                       
structure SetTheoreticRelationTriple
    (LeftDomainObject : Type v) (RightDomainObject : Type w)
    (GraphObject : Type x) where
  leftDomain : LeftDomainObject
  rightDomain : RightDomainObject
  graph : GraphObject

                                                                              
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
  ∀ member : Pair, member ∈ triple.graph →
    ∃ (left : LeftElement) (right : RightElement),
      member = OrderedPair left right ∧
      left ∈ triple.leftDomain ∧ right ∈ triple.rightDomain

                                                                        
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
  (∀ member : Pair, member ∈ triple.graph →
    ∃ (input : DomainElement) (output : CodomainElement),
      member = OrderedPair input output ∧
      input ∈ triple.domain ∧ output ∈ triple.codomain) ∧
  (∀ input : DomainElement, input ∈ triple.domain →
    ∃ output : CodomainElement,
      output ∈ triple.codomain ∧ Relates triple.graph input output) ∧
  (∀ input : DomainElement, ∀ firstOutput secondOutput : CodomainElement,
    Relates triple.graph input firstOutput →
    Relates triple.graph input secondOutput →
    firstOutput = secondOutput)

                                                                     
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
  isFunction : IsSetTheoreticFunction triple

end LRA.Function.SetTheoretic
