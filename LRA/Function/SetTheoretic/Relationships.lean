import LRA.Function.SetTheoretic.Theorems
import LRA.Function.Definition
import LRA.Set.Interface.Definitions.RelationSets
import LRA.Set.Interface.Laws.Pairing

namespace LRA.Function.SetTheoretic

open LRA.Set

universe u v w x y z

/--
`SingleValuedOfIsSetTheoreticFunction` TODO

Predicate logic:

  (IsSetTheoreticFunction DomainElement ∈ = DomainElement CodomainElement ∈ = CodomainElement Pair ∈ = Pair triple) → IsSingleValued DomainElement CodomainElement triple.graph

Predicate logic (unfolded):

  ∀ {DomainElement CodomainElement Pair : Type u} {DomainObject : Type v} {CodomainObject : Type w} {GraphObject : Type x} [inst : LRA.Set.HasPairing DomainElement CodomainElement Pair] [inst_1 : Membership DomainElement DomainObject] [inst_2 : Membership CodomainElement CodomainObject] [inst_3 : Membership Pair GraphObject] {triple : LRA.Function.SetTheoretic.SetTheoreticFunctionTriple DomainObject CodomainObject GraphObject}, (∀ (member : Pair), inst_3.1 triple.3 member → Exists fun input => Exists fun output => (member = inst.1 input output ∧ (inst_1.1 triple.1 input ∧ inst_2.1 triple.2 output)) ∧ (∀ (input : DomainElement), inst_1.1 triple.1 input → Exists fun output => (inst_2.1 triple.2 output ∧ inst_3.1 triple.3 (inst.1 input output)) ∧ ∀ (input : DomainElement) (firstOutput secondOutput : CodomainElement), inst_3.1 triple.3 (inst.1 input firstOutput) → inst_3.1 triple.3 (inst.1 input secondOutput) → firstOutput = secondOutput)) → ∀ (input : DomainElement) (firstOutput secondOutput : CodomainElement), (inst_3.1 triple.3 (inst.1 input firstOutput) ∧ inst_3.1 triple.3 (inst.1 input secondOutput)) → firstOutput = secondOutput

Logical form (Lean):

```lean
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
    IsSingleValued DomainElement CodomainElement triple.graph
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
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

/--
`BundledSingleValued` TODO

Predicate logic:

  IsSingleValued DomainElement CodomainElement function.triple.graph

Predicate logic (unfolded):

  ∀ {DomainElement CodomainElement Pair : Type u} {DomainObject : Type v} {CodomainObject : Type w} {GraphObject : Type x} [inst : LRA.Set.HasPairing DomainElement CodomainElement Pair] [inst_1 : Membership DomainElement DomainObject] [inst_2 : Membership CodomainElement CodomainObject] [inst_3 : Membership Pair GraphObject] (function : LRA.Function.SetTheoretic.SetTheoreticFunction DomainElement CodomainElement Pair DomainObject CodomainObject GraphObject) (input : DomainElement) (firstOutput secondOutput : CodomainElement), (inst_3.1 function.triple.3 (inst.1 input firstOutput) ∧ inst_3.1 function.triple.3 (inst.1 input secondOutput)) → firstOutput = secondOutput

Logical form (Lean):

```lean
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
    IsSingleValued DomainElement CodomainElement function.triple.graph
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
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

/--
`TypedFunctionGraphRepresentation` TODO

Predicate logic:

  (∀ domainEncoding ∈ DomainObject ∀ codomainEncoding ∈ CodomainObject ∀ ambientPairs ∈ GraphObject), (Domain → DomainElement ∧ Codomain → CodomainElement ∧ ∀ encoded : DomainElement, encoded ∈ domainEncoding ↔ ∃ input ∈ Domain, encodeDomain input = encoded ∧ ∀ output : Codomain, encodeCodomain output ∈ codomainEncoding ∧ ∀ input : Domain, (OrderedPair (encodeDomain input) (encodeCodomain (function input)) : Pair) ∈ ambientPairs) → ∃ represented ∈ SetTheoreticFunction DomainElement CodomainElement Pair DomainObject CodomainObject GraphObject, represented.triple.domain = domainEncoding ∧ represented.triple.codomain = codomainEncoding ∧ represented.triple.graph = HasSeparation.separation ambientPairs fun member ∈ Pair => ∃ input ∈ Domain, member = OrderedPair (encodeDomain input (encodeCodomain (function input))) ∧ ∀ input : Domain, Relates represented.triple.graph (encodeDomain input) (encodeCodomain (function input))

Predicate logic (unfolded):

  ∀ {Domain : Type y} {Codomain : Type z} {DomainElement CodomainElement Pair : Type u} {DomainObject : Type v} {CodomainObject : Type w} {GraphObject : Type x} [inst : LRA.Set.HasPairing DomainElement CodomainElement Pair], LRA.Set.PairingLaws DomainElement CodomainElement Pair → ∀ [inst_1 : Membership DomainElement DomainObject] [inst_2 : Membership CodomainElement CodomainObject] [inst_3 : Membership Pair GraphObject] [inst_4 : LRA.Set.HasSeparation Pair GraphObject], LRA.Set.SeparationLaws Pair GraphObject → ∀ (function : Domain → Codomain) (encodeDomain : Domain → DomainElement) (encodeCodomain : Codomain → CodomainElement) (domainEncoding : DomainObject) (codomainEncoding : CodomainObject) (ambientPairs : GraphObject), (∀ ⦃a₁ a₂ : Domain⦄, encodeDomain a₁ = encodeDomain a₂ → a₁ = a₂ ∧ (∀ (encoded : DomainElement), inst_1.1 domainEncoding encoded ↔ Exists fun input => encodeDomain input = encoded ∧ (∀ (output : Codomain), inst_2.1 codomainEncoding (encodeCodomain output) ∧ ∀ (input : Domain), inst_3.1 ambientPairs (inst.1 (encodeDomain input) (encodeCodomain (function input)))))) → Exists fun represented => (represented.triple.1 = domainEncoding ∧ (represented.triple.2 = codomainEncoding ∧ (represented.triple.3 = inst_4.1 ambientPairs fun member => Exists fun input => member = inst.1 (encodeDomain input) (encodeCodomain (function input)) ∧ ∀ (input : Domain), inst_3.1 represented.triple.3 (inst.1 (encodeDomain input) (encodeCodomain (function input))))))

Logical form (Lean):

```lean
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
    (function : LRA.Function Domain Codomain)
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
          (encodeDomain input) (encodeCodomain (function input))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
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
    (function : LRA.Function Domain Codomain)
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

end LRA.Function.SetTheoretic
