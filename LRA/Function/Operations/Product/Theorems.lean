import LRA.Function.Operations.Product.Definition

namespace LRA.Function

universe u v w

/--
`CurryAfterUncurry` TODO

Predicate logic:

  Curry (Uncurry function) = function

Predicate logic (unfolded):

  ∀ {Left : Type u} {Right : Type v} {Codomain : Type w} (function : Left → Right → Codomain), fun left right => function { fst := left, snd := right }.1 { fst := left, snd := right }.2 = function

Logical form (Lean):

```lean
theorem CurryAfterUncurry
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : BinaryFunction Left Right Codomain) :
    Curry (Uncurry function) = function
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
theorem CurryAfterUncurry
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : BinaryFunction Left Right Codomain) :
    Curry (Uncurry function) = function := by
  sorry
/--
`UncurryAfterCurry` TODO

Predicate logic:

  Uncurry (Curry function) = function

Predicate logic (unfolded):

  ∀ {Left : Type u} {Right : Type v} {Codomain : Type w} (function : Prod Left Right → Codomain), fun pair => function { fst := pair.1, snd := pair.2 } = function

Logical form (Lean):

```lean
theorem UncurryAfterCurry
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : ProductDomainFunction Left Right Codomain) :
    Uncurry (Curry function) = function
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
theorem UncurryAfterCurry
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : ProductDomainFunction Left Right Codomain) :
    Uncurry (Curry function) = function := by
  sorry
/--
`FirstProjectionProductValue` TODO

Predicate logic:

  (∀ input ∈ Domain), FirstProjection LeftCodomain RightCodomain (Product left right input) = left input

Predicate logic (unfolded):

  ∀ {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w} (left : Domain → LeftCodomain) (right : Domain → RightCodomain) (input : Domain), LRA.Function.Product left right input = .1(left input)

Logical form (Lean):

```lean
theorem FirstProjectionProductValue
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain)
    (input : Domain) :
    FirstProjection LeftCodomain RightCodomain (Product left right input) =
      left input
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
theorem FirstProjectionProductValue
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain)
    (input : Domain) :
    FirstProjection LeftCodomain RightCodomain (Product left right input) =
      left input := by
  sorry
/--
`SecondProjectionProductValue` TODO

Predicate logic:

  (∀ input ∈ Domain), SecondProjection LeftCodomain RightCodomain (Product left right input) = right input

Predicate logic (unfolded):

  ∀ {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w} (left : Domain → LeftCodomain) (right : Domain → RightCodomain) (input : Domain), LRA.Function.Product left right input = .2(right input)

Logical form (Lean):

```lean
theorem SecondProjectionProductValue
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain)
    (input : Domain) :
    SecondProjection LeftCodomain RightCodomain (Product left right input) =
      right input
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
theorem SecondProjectionProductValue
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain)
    (input : Domain) :
    SecondProjection LeftCodomain RightCodomain (Product left right input) =
      right input := by
  sorry
end LRA.Function
