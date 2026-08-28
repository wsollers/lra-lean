import LRA.Function.Definition
import LRA.Relation.Interface.Structures.PartialFunction.Definition

namespace LRA.Function

universe u v

/--
`PartialFunction` TODO

Predicate logic:

  structure PartialFunction (Domain : Type u) (Codomain : Type v) where
  DefinedAt : Domain → Prop
  value : ∀ input, DefinedAt input → Codomain

Predicate logic (unfolded):

  structure PartialFunction (Domain : Type u) (Codomain : Type v) where
  DefinedAt : Domain → Prop
  value : ∀ input, DefinedAt input → Codomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PartialFunction (Domain : Type u) (Codomain : Type v) where
  DefinedAt : Domain → Prop
  value : ∀ input, DefinedAt input → Codomain
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
structure PartialFunction (Domain : Type u) (Codomain : Type v) where
  DefinedAt : Domain → Prop
  value : ∀ input, DefinedAt input → Codomain

/--
`PartialEndofunction` TODO

Predicate logic:

  abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier

Predicate logic (unfolded):

  abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier
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
abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier

/--
`PartialGraph` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function.PartialFunction Domain Codomain) (a : Domain) (a_1 : Codomain), Exists fun defined => function.value a defined = a_1

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function.PartialFunction Domain Codomain) (a : Domain) (a_1 : Codomain), Exists fun defined => function.2 a defined = a_1

Logical form (Lean):

```lean
def PartialGraph {Domain : Type u} {Codomain : Type v}
    (function : PartialFunction Domain Codomain) :
    FunctionRelation Domain Codomain :=
  fun input output => ∃ defined : function.DefinedAt input,
    function.value input defined = output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def PartialGraph {Domain : Type u} {Codomain : Type v}
    (function : PartialFunction Domain Codomain) :
    FunctionRelation Domain Codomain :=
  fun input output => ∃ defined : function.DefinedAt input,
    function.value input defined = output

end LRA.Function
