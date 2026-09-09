import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`LandauLessThan` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), Exists fun z => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x z = y

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y

Logical form (Lean):

```lean
def LandauLessThan
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  ∃ z : Element, LandauAddition model x z = y
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
def LandauLessThan
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  ∃ z : Element, LandauAddition model x z = y

/--
`LandauGreaterThan` Landau's `>` relation is the converse of `LandauLessThan`.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), Exists fun z => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model y z = x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x

Logical form (Lean):

```lean
def LandauGreaterThan
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  LandauLessThan model y x
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
def LandauGreaterThan
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  LandauLessThan model y x

/--
`LandauLessThanOrEqual` Landau's non-strict order packages equality-or-strictness directly on the one-based natural-number surface.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), Or (x = y)(LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model x y)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (x = y) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y)

Logical form (Lean):

```lean
def LandauLessThanOrEqual
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  x = y ∨ LandauLessThan model x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def LandauLessThanOrEqual
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  x = y ∨ LandauLessThan model x y

/--
`LandauGreaterThanOrEqual` Landau's `≥` is the converse of `LandauLessThanOrEqual`.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), Or (y = x)(LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model y x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (y = x) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x)

Logical form (Lean):

```lean
def LandauGreaterThanOrEqual
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  LandauLessThanOrEqual model y x
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
def LandauGreaterThanOrEqual
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  LandauLessThanOrEqual model y x

/--
`LandauLessThanTrichotomous` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), Or (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model x y) (Or (x = y)(LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model y x))

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    Or (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y) (Or (x = y) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x))

Logical form (Lean):

```lean
theorem LandauLessThanTrichotomous
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauLessThan model x y ∨ x = y ∨ LandauLessThan model y x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem LandauLessThanTrichotomous
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauLessThan model x y ∨ x = y ∨ LandauLessThan model y x := by
  sorry
/--
`LandauLessThanTransitive` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y z : Element), (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model x y ∧ LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model y z) → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model x z

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y ∧ Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z_1 = z) → Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z_1 = z

Logical form (Lean):

```lean
theorem LandauLessThanTransitive
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      LandauLessThan model x y → LandauLessThan model y z →
        LandauLessThan model x z
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
theorem LandauLessThanTransitive
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      LandauLessThan model x y → LandauLessThan model y z →
        LandauLessThan model x z := by
  sorry
/--
`LandauAdditionPreservesAndReflectsLandauLessThan` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y z : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model x y ↔ LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x z) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model y z)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model x y ↔ LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x z) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model y z)

Logical form (Lean):

```lean
theorem LandauAdditionPreservesAndReflectsLandauLessThan
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      LandauLessThan model x y ↔
        LandauLessThan model
          (LandauAddition model x z) (LandauAddition model y z)
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
theorem LandauAdditionPreservesAndReflectsLandauLessThan
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      LandauLessThan model x y ↔
        LandauLessThan model
          (LandauAddition model x z) (LandauAddition model y z) := by
  sorry
/--
`LandauMultiplicationPreservesAndReflectsLandauLessThan` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y z : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model x y ↔ LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model x z) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model y z)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model x y ↔ LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model x z) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model y z)

Logical form (Lean):

```lean
theorem LandauMultiplicationPreservesAndReflectsLandauLessThan
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      LandauLessThan model x y ↔
        LandauLessThan model
          (LandauMultiplication model x z) (LandauMultiplication model y z)
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
theorem LandauMultiplicationPreservesAndReflectsLandauLessThan
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      LandauLessThan model x y ↔
        LandauLessThan model
          (LandauMultiplication model x z) (LandauMultiplication model y z) := by
  sorry
/--
`LandauAdditionDoesNotCollapseOnRight` Landau Chapter I, Theorem 7.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), Ne (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model y x) x

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y x = x → False

Logical form (Lean):

```lean
theorem LandauAdditionDoesNotCollapseOnRight
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element, LandauAddition model y x ≠ x
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
theorem LandauAdditionDoesNotCollapseOnRight
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element, LandauAddition model y x ≠ x := by
  sorry
/--
`LandauAdditionLeftCancellation` Landau Chapter I, Theorem 8.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y z : Element), Ne y z → Ne (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x y) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x z)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    ((y = z → False) ∧ (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x y = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z) → False

Logical form (Lean):

```lean
theorem LandauAdditionLeftCancellation
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      y ≠ z →
      LandauAddition model x y ≠ LandauAddition model x z
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
theorem LandauAdditionLeftCancellation
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      y ≠ z →
      LandauAddition model x y ≠ LandauAddition model x z := by
  sorry
/--
`LandauOrderCasesByAddition` Landau Chapter I, Theorem 9.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), Or (x = y) (Or (Exists fun u => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model y u = x) (Exists fun v => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x v = y))

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    Or (x = y) (Or (Exists fun u => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y u = x) (Exists fun v => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x v = y))

Logical form (Lean):

```lean
theorem LandauOrderCasesByAddition
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      x = y ∨
      (∃ u : Element, LandauAddition model y u = x) ∨
      ∃ v : Element, LandauAddition model x v = y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, use

-/
theorem LandauOrderCasesByAddition
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      x = y ∨
      (∃ u : Element, LandauAddition model y u = x) ∨
      ∃ v : Element, LandauAddition model x v = y := by
  sorry
/--
`LandauGreaterThanImpliesReverseLessThan` Landau Chapter I, Theorem 11.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model x y → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model y x

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x) → Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x

Logical form (Lean):

```lean
theorem LandauGreaterThanImpliesReverseLessThan
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauGreaterThan model x y →
      LandauLessThan model y x
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
theorem LandauGreaterThanImpliesReverseLessThan
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauGreaterThan model x y →
      LandauLessThan model y x := by
  sorry
/--
`LandauLessThanImpliesReverseGreaterThan` Landau Chapter I, Theorem 12.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model x y → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model y x

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y) → Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y

Logical form (Lean):

```lean
theorem LandauLessThanImpliesReverseGreaterThan
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauLessThan model x y →
      LandauGreaterThan model y x
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
theorem LandauLessThanImpliesReverseGreaterThan
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauLessThan model x y →
      LandauGreaterThan model y x := by
  sorry
/--
`LandauEqualityImpliesLandauLessThanOrEqual` Landau Chapter I, Theorem 13.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), x = y → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThanOrEqual model y x

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    x = y → Or (y = x) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x)

Logical form (Lean):

```lean
theorem LandauEqualityImpliesLandauLessThanOrEqual
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      x = y →
      LandauLessThanOrEqual model y x
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
theorem LandauEqualityImpliesLandauLessThanOrEqual
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      x = y →
      LandauLessThanOrEqual model y x := by
  sorry
/--
`LandauEqualityImpliesLandauGreaterThanOrEqual` Landau Chapter I, Theorem 14.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), x = y → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model y x

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    x = y → Or (x = y) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y)

Logical form (Lean):

```lean
theorem LandauEqualityImpliesLandauGreaterThanOrEqual
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      x = y →
      LandauGreaterThanOrEqual model y x
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
theorem LandauEqualityImpliesLandauGreaterThanOrEqual
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      x = y →
      LandauGreaterThanOrEqual model y x := by
  sorry
/--
`LandauLessThanMixedTransitivity` Landau Chapter I, Theorem 16, covering both mixed strict/non-strict transitivity directions.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), ((∀ (x y z : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model x y → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThanOrEqual model y z → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model x z) ∧ (∀ (x y z : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThanOrEqual model x y → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model y z → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model x z))

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    ((∀ (x y z : Element), (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y) → Or (y = z) (Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z_1 = z) → Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z_1 = z) ∧ (∀ (x y z : Element), Or (x = y) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y) → (Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z_1 = z) → Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z_1 = z))

Logical form (Lean):

```lean
theorem LandauLessThanMixedTransitivity
    (model : PeanoSystem Element SetObject) :
    (∀ x y z : Element,
      LandauLessThan model x y →
      LandauLessThanOrEqual model y z →
      LandauLessThan model x z) ∧
    (∀ x y z : Element,
      LandauLessThanOrEqual model x y →
      LandauLessThan model y z →
      LandauLessThan model x z)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem LandauLessThanMixedTransitivity
    (model : PeanoSystem Element SetObject) :
    (∀ x y z : Element,
      LandauLessThan model x y →
      LandauLessThanOrEqual model y z →
      LandauLessThan model x z) ∧
    (∀ x y z : Element,
      LandauLessThanOrEqual model x y →
      LandauLessThan model y z →
      LandauLessThan model x z) := by
  sorry
/--
`LandauLessThanOrEqualTransitive` Landau Chapter I, Theorem 17.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y z : Element), (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThanOrEqual model x y ∧ LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThanOrEqual model y z) → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThanOrEqual model x z

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    (Or (x = y) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y) ∧ Or (y = z) (Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z_1 = z)) → Or (x = z) (Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z_1 = z)

Logical form (Lean):

```lean
theorem LandauLessThanOrEqualTransitive
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      LandauLessThanOrEqual model x y →
      LandauLessThanOrEqual model y z →
      LandauLessThanOrEqual model x z
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
theorem LandauLessThanOrEqualTransitive
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      LandauLessThanOrEqual model x y →
      LandauLessThanOrEqual model y z →
      LandauLessThanOrEqual model x z := by
  sorry
/--
`LandauAdditionCreatesGreaterElement` Landau Chapter I, Theorem 18.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x y) x

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x y

Logical form (Lean):

```lean
theorem LandauAdditionCreatesGreaterElement
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauGreaterThan model (LandauAddition model x y) x
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
theorem LandauAdditionCreatesGreaterElement
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauGreaterThan model (LandauAddition model x y) x := by
  sorry
/--
`LandauAdditionStrictMonotoneInBothArguments` Landau Chapter I, Theorem 21.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y z u : Element), (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model x y ∧ LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model z u) → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x z) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model y u)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x ∧ Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 u z_1 = z) → Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 (Classical.choose ⋯ y u) z_1 = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z

Logical form (Lean):

```lean
theorem LandauAdditionStrictMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    ∀ x y z u : Element,
      LandauGreaterThan model x y →
      LandauGreaterThan model z u →
      LandauGreaterThan model
        (LandauAddition model x z)
        (LandauAddition model y u)
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
theorem LandauAdditionStrictMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    ∀ x y z u : Element,
      LandauGreaterThan model x y →
      LandauGreaterThan model z u →
      LandauGreaterThan model
        (LandauAddition model x z)
        (LandauAddition model y u) := by
  sorry
/--
`LandauAdditionMixedMonotoneInBothArguments` Landau Chapter I, Theorem 22, covering both mixed strict/non-strict addition monotonicity directions.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), ((∀ (x y z u : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model x y → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model z u → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x z) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model y u)) ∧ (∀ (x y z u : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model x y → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model z u → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x z) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model y u)))

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    ((∀ (x y z u : Element), (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x) → Or (u = z) (Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 u z_1 = z) → Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 (Classical.choose ⋯ y u) z_1 = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z) ∧ (∀ (x y z u : Element), Or (y = x) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x) → (Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 u z_1 = z) → Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 (Classical.choose ⋯ y u) z_1 = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z))

Logical form (Lean):

```lean
theorem LandauAdditionMixedMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    (∀ x y z u : Element,
      LandauGreaterThan model x y →
      LandauGreaterThanOrEqual model z u →
      LandauGreaterThan model
        (LandauAddition model x z)
        (LandauAddition model y u)) ∧
    (∀ x y z u : Element,
      LandauGreaterThanOrEqual model x y →
      LandauGreaterThan model z u →
      LandauGreaterThan model
        (LandauAddition model x z)
        (LandauAddition model y u))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem LandauAdditionMixedMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    (∀ x y z u : Element,
      LandauGreaterThan model x y →
      LandauGreaterThanOrEqual model z u →
      LandauGreaterThan model
        (LandauAddition model x z)
        (LandauAddition model y u)) ∧
    (∀ x y z u : Element,
      LandauGreaterThanOrEqual model x y →
      LandauGreaterThan model z u →
      LandauGreaterThan model
        (LandauAddition model x z)
        (LandauAddition model y u)) := by
  sorry
/--
`LandauAdditionNonstrictMonotoneInBothArguments` Landau Chapter I, Theorem 23.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y z u : Element), (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model x y ∧ LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model z u) → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x z) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model y u)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    (Or (y = x) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x) ∧ Or (u = z) (Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 u z_1 = z)) → Or ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y u = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z) (Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model y u) z_1 = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z)

Logical form (Lean):

```lean
theorem LandauAdditionNonstrictMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    ∀ x y z u : Element,
      LandauGreaterThanOrEqual model x y →
      LandauGreaterThanOrEqual model z u →
      LandauGreaterThanOrEqual model
        (LandauAddition model x z)
        (LandauAddition model y u)
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
theorem LandauAdditionNonstrictMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    ∀ x y z u : Element,
      LandauGreaterThanOrEqual model x y →
      LandauGreaterThanOrEqual model z u →
      LandauGreaterThanOrEqual model
        (LandauAddition model x z)
        (LandauAddition model y u) := by
  sorry
/--
`LandauEveryElementIsAtLeastOne` Landau Chapter I, Theorem 24.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model x model.base

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    Or (model.1 = x) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 model.base z = x)

Logical form (Lean):

```lean
theorem LandauEveryElementIsAtLeastOne
    (model : PeanoSystem Element SetObject) :
    ∀ x : Element,
      LandauGreaterThanOrEqual model x model.base
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
theorem LandauEveryElementIsAtLeastOne
    (model : PeanoSystem Element SetObject) :
    ∀ x : Element,
      LandauGreaterThanOrEqual model x model.base := by
  sorry
/--
`LandauStrictSuccessorLowerBound` Landau Chapter I, Theorem 25.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model y x → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model y (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x model.base)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y) → Or ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x model.1 = y) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x model.base) z = y)

Logical form (Lean):

```lean
theorem LandauStrictSuccessorLowerBound
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauGreaterThan model y x →
      LandauGreaterThanOrEqual model
        y
        (LandauAddition model x model.base)
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
theorem LandauStrictSuccessorLowerBound
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauGreaterThan model y x →
      LandauGreaterThanOrEqual model
        y
        (LandauAddition model x model.base) := by
  sorry
/--
`LandauSuccessorUpperBound` Landau Chapter I, Theorem 26.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model y (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model x model.base) → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThanOrEqual model y x

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x model.1) → Or (y = x) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x)

Logical form (Lean):

```lean
theorem LandauSuccessorUpperBound
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauLessThan model y (LandauAddition model x model.base) →
      LandauLessThanOrEqual model y x
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
theorem LandauSuccessorUpperBound
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauLessThan model y (LandauAddition model x model.base) →
      LandauLessThanOrEqual model y x := by
  sorry
/--
`LandauMultiplicationStrictMonotoneInBothArguments` Landau Chapter I, Theorem 34.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y z u : Element), (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model x y ∧ LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model z u) → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model x z) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model y u)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x ∧ Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 u z_1 = z) → Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 (Classical.choose ⋯ y u) z_1 = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 x z

Logical form (Lean):

```lean
theorem LandauMultiplicationStrictMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    ∀ x y z u : Element,
      LandauGreaterThan model x y →
      LandauGreaterThan model z u →
      LandauGreaterThan model
        (LandauMultiplication model x z)
        (LandauMultiplication model y u)
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
theorem LandauMultiplicationStrictMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    ∀ x y z u : Element,
      LandauGreaterThan model x y →
      LandauGreaterThan model z u →
      LandauGreaterThan model
        (LandauMultiplication model x z)
        (LandauMultiplication model y u) := by
  sorry
/--
`LandauMultiplicationMixedMonotoneInBothArguments` Landau Chapter I, Theorem 35, covering both mixed strict/non-strict multiplication monotonicity directions.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), ((∀ (x y z u : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model x y → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model z u → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model x z) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model y u)) ∧ (∀ (x y z u : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model x y → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model z u → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThan model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model x z) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model y u)))

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    ((∀ (x y z u : Element), (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x) → Or (u = z) (Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 u z_1 = z) → Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 (Classical.choose ⋯ y u) z_1 = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 x z) ∧ (∀ (x y z u : Element), Or (y = x) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x) → (Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 u z_1 = z) → Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 (Classical.choose ⋯ y u) z_1 = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 x z))

Logical form (Lean):

```lean
theorem LandauMultiplicationMixedMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    (∀ x y z u : Element,
      LandauGreaterThan model x y →
      LandauGreaterThanOrEqual model z u →
      LandauGreaterThan model
        (LandauMultiplication model x z)
        (LandauMultiplication model y u)) ∧
    (∀ x y z u : Element,
      LandauGreaterThanOrEqual model x y →
      LandauGreaterThan model z u →
      LandauGreaterThan model
        (LandauMultiplication model x z)
        (LandauMultiplication model y u))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem LandauMultiplicationMixedMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    (∀ x y z u : Element,
      LandauGreaterThan model x y →
      LandauGreaterThanOrEqual model z u →
      LandauGreaterThan model
        (LandauMultiplication model x z)
        (LandauMultiplication model y u)) ∧
    (∀ x y z u : Element,
      LandauGreaterThanOrEqual model x y →
      LandauGreaterThan model z u →
      LandauGreaterThan model
        (LandauMultiplication model x z)
        (LandauMultiplication model y u)) := by
  sorry
/--
`LandauMultiplicationNonstrictMonotoneInBothArguments` Landau Chapter I, Theorem 36.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y z u : Element), (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model x y ∧ LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model z u) → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauGreaterThanOrEqual model (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model x z) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model y u)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    (Or (y = x) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x) ∧ Or (u = z) (Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 u z_1 = z)) → Or ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 y u = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 x z) (Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model y u) z_1 = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 x z)

Logical form (Lean):

```lean
theorem LandauMultiplicationNonstrictMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    ∀ x y z u : Element,
      LandauGreaterThanOrEqual model x y →
      LandauGreaterThanOrEqual model z u →
      LandauGreaterThanOrEqual model
        (LandauMultiplication model x z)
        (LandauMultiplication model y u)
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
theorem LandauMultiplicationNonstrictMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    ∀ x y z u : Element,
      LandauGreaterThanOrEqual model x y →
      LandauGreaterThanOrEqual model z u →
      LandauGreaterThanOrEqual model
        (LandauMultiplication model x z)
        (LandauMultiplication model y u) := by
  sorry
/--
`LandauWellOrdering` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (subset : Element → Prop), (Exists fun value => subset value) → Exists fun least => (subset least ∧ (∀ (value : Element), subset value → Or (least = value) (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauLessThan model least value)))

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
    subset : Element → Prop
  Prove
    (Exists fun value => subset value) → Exists fun least => (subset least ∧ (∀ (value : Element), subset value → Or (least = value) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 least z = value)))

Logical form (Lean):

```lean
theorem LandauWellOrdering
    (model : PeanoSystem Element SetObject)
    (subset : Element → Prop)
    (nonempty : ∃ value, subset value) :
    ∃ least,
      subset least ∧
      ∀ value, subset value →
        least = value ∨ LandauLessThan model least value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, Or.inl, Or.inr, use

-/
theorem LandauWellOrdering
    (model : PeanoSystem Element SetObject)
    (subset : Element → Prop)
    (nonempty : ∃ value, subset value) :
    ∃ least,
      subset least ∧
      ∀ value, subset value →
        least = value ∨ LandauLessThan model least value := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
