import LRA.VolumeI.Map.SetTheoretic.Theorems
import LRA.VolumeI.Map.SetTheoretic.Definition
import LRA.VolumeI.Set.Interface.RelationSets

namespace LRA.Map.SetTheoretic

open LRA.Set

universe u v w x

/--
The graph of a set-theoretic map triple is single-valued.
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
  exact isMap.right.right

/--
The graph of a bundled set-theoretic map is single-valued.
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
    IsSingleValued DomainElement CodomainElement map.triple.graph :=
  SingleValuedOfIsSetTheoreticMap map.isMap

end LRA.Map.SetTheoretic
