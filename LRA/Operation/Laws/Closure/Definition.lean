import LRA.Operation.Definition

namespace LRA.Operation.Laws.Closure

open LRA.Operation

universe u v w

/--
`UnaryClosedUnder` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (domainCarrier : Domain → Prop) (codomainCarrier : Codomain → Prop) (operation : LRA.Operation.HeterogeneousUnaryOperation Domain Codomain) (input : Domain), domainCarrier input → codomainCarrier (operation input)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (domainCarrier : Domain → Prop) (codomainCarrier : Codomain → Prop) (operation : Domain → Codomain) (input : Domain), domainCarrier input → codomainCarrier (operation input)

Logical form (Lean):

```lean
def UnaryClosedUnder {Domain : Type u} {Codomain : Type v}
    (domainCarrier : Domain → Prop)
    (codomainCarrier : Codomain → Prop)
    (operation : HeterogeneousUnaryOperation Domain Codomain) : Prop :=
  ∀ input, domainCarrier input → codomainCarrier (operation input)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def UnaryClosedUnder {Domain : Type u} {Codomain : Type v}
    (domainCarrier : Domain → Prop)
    (codomainCarrier : Codomain → Prop)
    (operation : HeterogeneousUnaryOperation Domain Codomain) : Prop :=
  ∀ input, domainCarrier input → codomainCarrier (operation input)

/--
`BinaryClosedUnder` TODO

Predicate logic:

  ∀ {Left : Type u} {Right : Type v} {Codomain : Type w} (leftCarrier : Left → Prop) (rightCarrier : Right → Prop) (resultCarrier : Codomain → Prop) (operation : LRA.Operation.HeterogeneousBinaryOperation Left Right Codomain) (left : Left) (right : Right), (leftCarrier left ∧ rightCarrier right) → resultCarrier (operation left right)

Predicate logic (unfolded):

  ∀ {Left : Type u} {Right : Type v} {Codomain : Type w} (leftCarrier : Left → Prop) (rightCarrier : Right → Prop) (resultCarrier : Codomain → Prop) (operation : Left → Right → Codomain) (left : Left) (right : Right), (leftCarrier left ∧ rightCarrier right) → resultCarrier (operation left right)

Logical form (Lean):

```lean
def BinaryClosedUnder {Left : Type u} {Right : Type v} {Codomain : Type w}
    (leftCarrier : Left → Prop)
    (rightCarrier : Right → Prop)
    (resultCarrier : Codomain → Prop)
    (operation : HeterogeneousBinaryOperation Left Right Codomain) : Prop :=
  ∀ left right,
    leftCarrier left → rightCarrier right → resultCarrier (operation left right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def BinaryClosedUnder {Left : Type u} {Right : Type v} {Codomain : Type w}
    (leftCarrier : Left → Prop)
    (rightCarrier : Right → Prop)
    (resultCarrier : Codomain → Prop)
    (operation : HeterogeneousBinaryOperation Left Right Codomain) : Prop :=
  ∀ left right,
    leftCarrier left → rightCarrier right → resultCarrier (operation left right)

/--
`BinaryEndoClosedOn` TODO

Predicate logic:

  ∀ {Ambient : Type u} (carrier : Ambient → Prop) (operation : LRA.Operation.BinaryEndoOperation Ambient) (left right : Ambient), (carrier left ∧ carrier right) → carrier (operation left right)

Predicate logic (unfolded):

  ∀ {Ambient : Type u} (carrier : Ambient → Prop) (operation : Ambient → Ambient → Ambient) (left right : Ambient), (carrier left ∧ carrier right) → carrier (operation left right)

Logical form (Lean):

```lean
def BinaryEndoClosedOn {Ambient : Type u}
    (carrier : Ambient → Prop)
    (operation : BinaryEndoOperation Ambient) : Prop :=
  BinaryClosedUnder carrier carrier carrier operation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def BinaryEndoClosedOn {Ambient : Type u}
    (carrier : Ambient → Prop)
    (operation : BinaryEndoOperation Ambient) : Prop :=
  BinaryClosedUnder carrier carrier carrier operation

end LRA.Operation.Laws.Closure
