import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Set.Interface.RelationLaws

namespace LRA.Map.SetTheoretic

open LRA.Set

universe u v w x

/--
Raw domain/codomain/graph data for a set-theoretic map convention.
-/
structure SetTheoreticMapTriple
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x) where
  domain : DomainObject
  codomain : CodomainObject
  graph : GraphObject

/--
Raw left-domain/right-domain/graph data for a set-theoretic relation
convention.
-/
structure SetTheoreticRelationTriple
    (LeftDomainObject : Type v) (RightDomainObject : Type w)
    (GraphObject : Type x) where
  leftDomain : LeftDomainObject
  rightDomain : RightDomainObject
  graph : GraphObject

/--
The function condition for a raw set-theoretic map triple.
-/
def IsSetTheoreticMap
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (triple : SetTheoreticMapTriple
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
A raw set-theoretic map triple bundled with its function condition.
-/
structure SetTheoreticMap
    (DomainElement CodomainElement Pair : Type u)
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x)
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject] where
  triple : SetTheoreticMapTriple
    DomainObject CodomainObject GraphObject
  isMap : IsSetTheoreticMap triple

end LRA.Map.SetTheoretic
