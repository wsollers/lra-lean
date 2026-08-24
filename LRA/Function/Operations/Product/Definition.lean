import LRA.Function.Definition

namespace LRA.Function

universe u v w

/--
`ProductDomainFunction` TODO

Predicate logic:

  abbrev ProductDomainFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  LRA.Function (Left × Right) Codomain

Predicate logic (unfolded):

  abbrev ProductDomainFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  LRA.Function (Left × Right) Codomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ProductDomainFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  LRA.Function (Left × Right) Codomain
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
abbrev ProductDomainFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  LRA.Function (Left × Right) Codomain

/--
`BinaryFunction` TODO

Predicate logic:

  abbrev BinaryFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left → Right → Codomain

Predicate logic (unfolded):

  abbrev BinaryFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left → Right → Codomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev BinaryFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left → Right → Codomain
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
abbrev BinaryFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left → Right → Codomain

/--
`Curry` TODO

Predicate logic:

  def Curry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : ProductDomainFunction Left Right Codomain) :
    BinaryFunction Left Right Codomain :=
  fun left right => function (left, right)

Predicate logic (unfolded):

  def Curry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : ProductDomainFunction Left Right Codomain) :
    BinaryFunction Left Right Codomain :=
  fun left right => function (left, right) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Curry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : ProductDomainFunction Left Right Codomain) :
    BinaryFunction Left Right Codomain :=
  fun left right => function (left, right)
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
def Curry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : ProductDomainFunction Left Right Codomain) :
    BinaryFunction Left Right Codomain :=
  fun left right => function (left, right)

/--
`Uncurry` TODO

Predicate logic:

  def Uncurry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : BinaryFunction Left Right Codomain) :
    ProductDomainFunction Left Right Codomain :=
  fun pair => function pair.1 pair.2

Predicate logic (unfolded):

  def Uncurry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : BinaryFunction Left Right Codomain) :
    ProductDomainFunction Left Right Codomain :=
  fun pair => function pair.1 pair.2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Uncurry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : BinaryFunction Left Right Codomain) :
    ProductDomainFunction Left Right Codomain :=
  fun pair => function pair.1 pair.2
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
def Uncurry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : BinaryFunction Left Right Codomain) :
    ProductDomainFunction Left Right Codomain :=
  fun pair => function pair.1 pair.2

/--
`FirstProjection` TODO

Predicate logic:

  def FirstProjection (Left : Type u) (Right : Type v) :
    LRA.Function (Left × Right) Left :=
  fun pair => pair.1

Predicate logic (unfolded):

  def FirstProjection (Left : Type u) (Right : Type v) :
    LRA.Function (Left × Right) Left :=
  fun pair => pair.1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FirstProjection (Left : Type u) (Right : Type v) :
    LRA.Function (Left × Right) Left :=
  fun pair => pair.1
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
def FirstProjection (Left : Type u) (Right : Type v) :
    LRA.Function (Left × Right) Left :=
  fun pair => pair.1

/--
`SecondProjection` TODO

Predicate logic:

  def SecondProjection (Left : Type u) (Right : Type v) :
    LRA.Function (Left × Right) Right :=
  fun pair => pair.2

Predicate logic (unfolded):

  def SecondProjection (Left : Type u) (Right : Type v) :
    LRA.Function (Left × Right) Right :=
  fun pair => pair.2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SecondProjection (Left : Type u) (Right : Type v) :
    LRA.Function (Left × Right) Right :=
  fun pair => pair.2
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
def SecondProjection (Left : Type u) (Right : Type v) :
    LRA.Function (Left × Right) Right :=
  fun pair => pair.2

/--
`Product` TODO

Predicate logic:

  def Product
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain) :
    LRA.Function Domain (LeftCodomain × RightCodomain) :=
  fun input => (left input, right input)

Predicate logic (unfolded):

  def Product
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain) :
    LRA.Function Domain (LeftCodomain × RightCodomain) :=
  fun input => (left input, right input) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Product
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain) :
    LRA.Function Domain (LeftCodomain × RightCodomain) :=
  fun input => (left input, right input)
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
def Product
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain) :
    LRA.Function Domain (LeftCodomain × RightCodomain) :=
  fun input => (left input, right input)

end LRA.Function
