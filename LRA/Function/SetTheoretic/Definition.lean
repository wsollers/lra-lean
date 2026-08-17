import LRA.Set.Interface.Membership
import LRA.Set.Interface.RelationLaws

namespace LRA.Function.SetTheoretic

open LRA.Set

universe u v w x

/-- Raw domain/codomain/graph data for a set-theoretic function convention. -/
structure SetTheoreticFunctionTriple
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x) where
  domain : DomainObject
  codomain : CodomainObject
  graph : GraphObject

/-- Raw left-domain/right-domain/graph data for a set-theoretic relation convention. -/
structure SetTheoreticRelationTriple
    (LeftDomainObject : Type v) (RightDomainObject : Type w)
    (GraphObject : Type x) where
  leftDomain : LeftDomainObject
  rightDomain : RightDomainObject
  graph : GraphObject

/-- Every member of a set-theoretic relation graph is a typed ordered pair. -/
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

/-- A set-theoretic relation bundled with its graph-typing condition. -/
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

/-- A raw set-theoretic triple represents a function when its graph is typed,
left-total on the displayed domain, and right-unique. -/
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

/-- A set-theoretic function bundled with its defining conditions. -/
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

/-! Historical terminology within the canonical realization. -/
abbrev SetTheoreticMapTriple := SetTheoreticFunctionTriple
abbrev IsSetTheoreticMap := IsSetTheoreticFunction
abbrev SetTheoreticMap := SetTheoreticFunction

end LRA.Function.SetTheoretic
