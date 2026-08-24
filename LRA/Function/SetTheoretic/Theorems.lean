import LRA.Function.SetTheoretic.Definition

namespace LRA.Function.SetTheoretic

open LRA.Set

universe u v w x

/--
`RelationGraphMemberCoordinates` TODO

Predicate logic:

  (∀ member ∈ Pair), (member ∈ relation.triple.graph) → ∃ left ∈ LeftElement right ∈ RightElement, member = OrderedPair left right ∧ left ∈ relation.triple.leftDomain ∧ right ∈ relation.triple.rightDomain

Predicate logic (unfolded):

  ∀ {LeftElement RightElement Pair : Type u} {LeftDomainObject : Type v} {RightDomainObject : Type w} {GraphObject : Type x} [inst : LRA.Set.HasPairing LeftElement RightElement Pair] [inst_1 : Membership LeftElement LeftDomainObject] [inst_2 : Membership RightElement RightDomainObject] [inst_3 : Membership Pair GraphObject] (relation : LRA.Function.SetTheoretic.SetTheoreticRelation LeftElement RightElement Pair LeftDomainObject RightDomainObject GraphObject) (member : Pair), inst_3.1 relation.triple.3 member → Exists fun left => Exists fun right => (member = inst.1 left right ∧ (inst_1.1 relation.triple.1 left ∧ inst_2.1 relation.triple.2 right))

Logical form (Lean):

```lean
theorem RelationGraphMemberCoordinates
    {LeftElement RightElement Pair : Type u}
    {LeftDomainObject : Type v} {RightDomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing LeftElement RightElement Pair]
    [Membership LeftElement LeftDomainObject]
    [Membership RightElement RightDomainObject]
    [Membership Pair GraphObject]
    (relation : SetTheoreticRelation LeftElement RightElement Pair
      LeftDomainObject RightDomainObject GraphObject)
    (member : Pair)
    (memberInGraph : member ∈ relation.triple.graph) :
    ∃ (left : LeftElement) (right : RightElement),
      member = OrderedPair left right ∧
      left ∈ relation.triple.leftDomain ∧
      right ∈ relation.triple.rightDomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem RelationGraphMemberCoordinates
    {LeftElement RightElement Pair : Type u}
    {LeftDomainObject : Type v} {RightDomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing LeftElement RightElement Pair]
    [Membership LeftElement LeftDomainObject]
    [Membership RightElement RightDomainObject]
    [Membership Pair GraphObject]
    (relation : SetTheoreticRelation LeftElement RightElement Pair
      LeftDomainObject RightDomainObject GraphObject)
    (member : Pair)
    (memberInGraph : member ∈ relation.triple.graph) :
    ∃ (left : LeftElement) (right : RightElement),
      member = OrderedPair left right ∧
      left ∈ relation.triple.leftDomain ∧
      right ∈ relation.triple.rightDomain := by
  sorry

/--
`EvaluationExists` TODO

Predicate logic:

  (∀ input ∈ DomainElement), (input ∈ setFunction.triple.domain) → ∃ output ∈ CodomainElement, output ∈ setFunction.triple.codomain ∧ Relates setFunction.triple.graph input output

Predicate logic (unfolded):

  ∀ {DomainElement CodomainElement Pair : Type u} {DomainObject : Type v} {CodomainObject : Type w} {GraphObject : Type x} [inst : LRA.Set.HasPairing DomainElement CodomainElement Pair] [inst_1 : Membership DomainElement DomainObject] [inst_2 : Membership CodomainElement CodomainObject] [inst_3 : Membership Pair GraphObject] (setFunction : LRA.Function.SetTheoretic.SetTheoreticFunction DomainElement CodomainElement Pair DomainObject CodomainObject GraphObject) (input : DomainElement), inst_1.1 setFunction.triple.1 input → Exists fun output => (inst_2.1 setFunction.triple.2 output ∧ inst_3.1 setFunction.triple.3 (inst.1 input output))

Logical form (Lean):

```lean
theorem EvaluationExists
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (setFunction : SetTheoreticFunction DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement)
    (inputInDomain : input ∈ setFunction.triple.domain) :
    ∃ output : CodomainElement,
      output ∈ setFunction.triple.codomain ∧
      Relates setFunction.triple.graph input output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem EvaluationExists
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (setFunction : SetTheoreticFunction DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement)
    (inputInDomain : input ∈ setFunction.triple.domain) :
    ∃ output : CodomainElement,
      output ∈ setFunction.triple.codomain ∧
      Relates setFunction.triple.graph input output := by
  sorry

/--
`EvaluationUnique` TODO

Predicate logic:

  (∀ input ∈ DomainElement ∀ firstOutput secondOutput ∈ CodomainElement), firstOutput = secondOutput

Predicate logic (unfolded):

  ∀ {DomainElement CodomainElement Pair : Type u} {DomainObject : Type v} {CodomainObject : Type w} {GraphObject : Type x} [inst : LRA.Set.HasPairing DomainElement CodomainElement Pair] [inst_1 : Membership DomainElement DomainObject] [inst_2 : Membership CodomainElement CodomainObject] [inst_3 : Membership Pair GraphObject] (setFunction : LRA.Function.SetTheoretic.SetTheoreticFunction DomainElement CodomainElement Pair DomainObject CodomainObject GraphObject) (input : DomainElement) (firstOutput secondOutput : CodomainElement), (inst_3.1 setFunction.triple.3 (inst.1 input firstOutput) ∧ inst_3.1 setFunction.triple.3 (inst.1 input secondOutput)) → firstOutput = secondOutput

Logical form (Lean):

```lean
theorem EvaluationUnique
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (setFunction : SetTheoreticFunction DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement)
    (firstOutput secondOutput : CodomainElement)
    (firstEvaluation : Relates setFunction.triple.graph input firstOutput)
    (secondEvaluation : Relates setFunction.triple.graph input secondOutput) :
    firstOutput = secondOutput
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
theorem EvaluationUnique
    {DomainElement CodomainElement Pair : Type u}
    {DomainObject : Type v} {CodomainObject : Type w}
    {GraphObject : Type x}
    [HasPairing DomainElement CodomainElement Pair]
    [Membership DomainElement DomainObject]
    [Membership CodomainElement CodomainObject]
    [Membership Pair GraphObject]
    (setFunction : SetTheoreticFunction DomainElement CodomainElement Pair
      DomainObject CodomainObject GraphObject)
    (input : DomainElement)
    (firstOutput secondOutput : CodomainElement)
    (firstEvaluation : Relates setFunction.triple.graph input firstOutput)
    (secondEvaluation : Relates setFunction.triple.graph input secondOutput) :
    firstOutput = secondOutput := by
  sorry

/--
`SetTheoreticFunctionExt` TODO

Predicate logic:

  (left.triple.domain = right.triple.domain ∧ left.triple.codomain = right.triple.codomain ∧ left.triple.graph = right.triple.graph) → left = right

Predicate logic (unfolded):

  ∀ {DomainElement CodomainElement Pair : Type u} {DomainObject : Type v} {CodomainObject : Type w} {GraphObject : Type x} [inst : LRA.Set.HasPairing DomainElement CodomainElement Pair] [inst_1 : Membership DomainElement DomainObject] [inst_2 : Membership CodomainElement CodomainObject] [inst_3 : Membership Pair GraphObject] {left right : LRA.Function.SetTheoretic.SetTheoreticFunction DomainElement CodomainElement Pair DomainObject CodomainObject GraphObject}, (left.triple.1 = right.triple.1 ∧ (left.triple.2 = right.triple.2 ∧ left.triple.3 = right.triple.3)) → left = right

Logical form (Lean):

```lean
theorem SetTheoreticFunctionExt
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
    left = right
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
@[ext] theorem SetTheoreticFunctionExt
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

end LRA.Function.SetTheoretic
