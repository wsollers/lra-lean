import LRA.Set.Interface.Laws.Membership
import LRA.Set.Interface.Laws.Relation

namespace LRA.Function.SetTheoretic

open LRA.Set

universe u v w x

/--
`SetTheoreticFunctionTriple` TODO

Predicate logic:

  structure SetTheoreticFunctionTriple
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x) where
  domain : DomainObject
  codomain : CodomainObject
  graph : GraphObject

Predicate logic (unfolded):

  structure SetTheoreticFunctionTriple
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x) where
  domain : DomainObject
  codomain : CodomainObject
  graph : GraphObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SetTheoreticFunctionTriple
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x) where
  domain : DomainObject
  codomain : CodomainObject
  graph : GraphObject
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
structure SetTheoreticFunctionTriple
    (DomainObject : Type v) (CodomainObject : Type w)
    (GraphObject : Type x) where
  domain : DomainObject
  codomain : CodomainObject
  graph : GraphObject

/--
`SetTheoreticRelationTriple` TODO

Predicate logic:

  structure SetTheoreticRelationTriple
    (LeftDomainObject : Type v) (RightDomainObject : Type w)
    (GraphObject : Type x) where
  leftDomain : LeftDomainObject
  rightDomain : RightDomainObject
  graph : GraphObject

Predicate logic (unfolded):

  structure SetTheoreticRelationTriple
    (LeftDomainObject : Type v) (RightDomainObject : Type w)
    (GraphObject : Type x) where
  leftDomain : LeftDomainObject
  rightDomain : RightDomainObject
  graph : GraphObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SetTheoreticRelationTriple
    (LeftDomainObject : Type v) (RightDomainObject : Type w)
    (GraphObject : Type x) where
  leftDomain : LeftDomainObject
  rightDomain : RightDomainObject
  graph : GraphObject
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
structure SetTheoreticRelationTriple
    (LeftDomainObject : Type v) (RightDomainObject : Type w)
    (GraphObject : Type x) where
  leftDomain : LeftDomainObject
  rightDomain : RightDomainObject
  graph : GraphObject

/--
`IsSetTheoreticRelation` TODO

Predicate logic:

  ∀ {LeftElement RightElement Pair : Type u} {LeftDomainObject : Type v} {RightDomainObject : Type w} {GraphObject : Type x} [inst : LRA.Set.HasPairing LeftElement RightElement Pair] [inst_1 : Membership LeftElement LeftDomainObject] [inst_2 : Membership RightElement RightDomainObject] [inst_3 : Membership Pair GraphObject] (triple : LRA.Function.SetTheoretic.SetTheoreticRelationTriple LeftDomainObject RightDomainObject GraphObject) (member : Pair), member ∈ triple.graph → Exists fun left => Exists fun right => (member = LRA.Set.OrderedPair left right ∧ (left ∈ triple.leftDomain ∧ right ∈ triple.rightDomain))

Predicate logic (unfolded):

  ∀ {LeftElement RightElement Pair : Type u} {LeftDomainObject : Type v} {RightDomainObject : Type w} {GraphObject : Type x} [inst : LRA.Set.HasPairing LeftElement RightElement Pair] [inst_1 : Membership LeftElement LeftDomainObject] [inst_2 : Membership RightElement RightDomainObject] [inst_3 : Membership Pair GraphObject] (triple : LRA.Function.SetTheoretic.SetTheoreticRelationTriple LeftDomainObject RightDomainObject GraphObject) (member : Pair), inst_3.1 triple.3 member → Exists fun left => Exists fun right => (member = inst.1 left right ∧ (inst_1.1 triple.1 left ∧ inst_2.1 triple.2 right))

Logical form (Lean):

```lean
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
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
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

/--
`SetTheoreticRelation` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
  isRelation : IsSetTheoreticRelation triple (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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

/--
`IsSetTheoreticFunction` TODO

Predicate logic:

  ∀ {DomainElement CodomainElement Pair : Type u} {DomainObject : Type v} {CodomainObject : Type w} {GraphObject : Type x} [inst : LRA.Set.HasPairing DomainElement CodomainElement Pair] [inst_1 : Membership DomainElement DomainObject] [inst_2 : Membership CodomainElement CodomainObject] [inst_3 : Membership Pair GraphObject] (triple : LRA.Function.SetTheoretic.SetTheoreticFunctionTriple DomainObject CodomainObject GraphObject), (∀ (member : Pair), member ∈ triple.graph → Exists fun input => Exists fun output => (member = LRA.Set.OrderedPair input output ∧ (input ∈ triple.domain ∧ output ∈ triple.codomain)) ∧ (∀ (input : DomainElement), input ∈ triple.domain → Exists fun output => (output ∈ triple.codomain ∧ LRA.Set.Relates triple.graph input output) ∧ ∀ (input : DomainElement) (firstOutput secondOutput : CodomainElement), LRA.Set.Relates triple.graph input firstOutput → LRA.Set.Relates triple.graph input secondOutput → firstOutput = secondOutput))

Predicate logic (unfolded):

  ∀ {DomainElement CodomainElement Pair : Type u} {DomainObject : Type v} {CodomainObject : Type w} {GraphObject : Type x} [inst : LRA.Set.HasPairing DomainElement CodomainElement Pair] [inst_1 : Membership DomainElement DomainObject] [inst_2 : Membership CodomainElement CodomainObject] [inst_3 : Membership Pair GraphObject] (triple : LRA.Function.SetTheoretic.SetTheoreticFunctionTriple DomainObject CodomainObject GraphObject), (∀ (member : Pair), inst_3.1 triple.3 member → Exists fun input => Exists fun output => (member = inst.1 input output ∧ (inst_1.1 triple.1 input ∧ inst_2.1 triple.2 output)) ∧ (∀ (input : DomainElement), inst_1.1 triple.1 input → Exists fun output => (inst_2.1 triple.2 output ∧ inst_3.1 triple.3 (inst.1 input output)) ∧ ∀ (input : DomainElement) (firstOutput secondOutput : CodomainElement), inst_3.1 triple.3 (inst.1 input firstOutput) → inst_3.1 triple.3 (inst.1 input secondOutput) → firstOutput = secondOutput))

Logical form (Lean):

```lean
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
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
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

/--
`SetTheoreticFunction` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
  isFunction : IsSetTheoreticFunction triple (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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
