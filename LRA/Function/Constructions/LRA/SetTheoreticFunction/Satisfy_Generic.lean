import LRA.Function.Satisfy_Generic
import LRA.Function.SetTheoretic.Relationships

namespace LRA.Function.Constructions.LRA.SetTheoreticFunction

open LRA.Set

universe u v w x

/--
`TotalSetTheoreticFunction` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
      ∀ input : DomainElement, input ∈ toSetTheoreticFunction.triple.domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
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

/--
`satisfiesGeneric` TODO

Predicate logic:

  ∀ {DomainElement CodomainElement Pair : Type u} {DomainObject : Type v} {CodomainObject : Type w} {GraphObject : Type x} [inst : LRA.Set.HasPairing DomainElement CodomainElement Pair] [inst_1 : Membership DomainElement DomainObject] [inst_2 : Membership CodomainElement CodomainObject] [inst_3 : Membership Pair GraphObject] (function : LRA.Function.Constructions.LRA.SetTheoreticFunction.TotalSetTheoreticFunction DomainElement CodomainElement Pair DomainObject CodomainObject GraphObject), LRA.Function.genericTheory function

Predicate logic (unfolded):

  Ambient
    (DomainElement, CodomainElement, Pair, DomainObject, CodomainObject, GraphObject, ∈)
  Objects
    function : TotalSetTheoreticFunction DomainElement CodomainElement Pair DomainObject CodomainObject GraphObject
  Prove
    ((∀ (x : DomainElement), Exists fun y => LRA.Function.Constructions.LRA.SetTheoreticFunction.instGenericSemanticsTotalSetTheoreticFunction.1 function x y) ∧ (∀ (x : DomainElement) (y₁ y₂ : CodomainElement), LRA.Function.Constructions.LRA.SetTheoreticFunction.instGenericSemanticsTotalSetTheoreticFunction.1 function x y₁ → LRA.Function.Constructions.LRA.SetTheoreticFunction.instGenericSemanticsTotalSetTheoreticFunction.1 function x y₂ → y₁ = y₂))

Logical form (Lean):

```lean
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
    LRA.Function.genericTheory function
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
