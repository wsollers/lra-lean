import LRA.Function.Calculus.Classes.Definition

namespace LRA.Function

universe u v

/--
`GraphRelatesValue` TODO

Predicate logic:

  (∀ input ∈ Domain), Graph function input (function input)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (input : Domain), function input = function input

Logical form (Lean):

```lean
theorem GraphRelatesValue {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (input : Domain) :
    Graph function input (function input)
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
theorem GraphRelatesValue {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (input : Domain) :
    Graph function input (function input) := by
  sorry

/--
`GraphOutputEqualsValue` TODO

Predicate logic:

  (∀ input ∈ Domain ∀ output ∈ Codomain), output = function input

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (input : Domain) (output : Codomain), function input = output → output = function input

Logical form (Lean):

```lean
theorem GraphOutputEqualsValue {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (input : Domain) (output : Codomain)
    (related : Graph function input output) :
    output = function input
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
theorem GraphOutputEqualsValue {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (input : Domain) (output : Codomain)
    (related : Graph function input output) :
    output = function input := by
  sorry

/--
`PointImageClassIffValue` TODO

Predicate logic:

  (∀ input ∈ Domain ∀ output ∈ Codomain), PointImageClass function input output ↔ output = function input

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (input : Domain) (output : Codomain), function input = output ↔ output = function input

Logical form (Lean):

```lean
theorem PointImageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (input : Domain) (output : Codomain) :
    PointImageClass function input output ↔ output = function input
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
theorem PointImageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (input : Domain) (output : Codomain) :
    PointImageClass function input output ↔ output = function input := by
  sorry

/--
`FiberClassIffValue` TODO

Predicate logic:

  (∀ output ∈ Codomain ∀ input ∈ Domain), FiberClass function output input ↔ output = function input

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (output : Codomain) (input : Domain), function input = output ↔ output = function input

Logical form (Lean):

```lean
theorem FiberClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (output : Codomain) (input : Domain) :
    FiberClass function output input ↔ output = function input
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
theorem FiberClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (output : Codomain) (input : Domain) :
    FiberClass function output input ↔ output = function input := by
  sorry

/--
`RangeClassIffValue` TODO

Predicate logic:

  (∀ output ∈ Codomain), RangeClass function output ↔ ∃ input, output = function input

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (output : Codomain), Exists fun x => function x = output ↔ Exists fun input => output = function input

Logical form (Lean):

```lean
theorem RangeClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (output : Codomain) :
    RangeClass function output ↔
      ∃ input, output = function input
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, use, rcases

-/
theorem RangeClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (output : Codomain) :
    RangeClass function output ↔
      ∃ input, output = function input := by
  sorry

/--
`ImageClassIffValue` TODO

Predicate logic:

  (∀ output ∈ Codomain), ImageClass function source output ↔ ∃ input, source input ∧ output = function input

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (source : Domain → Prop) (output : Codomain), Exists fun x => (source x ∧ function x = output) ↔ Exists fun input => (source input ∧ output = function input)

Logical form (Lean):

```lean
theorem ImageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : LRA.Set.SetClass Domain)
    (output : Codomain) :
    ImageClass function source output ↔
      ∃ input, source input ∧ output = function input
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, use

-/
theorem ImageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : LRA.Set.SetClass Domain)
    (output : Codomain) :
    ImageClass function source output ↔
      ∃ input, source input ∧ output = function input := by
  sorry

/--
`PreimageClassIffValue` TODO

Predicate logic:

  (∀ input ∈ Domain), PreimageClass function target input ↔ target (function input)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (target : Codomain → Prop) (input : Domain), Exists fun y => (target y ∧ function input = y) ↔ target (function input)

Logical form (Lean):

```lean
theorem PreimageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (target : LRA.Set.SetClass Codomain)
    (input : Domain) :
    PreimageClass function target input ↔
      target (function input)
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
theorem PreimageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (target : LRA.Set.SetClass Codomain)
    (input : Domain) :
    PreimageClass function target input ↔
      target (function input) := by
  sorry

end LRA.Function
