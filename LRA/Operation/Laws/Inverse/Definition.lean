import LRA.Operation.Definition

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

universe u

/--
`LeftInverse` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity : Carrier) (inverse : LRA.Operation.UnaryEndoOperation Carrier) (element : Carrier), operation (inverse element) element = identity

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (identity : Carrier) (inverse : Carrier → Carrier) (element : Carrier), operation (inverse element) element = identity

Logical form (Lean):

```lean
def LeftInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  ∀ element, operation (inverse element) element = identity
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
def LeftInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  ∀ element, operation (inverse element) element = identity

/--
`RightInverse` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity : Carrier) (inverse : LRA.Operation.UnaryEndoOperation Carrier) (element : Carrier), operation element (inverse element) = identity

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (identity : Carrier) (inverse : Carrier → Carrier) (element : Carrier), operation element (inverse element) = identity

Logical form (Lean):

```lean
def RightInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  ∀ element, operation element (inverse element) = identity
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
def RightInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  ∀ element, operation element (inverse element) = identity

/--
`LeftInverseOf` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity element inverse : Carrier), operation inverse element = identity

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (identity element inverse : Carrier), operation inverse element = identity

Logical form (Lean):

```lean
def LeftInverseOf {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element inverse : Carrier) : Prop :=
  operation inverse element = identity
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
def LeftInverseOf {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element inverse : Carrier) : Prop :=
  operation inverse element = identity

/--
`RightInverseOf` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity element inverse : Carrier), operation element inverse = identity

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (identity element inverse : Carrier), operation element inverse = identity

Logical form (Lean):

```lean
def RightInverseOf {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element inverse : Carrier) : Prop :=
  operation element inverse = identity
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
def RightInverseOf {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element inverse : Carrier) : Prop :=
  operation element inverse = identity

/--
`TwoSidedInverseOf` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity element inverse : Carrier), (LRA.Operation.Laws.Inverse.LeftInverseOf operation identity element inverse ∧ LRA.Operation.Laws.Inverse.RightInverseOf operation identity element inverse)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (identity element inverse : Carrier), (operation inverse element = identity ∧ operation element inverse = identity)

Logical form (Lean):

```lean
def TwoSidedInverseOf {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element inverse : Carrier) : Prop :=
  LeftInverseOf operation identity element inverse ∧
    RightInverseOf operation identity element inverse
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
def TwoSidedInverseOf {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element inverse : Carrier) : Prop :=
  LeftInverseOf operation identity element inverse ∧
    RightInverseOf operation identity element inverse

/--
`LeftInvertibleOn` TODO

Predicate logic:

  ∀ {Carrier : Type u} (eligible : Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity element : Carrier), eligible element → Exists fun inverse => LRA.Operation.Laws.Inverse.LeftInverseOf operation identity element inverse

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (eligible : Carrier → Prop) (operation : Carrier → Carrier → Carrier) (identity element : Carrier), eligible element → Exists fun inverse => operation inverse element = identity

Logical form (Lean):

```lean
def LeftInvertibleOn {Carrier : Type u}
    (eligible : Carrier → Prop)
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  ∀ element, eligible element →
    ∃ inverse, LeftInverseOf operation identity element inverse
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def LeftInvertibleOn {Carrier : Type u}
    (eligible : Carrier → Prop)
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  ∀ element, eligible element →
    ∃ inverse, LeftInverseOf operation identity element inverse

/--
`RightInvertibleOn` TODO

Predicate logic:

  ∀ {Carrier : Type u} (eligible : Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity element : Carrier), eligible element → Exists fun inverse => LRA.Operation.Laws.Inverse.RightInverseOf operation identity element inverse

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (eligible : Carrier → Prop) (operation : Carrier → Carrier → Carrier) (identity element : Carrier), eligible element → Exists fun inverse => operation element inverse = identity

Logical form (Lean):

```lean
def RightInvertibleOn {Carrier : Type u}
    (eligible : Carrier → Prop)
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  ∀ element, eligible element →
    ∃ inverse, RightInverseOf operation identity element inverse
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def RightInvertibleOn {Carrier : Type u}
    (eligible : Carrier → Prop)
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  ∀ element, eligible element →
    ∃ inverse, RightInverseOf operation identity element inverse

/--
`TwoSidedInvertibleOn` TODO

Predicate logic:

  ∀ {Carrier : Type u} (eligible : Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity element : Carrier), eligible element → Exists fun inverse => LRA.Operation.Laws.Inverse.TwoSidedInverseOf operation identity element inverse

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (eligible : Carrier → Prop) (operation : Carrier → Carrier → Carrier) (identity element : Carrier), eligible element → Exists fun inverse => (operation inverse element = identity ∧ operation element inverse = identity)

Logical form (Lean):

```lean
def TwoSidedInvertibleOn {Carrier : Type u}
    (eligible : Carrier → Prop)
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  ∀ element, eligible element →
    ∃ inverse, TwoSidedInverseOf operation identity element inverse
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def TwoSidedInvertibleOn {Carrier : Type u}
    (eligible : Carrier → Prop)
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  ∀ element, eligible element →
    ∃ inverse, TwoSidedInverseOf operation identity element inverse

/--
`TwoSidedInverse` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity : Carrier) (inverse : LRA.Operation.UnaryEndoOperation Carrier), (LRA.Operation.Laws.Inverse.LeftInverse operation identity inverse ∧ LRA.Operation.Laws.Inverse.RightInverse operation identity inverse)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (identity : Carrier) (inverse : Carrier → Carrier), (∀ (element : Carrier), operation (inverse element) element = identity ∧ ∀ (element : Carrier), operation element (inverse element) = identity)

Logical form (Lean):

```lean
def TwoSidedInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  LeftInverse operation identity inverse ∧
    RightInverse operation identity inverse
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
def TwoSidedInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  LeftInverse operation identity inverse ∧
    RightInverse operation identity inverse

end LRA.Operation.Laws.Inverse
