namespace LRA.Operation

universe u v w

/--
`Operation` TODO

Predicate logic:

  abbrev Operation (Domain : Type u) (Codomain : Type v) :=
  Domain → Codomain

Predicate logic (unfolded):

  abbrev Operation (Domain : Type u) (Codomain : Type v) :=
  Domain → Codomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Operation (Domain : Type u) (Codomain : Type v) :=
  Domain → Codomain
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
abbrev Operation (Domain : Type u) (Codomain : Type v) :=
  Domain → Codomain

/--
`NullaryOperation` TODO

Predicate logic:

  abbrev NullaryOperation (Codomain : Type u) := Codomain

Predicate logic (unfolded):

  abbrev NullaryOperation (Codomain : Type u) := Codomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev NullaryOperation (Codomain : Type u) := Codomain
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
abbrev NullaryOperation (Codomain : Type u) := Codomain

/--
`HeterogeneousUnaryOperation` TODO

Predicate logic:

  abbrev HeterogeneousUnaryOperation (Domain : Type u) (Codomain : Type v) :=
  Operation Domain Codomain

Predicate logic (unfolded):

  abbrev HeterogeneousUnaryOperation (Domain : Type u) (Codomain : Type v) :=
  Operation Domain Codomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev HeterogeneousUnaryOperation (Domain : Type u) (Codomain : Type v) :=
  Operation Domain Codomain
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
abbrev HeterogeneousUnaryOperation (Domain : Type u) (Codomain : Type v) :=
  Operation Domain Codomain

/--
`UnaryOperation` TODO

Predicate logic:

  abbrev UnaryOperation (Carrier : Type u) :=
  HeterogeneousUnaryOperation Carrier Carrier

Predicate logic (unfolded):

  abbrev UnaryOperation (Carrier : Type u) :=
  HeterogeneousUnaryOperation Carrier Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev UnaryOperation (Carrier : Type u) :=
  HeterogeneousUnaryOperation Carrier Carrier
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
abbrev UnaryOperation (Carrier : Type u) :=
  HeterogeneousUnaryOperation Carrier Carrier

/--
`ConstantOperation` TODO

Predicate logic:

  abbrev ConstantOperation (Codomain : Type u) := NullaryOperation Codomain

Predicate logic (unfolded):

  abbrev ConstantOperation (Codomain : Type u) := NullaryOperation Codomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ConstantOperation (Codomain : Type u) := NullaryOperation Codomain
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
abbrev ConstantOperation (Codomain : Type u) := NullaryOperation Codomain

/--
`UnaryEndoOperation` TODO

Predicate logic:

  abbrev UnaryEndoOperation (Carrier : Type u) := UnaryOperation Carrier

Predicate logic (unfolded):

  abbrev UnaryEndoOperation (Carrier : Type u) := UnaryOperation Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev UnaryEndoOperation (Carrier : Type u) := UnaryOperation Carrier
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
abbrev UnaryEndoOperation (Carrier : Type u) := UnaryOperation Carrier

/--
`HeterogeneousBinaryOperation` TODO

Predicate logic:

  abbrev HeterogeneousBinaryOperation
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left → Right → Codomain

Predicate logic (unfolded):

  abbrev HeterogeneousBinaryOperation
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left → Right → Codomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev HeterogeneousBinaryOperation
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
abbrev HeterogeneousBinaryOperation
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left → Right → Codomain

/--
`BinaryOperation` TODO

Predicate logic:

  abbrev BinaryOperation (Carrier : Type u) :=
  HeterogeneousBinaryOperation Carrier Carrier Carrier

Predicate logic (unfolded):

  abbrev BinaryOperation (Carrier : Type u) :=
  HeterogeneousBinaryOperation Carrier Carrier Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev BinaryOperation (Carrier : Type u) :=
  HeterogeneousBinaryOperation Carrier Carrier Carrier
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
abbrev BinaryOperation (Carrier : Type u) :=
  HeterogeneousBinaryOperation Carrier Carrier Carrier

/--
`BinaryEndoOperation` TODO

Predicate logic:

  abbrev BinaryEndoOperation (Carrier : Type u) := BinaryOperation Carrier

Predicate logic (unfolded):

  abbrev BinaryEndoOperation (Carrier : Type u) := BinaryOperation Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev BinaryEndoOperation (Carrier : Type u) := BinaryOperation Carrier
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
abbrev BinaryEndoOperation (Carrier : Type u) := BinaryOperation Carrier

/--
`ExternalBinaryOperation` TODO

Predicate logic:

  abbrev ExternalBinaryOperation (Scalar : Type u) (Carrier : Type v) :=
  HeterogeneousBinaryOperation Scalar Carrier Carrier

Predicate logic (unfolded):

  abbrev ExternalBinaryOperation (Scalar : Type u) (Carrier : Type v) :=
  HeterogeneousBinaryOperation Scalar Carrier Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ExternalBinaryOperation (Scalar : Type u) (Carrier : Type v) :=
  HeterogeneousBinaryOperation Scalar Carrier Carrier
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
abbrev ExternalBinaryOperation (Scalar : Type u) (Carrier : Type v) :=
  HeterogeneousBinaryOperation Scalar Carrier Carrier

/--
`EndomapComposition` TODO

Predicate logic:

  def EndomapComposition (Carrier : Type u) :
    BinaryEndoOperation (Carrier → Carrier) :=
  fun second first input => second (first input)

Predicate logic (unfolded):

  def EndomapComposition (Carrier : Type u) :
    BinaryEndoOperation (Carrier → Carrier) :=
  fun second first input => second (first input) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def EndomapComposition (Carrier : Type u) :
    BinaryEndoOperation (Carrier → Carrier) :=
  fun second first input => second (first input)
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
def EndomapComposition (Carrier : Type u) :
    BinaryEndoOperation (Carrier → Carrier) :=
  fun second first input => second (first input)

/--
`EndomapIdentity` TODO

Predicate logic:

  def EndomapIdentity (Carrier : Type u) : Carrier → Carrier :=
  fun input => input

Predicate logic (unfolded):

  def EndomapIdentity (Carrier : Type u) : Carrier → Carrier :=
  fun input => input (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def EndomapIdentity (Carrier : Type u) : Carrier → Carrier :=
  fun input => input
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
def EndomapIdentity (Carrier : Type u) : Carrier → Carrier :=
  fun input => input

/--
`PointwiseBinaryOperation` TODO

Predicate logic:

  def PointwiseBinaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : BinaryEndoOperation Codomain) :
    BinaryEndoOperation (Domain → Codomain) :=
  fun first second input => operation (first input) (second input)

Predicate logic (unfolded):

  def PointwiseBinaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : BinaryEndoOperation Codomain) :
    BinaryEndoOperation (Domain → Codomain) :=
  fun first second input => operation (first input) (second input) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseBinaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : BinaryEndoOperation Codomain) :
    BinaryEndoOperation (Domain → Codomain) :=
  fun first second input => operation (first input) (second input)
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
def PointwiseBinaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : BinaryEndoOperation Codomain) :
    BinaryEndoOperation (Domain → Codomain) :=
  fun first second input => operation (first input) (second input)

/--
`PointwiseUnaryOperation` TODO

Predicate logic:

  def PointwiseUnaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : UnaryEndoOperation Codomain) :
    UnaryEndoOperation (Domain → Codomain) :=
  fun map input => operation (map input)

Predicate logic (unfolded):

  def PointwiseUnaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : UnaryEndoOperation Codomain) :
    UnaryEndoOperation (Domain → Codomain) :=
  fun map input => operation (map input) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseUnaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : UnaryEndoOperation Codomain) :
    UnaryEndoOperation (Domain → Codomain) :=
  fun map input => operation (map input)
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
def PointwiseUnaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : UnaryEndoOperation Codomain) :
    UnaryEndoOperation (Domain → Codomain) :=
  fun map input => operation (map input)

/--
`PartialUnaryOperation` TODO

Predicate logic:

  structure PartialUnaryOperation (Carrier : Type u) where
  Domain : Carrier → Prop
  Value : ∀ input, Domain input → Carrier

Predicate logic (unfolded):

  structure PartialUnaryOperation (Carrier : Type u) where
  Domain : Carrier → Prop
  Value : ∀ input, Domain input → Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PartialUnaryOperation (Carrier : Type u) where
  Domain : Carrier → Prop
  Value : ∀ input, Domain input → Carrier
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
structure PartialUnaryOperation (Carrier : Type u) where
  Domain : Carrier → Prop
  Value : ∀ input, Domain input → Carrier

/--
`PartialBinaryOperation` TODO

Predicate logic:

  structure PartialBinaryOperation (Carrier : Type u) where
  Domain : Carrier → Carrier → Prop
  Value : ∀ left right, Domain left right → Carrier

Predicate logic (unfolded):

  structure PartialBinaryOperation (Carrier : Type u) where
  Domain : Carrier → Carrier → Prop
  Value : ∀ left right, Domain left right → Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PartialBinaryOperation (Carrier : Type u) where
  Domain : Carrier → Carrier → Prop
  Value : ∀ left right, Domain left right → Carrier
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
structure PartialBinaryOperation (Carrier : Type u) where
  Domain : Carrier → Carrier → Prop
  Value : ∀ left right, Domain left right → Carrier

end LRA.Operation
