import LRA.Function.Operations.Product.Definition

namespace LRA.Function

universe u v w

/--
`CurryAfterUncurry` TODO

Predicate logic:

  ∀ {Left : Type u} {Right : Type v} {Codomain : Type w} (function : LRA.Function.BinaryFunction Left Right Codomain), LRA.Function.Curry (LRA.Function.Uncurry function) = function

Predicate logic (unfolded):

  Ambient
    (Left, Right, Codomain)
  Objects
    function : BinaryFunction Left Right Codomain
  Prove
    fun left right => function { fst := left, snd := right }.1 { fst := left, snd := right }.2 = function

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

  ∀ {Left : Type u} {Right : Type v} {Codomain : Type w} (function : LRA.Function.ProductDomainFunction Left Right Codomain), LRA.Function.Uncurry (LRA.Function.Curry function) = function

Predicate logic (unfolded):

  Ambient
    (Left, Right, Codomain)
  Objects
    function : ProductDomainFunction Left Right Codomain
  Prove
    fun pair => function { fst := pair.1, snd := pair.2 } = function

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

  ∀ {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w} (left : LRA.Function Domain LeftCodomain) (right : LRA.Function Domain RightCodomain) (input : Domain), LRA.Function.FirstProjection LeftCodomain RightCodomain (left.Product right input) = left input

Predicate logic (unfolded):

  Ambient
    (Domain, LeftCodomain, RightCodomain)
  Objects
    left : LRA.Function Domain LeftCodomain
    right : LRA.Function Domain RightCodomain
    input : Domain
  Prove
    LRA.Function.Product left right input = .1(left input)

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

  ∀ {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w} (left : LRA.Function Domain LeftCodomain) (right : LRA.Function Domain RightCodomain) (input : Domain), LRA.Function.SecondProjection LeftCodomain RightCodomain (left.Product right input) = right input

Predicate logic (unfolded):

  Ambient
    (Domain, LeftCodomain, RightCodomain)
  Objects
    left : LRA.Function Domain LeftCodomain
    right : LRA.Function Domain RightCodomain
    input : Domain
  Prove
    LRA.Function.Product left right input = .2(right input)

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
