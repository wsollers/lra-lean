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

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
