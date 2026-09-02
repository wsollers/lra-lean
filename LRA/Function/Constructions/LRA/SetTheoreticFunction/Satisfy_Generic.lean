import LRA.Function.Satisfy_Generic
import LRA.Function.SetTheoretic.Relationships

namespace LRA.Function.Constructions.LRA.SetTheoreticFunction

open LRA.Set

universe u v w x

structure TotalSetTheoreticFunction
    (DomainElement CodomainElement Pair : Type u)
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x)
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject] where
  toSetTheoreticFunction :
    LRA.Function.SetTheoretic.SetTheoreticFunction
      DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject
  domainCovers :
    ∀ input : DomainElement, input ∈ toSetTheoreticFunction.triple.domain

instance
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject] :
    LRA.Function.GenericSemantics
      (TotalSetTheoreticFunction
        DomainElement CodomainElement Pair
        DomainObject CodomainObject GraphObject)
      DomainElement CodomainElement where
  toFunctionRelation := fun function =>
    Relates function.toSetTheoreticFunction.triple.graph

theorem satisfiesGeneric
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (function : TotalSetTheoreticFunction
      DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject) :
    LRA.Function.genericTheory function := by
  sorry
end LRA.Function.Constructions.LRA.SetTheoreticFunction
