import LRA.Function.Properties.Definition
import LRA.Function.Calculus.Classes.Definition
import LRA.Relation.Interface.Operations.Converse.Definition

namespace LRA.Function

universe u v

/--
`InjectiveIffFibersSubsingleton` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), function.Injective ↔ ∀ (output : Codomain) (left right : Domain), function.FiberClass output left → function.FiberClass output right → left = right

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    function.Injective ↔ ∀ (output : Codomain) (left right : Domain), function.FiberClass output left → function.FiberClass output right → left = right

Logical form (Lean):

```lean
theorem InjectiveIffFibersSubsingleton
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔
      ∀ output left right,
        FiberClass function output left →
        FiberClass function output right →
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

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem InjectiveIffFibersSubsingleton
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔
      ∀ output left right,
        FiberClass function output left →
        FiberClass function output right →
        left = right := by
  sorry
/--
`SurjectiveIffFibersNonempty` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), function.Surjective ↔ ∀ (output : Codomain), Exists fun input => function.FiberClass output input

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    function.Surjective ↔ ∀ (output : Codomain), Exists fun input => function.FiberClass output input

Logical form (Lean):

```lean
theorem SurjectiveIffFibersNonempty
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔
      ∀ output, ∃ input, FiberClass function output input
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem SurjectiveIffFibersNonempty
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔
      ∀ output, ∃ input, FiberClass function output input := by
  sorry
/--
`InjectiveIffConverseSingleValued` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), function.Injective ↔ LRA.Function.SingleValued (LRA.Relation.Converse function.Graph)

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    function.Injective ↔ LRA.Function.SingleValued (LRA.Relation.Converse function.Graph)

Logical form (Lean):

```lean
theorem InjectiveIffConverseSingleValued
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔
      SingleValued (LRA.Relation.Converse (Graph function))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem InjectiveIffConverseSingleValued
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔
      SingleValued (LRA.Relation.Converse (Graph function)) := by
  sorry
/--
`SurjectiveIffConverseTotal` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), function.Surjective ↔ LRA.Function.Total (LRA.Relation.Converse function.Graph)

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    function.Surjective ↔ LRA.Function.Total (LRA.Relation.Converse function.Graph)

Logical form (Lean):

```lean
theorem SurjectiveIffConverseTotal
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔
      Total (LRA.Relation.Converse (Graph function))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem SurjectiveIffConverseTotal
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔
      Total (LRA.Relation.Converse (Graph function)) := by
  sorry
/--
`BijectiveIffConverseIsFunctionRelation` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), function.Bijective ↔ LRA.Function.IsFunctionRelation (LRA.Relation.Converse function.Graph)

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    function.Bijective ↔ LRA.Function.IsFunctionRelation (LRA.Relation.Converse function.Graph)

Logical form (Lean):

```lean
theorem BijectiveIffConverseIsFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Bijective function ↔
      IsFunctionRelation (LRA.Relation.Converse (Graph function))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem BijectiveIffConverseIsFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Bijective function ↔
      IsFunctionRelation (LRA.Relation.Converse (Graph function)) := by
  sorry
/--
`GraphIsFunctionRelation` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), LRA.Function.IsFunctionRelation function.Graph

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    ((∀ (x : Domain), Exists fun y => function x = y) ∧ (∀ (x : Domain) (y₁ y₂ : Codomain), function x = y₁ → function x = y₂ → y₁ = y₂))

Logical form (Lean):

```lean
theorem GraphIsFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    IsFunctionRelation (Graph function)
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
theorem GraphIsFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    IsFunctionRelation (Graph function) := by
  sorry
/--
`InjectiveIffStandard` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), function.Injective ↔ ∀ (left right : Domain), function left = function right → left = right

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    function.Injective ↔ ∀ (left right : Domain), function left = function right → left = right

Logical form (Lean):

```lean
theorem InjectiveIffStandard {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔ ∀ left right, function left = function right → left = right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem InjectiveIffStandard {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔ ∀ left right, function left = function right → left = right := by
  sorry
/--
`SurjectiveIffStandard` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), function.Surjective ↔ ∀ (output : Codomain), Exists fun input => function input = output

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    function.Surjective ↔ ∀ (output : Codomain), Exists fun input => function input = output

Logical form (Lean):

```lean
theorem SurjectiveIffStandard {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔ ∀ output, ∃ input, function input = output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem SurjectiveIffStandard {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔ ∀ output, ∃ input, function input = output := by
  sorry
/--
`SurjectiveIffRangeCoversCodomain` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), function.Surjective ↔ ∀ (output : Codomain), function.RangeClass output

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    function.Surjective ↔ ∀ (output : Codomain), function.RangeClass output

Logical form (Lean):

```lean
theorem SurjectiveIffRangeCoversCodomain {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔ ∀ output : Codomain, RangeClass function output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem SurjectiveIffRangeCoversCodomain {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔ ∀ output : Codomain, RangeClass function output := by
  sorry
end LRA.Function
