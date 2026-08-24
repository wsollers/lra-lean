import LRA.Relation.Definition
import LRA.Relation.Properties.Definition

namespace LRA

universe u v

/--
`Function` TODO

Predicate logic:

  abbrev Function (Domain : Type u) (Codomain : Type v) := Domain → Codomain

Predicate logic (unfolded):

  abbrev Function (Domain : Type u) (Codomain : Type v) := Domain → Codomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Function (Domain : Type u) (Codomain : Type v) := Domain → Codomain
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
abbrev Function (Domain : Type u) (Codomain : Type v) := Domain → Codomain

end LRA

namespace LRA.Function

universe u v

/--
`FunctionRelation` TODO

Predicate logic:

  abbrev FunctionRelation (Domain : Type u) (Codomain : Type v) :=
  LRA.Relation.HeterogeneousBinaryRelation Domain Codomain

Predicate logic (unfolded):

  abbrev FunctionRelation (Domain : Type u) (Codomain : Type v) :=
  LRA.Relation.HeterogeneousBinaryRelation Domain Codomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FunctionRelation (Domain : Type u) (Codomain : Type v) :=
  LRA.Relation.HeterogeneousBinaryRelation Domain Codomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev FunctionRelation (Domain : Type u) (Codomain : Type v) :=
  LRA.Relation.HeterogeneousBinaryRelation Domain Codomain

/--
`SingleValued` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (relation : LRA.Function.FunctionRelation Domain Codomain) (x : Domain) (y₁ y₂ : Codomain), (relation x y₁ ∧ relation x y₂) → y₁ = y₂

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (relation : Domain → Codomain → Prop) (x : Domain) (y₁ y₂ : Codomain), (relation x y₁ ∧ relation x y₂) → y₁ = y₂

Logical form (Lean):

```lean
abbrev SingleValued {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  LRA.Relation.RightUnique relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev SingleValued {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  LRA.Relation.RightUnique relation

/--
`Total` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (relation : LRA.Function.FunctionRelation Domain Codomain) (x : Domain), Exists fun y => relation x y

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (relation : Domain → Codomain → Prop) (x : Domain), Exists fun y => relation x y

Logical form (Lean):

```lean
abbrev Total {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  LRA.Relation.LeftTotal relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev Total {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  LRA.Relation.LeftTotal relation

/--
`IsFunctionRelation` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (relation : LRA.Function.FunctionRelation Domain Codomain), (LRA.Function.Total relation ∧ LRA.Function.SingleValued relation)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (relation : Domain → Codomain → Prop), (∀ (x : Domain), Exists fun y => relation x y ∧ ∀ (x : Domain) (y₁ y₂ : Codomain), relation x y₁ → relation x y₂ → y₁ = y₂)

Logical form (Lean):

```lean
def IsFunctionRelation {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  Total relation ∧ SingleValued relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def IsFunctionRelation {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  Total relation ∧ SingleValued relation

/--
`Endofunction` TODO

Predicate logic:

  abbrev Endofunction (Carrier : Type u) := LRA.Function Carrier Carrier

Predicate logic (unfolded):

  abbrev Endofunction (Carrier : Type u) := LRA.Function Carrier Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Endofunction (Carrier : Type u) := LRA.Function Carrier Carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev Endofunction (Carrier : Type u) := LRA.Function Carrier Carrier

/--
`Graph` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (a : Domain) (a_1 : Codomain), function a = a_1

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (a : Domain) (a_1 : Codomain), function a = a_1

Logical form (Lean):

```lean
def Graph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : FunctionRelation Domain Codomain :=
  fun input output => function input = output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def Graph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : FunctionRelation Domain Codomain :=
  fun input output => function input = output

end LRA.Function
