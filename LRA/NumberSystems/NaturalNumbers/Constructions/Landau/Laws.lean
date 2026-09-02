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

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y

Logical form (Lean):

```lean
def LandauLessThan
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  ∃ z : Element, LandauAddition model x z = y

/-- Landau's `>` relation is the converse of `LandauLessThan`. -/
def LandauGreaterThan
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  LandauLessThan model y x

/-- Landau's non-strict order packages equality-or-strictness directly on the
one-based natural-number surface. -/
def LandauLessThanOrEqual
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  x = y ∨ LandauLessThan model x y

/-- Landau's `≥` is the converse of `LandauLessThanOrEqual`. -/
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

Related proof moves: use, rcases, unfold

-/
def LandauLessThan
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  ∃ z : Element, LandauAddition model x z = y

/-- Landau's `>` relation is the converse of `LandauLessThan`. -/
def LandauGreaterThan
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  LandauLessThan model y x

/-- Landau's non-strict order packages equality-or-strictness directly on the
one-based natural-number surface. -/
def LandauLessThanOrEqual
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  x = y ∨ LandauLessThan model x y

/-- Landau's `≥` is the converse of `LandauLessThanOrEqual`. -/
def LandauGreaterThanOrEqual
    (model : PeanoSystem Element SetObject) (x y : Element) : Prop :=
  LandauLessThanOrEqual model y x

/--
`LandauLessThanTrichotomous` TODO

Predicate logic:

  ∀ x y : Element, LandauLessThan model x y ∨ x = y ∨ LandauLessThan model y x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y : Element), Or (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y) (Or (x = y) (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z = x))

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

  ∀ x y z : Element, LandauLessThan model x y → LandauLessThan model y z → LandauLessThan model x z

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y z : Element), (Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y ∧ Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z_1 = z) → Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z_1 = z

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

  ∀ x y z : Element, LandauLessThan model x y ↔ LandauLessThan model (LandauAddition model x z) (LandauAddition model y z)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y z : Element), Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y ↔ Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).val x z) z_1 = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 y z

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

  ∀ x y z : Element, LandauLessThan model x y ↔ LandauLessThan model (LandauMultiplication model x z) (LandauMultiplication model y z)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (x y z : Element), Exists fun z => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 x z = y ↔ Exists fun z_1 => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).val x z) z_1 = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 y z

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
/-- Landau Chapter I, Theorem 7. -/
theorem LandauAdditionDoesNotCollapseOnRight
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element, LandauAddition model y x ≠ x := by
  sorry
/-- Landau Chapter I, Theorem 8. -/
theorem LandauAdditionLeftCancellation
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      y ≠ z →
      LandauAddition model x y ≠ LandauAddition model x z := by
  sorry
/-- Landau Chapter I, Theorem 9. -/
theorem LandauOrderCasesByAddition
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      x = y ∨
      (∃ u : Element, LandauAddition model y u = x) ∨
      ∃ v : Element, LandauAddition model x v = y := by
  sorry
/-- Landau Chapter I, Theorem 11. -/
theorem LandauGreaterThanImpliesReverseLessThan
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauGreaterThan model x y →
      LandauLessThan model y x := by
  sorry
/-- Landau Chapter I, Theorem 12. -/
theorem LandauLessThanImpliesReverseGreaterThan
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauLessThan model x y →
      LandauGreaterThan model y x := by
  sorry
/-- Landau Chapter I, Theorem 13. -/
theorem LandauEqualityImpliesLandauLessThanOrEqual
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      x = y →
      LandauLessThanOrEqual model y x := by
  sorry
/-- Landau Chapter I, Theorem 14. -/
theorem LandauEqualityImpliesLandauGreaterThanOrEqual
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      x = y →
      LandauGreaterThanOrEqual model y x := by
  sorry
/-- Landau Chapter I, Theorem 16, covering both mixed strict/non-strict
transitivity directions. -/
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
/-- Landau Chapter I, Theorem 17. -/
theorem LandauLessThanOrEqualTransitive
    (model : PeanoSystem Element SetObject) :
    ∀ x y z : Element,
      LandauLessThanOrEqual model x y →
      LandauLessThanOrEqual model y z →
      LandauLessThanOrEqual model x z := by
  sorry
/-- Landau Chapter I, Theorem 18. -/
theorem LandauAdditionCreatesGreaterElement
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauGreaterThan model (LandauAddition model x y) x := by
  sorry
/-- Landau Chapter I, Theorem 21. -/
theorem LandauAdditionStrictMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    ∀ x y z u : Element,
      LandauGreaterThan model x y →
      LandauGreaterThan model z u →
      LandauGreaterThan model
        (LandauAddition model x z)
        (LandauAddition model y u) := by
  sorry
/-- Landau Chapter I, Theorem 22, covering both mixed strict/non-strict
addition monotonicity directions. -/
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
/-- Landau Chapter I, Theorem 23. -/
theorem LandauAdditionNonstrictMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    ∀ x y z u : Element,
      LandauGreaterThanOrEqual model x y →
      LandauGreaterThanOrEqual model z u →
      LandauGreaterThanOrEqual model
        (LandauAddition model x z)
        (LandauAddition model y u) := by
  sorry
/-- Landau Chapter I, Theorem 24. -/
theorem LandauEveryElementIsAtLeastOne
    (model : PeanoSystem Element SetObject) :
    ∀ x : Element,
      LandauGreaterThanOrEqual model x model.base := by
  sorry
/-- Landau Chapter I, Theorem 25. -/
theorem LandauStrictSuccessorLowerBound
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauGreaterThan model y x →
      LandauGreaterThanOrEqual model
        y
        (LandauAddition model x model.base) := by
  sorry
/-- Landau Chapter I, Theorem 26. -/
theorem LandauSuccessorUpperBound
    (model : PeanoSystem Element SetObject) :
    ∀ x y : Element,
      LandauLessThan model y (LandauAddition model x model.base) →
      LandauLessThanOrEqual model y x := by
  sorry
/-- Landau Chapter I, Theorem 34. -/
theorem LandauMultiplicationStrictMonotoneInBothArguments
    (model : PeanoSystem Element SetObject) :
    ∀ x y z u : Element,
      LandauGreaterThan model x y →
      LandauGreaterThan model z u →
      LandauGreaterThan model
        (LandauMultiplication model x z)
        (LandauMultiplication model y u) := by
  sorry
/-- Landau Chapter I, Theorem 35, covering both mixed strict/non-strict
multiplication monotonicity directions. -/
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
/-- Landau Chapter I, Theorem 36. -/
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

  ∀ subset : Element → Prop, (∃ value, subset value) →
    ∃ least, subset least ∧ ∀ value, subset value →
      least = value ∨ LandauLessThan model least value

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

Related proof moves: intro, rcases, use, constructor, Or.inl, Or.inr

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
