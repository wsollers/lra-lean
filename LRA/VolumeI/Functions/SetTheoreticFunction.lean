import LRA.VolumeI.Functions.Functions
import LRA.VolumeI.Set.Interface.RelationLaws

namespace LRA.Function

open LRA.Set

universe u v w x y z

/-!
Foundational set-theoretic functions.  The raw data is the mathematical
triple `(domain, codomain, graph)`; `IsSetTheoreticFunction` is the evidence
that the triple is total and single-valued.  This is deliberately distinct
from the convenient typed representation `LRA.Function Domain Codomain`.
-/

/-- Raw domain/codomain/graph data for the set-theoretic convention. -/
structure SetTheoreticFunctionTriple
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x) where
  domain : DomainObject
  codomain : CodomainObject
  graph : GraphObject

/-- The function condition for a raw set-theoretic function triple. -/
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

/-- A raw triple bundled with evidence that it satisfies the function condition. -/
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

namespace SetTheoreticFunction

/-- Every member of the domain of a set-theoretic function has an encoded value. -/
theorem evaluationExists
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (functionTriple : SetTheoreticFunction DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement) (inputInDomain : input ∈ functionTriple.triple.domain) :
    ∃ output : CodomainElement,
      output ∈ functionTriple.triple.codomain ∧
      Relates functionTriple.triple.graph input output :=
  functionTriple.isFunction.2.1 input inputInDomain

/-- Evaluation in a set-theoretic function graph is unique. -/
theorem evaluationUnique
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (functionTriple : SetTheoreticFunction DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement) (firstOutput secondOutput : CodomainElement)
    (firstEvaluation : Relates functionTriple.triple.graph input firstOutput)
    (secondEvaluation : Relates functionTriple.triple.graph input secondOutput) :
    firstOutput = secondOutput :=
  functionTriple.isFunction.2.2 input firstOutput secondOutput
    firstEvaluation secondEvaluation

/-- Extensionality for the domain/codomain/graph triple convention. -/
@[ext] theorem ext
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

/--
The single typed-to-set representation theorem.

The theorem does not turn arbitrary Lean types into backend sets.  It takes
explicit coordinate encodings, explicit backend objects for the encoded
domain and codomain, an ambient set of pairs, exact domain-encoding evidence,
codomain coverage, and pair-existence evidence.  Its conclusion supplies one
set-theoretic function whose graph evaluates to the encoded typed function.
-/
theorem typedFunctionGraphRepresentation
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
    (map : LRA.Function Domain Codomain)
    (encodeDomain : Domain → DomainElement)
    (encodeCodomain : Codomain → CodomainElement)
    (domainEncoding : DomainObject)
    (codomainEncoding : CodomainObject)
    (ambientPairs : GraphObject)
    (encodeDomainInjective : Function.Injective encodeDomain)
    (domainEncodingExact : ∀ encoded : DomainElement,
      encoded ∈ domainEncoding ↔ ∃ input : Domain, encodeDomain input = encoded)
    (codomainEncodingCovers : ∀ output : Codomain,
      encodeCodomain output ∈ codomainEncoding)
    (graphPairsExist : ∀ input : Domain,
      (OrderedPair (encodeDomain input) (encodeCodomain (map input)) : Pair) ∈
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
              (encodeCodomain (map input))) ∧
      ∀ input : Domain,
        Relates represented.triple.graph
          (encodeDomain input) (encodeCodomain (map input)) := by
  sorry

end SetTheoreticFunction
end LRA.Function
