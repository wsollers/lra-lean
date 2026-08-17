import LRA.Function.SetTheoretic.Theorems
import LRA.Function.Definition
import LRA.Set.Interface.RelationSets

namespace LRA.Function.SetTheoretic

open LRA.Set

universe u v w x y z

/-- The graph of a set-theoretic function triple is single-valued. -/
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

/-- The graph of a bundled set-theoretic function is single-valued. -/
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

/-- A typed function with explicit coordinate encodings and an ambient pair set
has a set-theoretic function representation whose graph evaluates to the encoded
function. -/
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
    (function : LRA.Function.TypedFunction Domain Codomain)
    (encodeDomain : Domain → DomainElement)
    (encodeCodomain : Codomain → CodomainElement)
    (domainEncoding : DomainObject)
    (codomainEncoding : CodomainObject)
    (ambientPairs : GraphObject)
    (encodeDomainInjective : _root_.Function.Injective encodeDomain)
    (domainEncodingExact : ∀ encoded : DomainElement,
      encoded ∈ domainEncoding ↔
        ∃ input : Domain, encodeDomain input = encoded)
    (codomainEncodingCovers : ∀ output : Codomain,
      encodeCodomain output ∈ codomainEncoding)
    (graphPairsExist : ∀ input : Domain,
      (OrderedPair (encodeDomain input) (encodeCodomain (function input)) : Pair) ∈
        ambientPairs) :
    ∃ represented : SetTheoreticFunction
        DomainElement CodomainElement Pair
        DomainObject CodomainObject GraphObject,
      represented.triple.domain = domainEncoding ∧
      represented.triple.codomain = codomainEncoding ∧
      represented.triple.graph =
        HasSeparation.separation ambientPairs
          (fun member : Pair => ∃ input : Domain,
            member = OrderedPair (encodeDomain input)
              (encodeCodomain (function input))) ∧
      ∀ input : Domain,
        Relates represented.triple.graph
          (encodeDomain input) (encodeCodomain (function input)) := by
  sorry

/-! Historical theorem names. -/
abbrev SingleValuedOfIsSetTheoreticMap := SingleValuedOfIsSetTheoreticFunction
abbrev TypedMapGraphRepresentation := TypedFunctionGraphRepresentation

end LRA.Function.SetTheoretic
