import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Addition

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.NumberSystems.PeanoSystem
open LRA.NumberSystems.PeanoSystem.Recursion

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`LandauMultiplication` TODO

Predicate logic:

  noncomputable def LandauMultiplication
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => left)
      (fun left value => LandauAddition model value left))

Predicate logic (unfolded):

  noncomputable def LandauMultiplication
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => left)
      (fun left value => LandauAddition model value left)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def LandauMultiplication
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => left)
      (fun left value => LandauAddition model value left))
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
noncomputable def LandauMultiplication
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => left)
      (fun left value => LandauAddition model value left))

/--
`LandauMultiplicationClauses` TODO

Predicate logic:

  BinaryIteratorOperationClauses model Element Element (fun left => left) (fun left value => LandauAddition model value left) (LandauMultiplication model)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (parameterValue : Element), ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 parameterValue model.1 = (fun left => left) parameterValue ∧ ∀ (element : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 parameterValue (model.2 element) = (fun left value => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 value left) parameterValue ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 parameterValue element))

Logical form (Lean):

```lean
theorem LandauMultiplicationClauses
    (model : PeanoSystem Element SetObject) :
    BinaryIteratorOperationClauses
      model
      Element
      Element
      (fun left => left)
      (fun left value => LandauAddition model value left)
      (LandauMultiplication model)
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
theorem LandauMultiplicationClauses
    (model : PeanoSystem Element SetObject) :
    BinaryIteratorOperationClauses
      model
      Element
      Element
      (fun left => left)
      (fun left value => LandauAddition model value left)
      (LandauMultiplication model) := by
  sorry

/--
`LandauMultiplicationWellDefined` TODO

Predicate logic:

  exists multiplication : Element -> Element -> Element, BinaryIteratorOperationClauses model Element Element (fun left => left) (fun left value => LandauAddition model value left) multiplication ∧ forall otherMultiplication : Element -> Element -> Element, BinaryIteratorOperationClauses model Element Element (fun left => left) (fun left value => LandauAddition model value left) otherMultiplication -> otherMultiplication = multiplication

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), Exists fun multiplication => (∀ (parameterValue : Element), (multiplication parameterValue model.1 = (fun left => left) parameterValue ∧ ∀ (element : Element), multiplication parameterValue (model.2 element) = (fun left value => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 value left) parameterValue (multiplication parameterValue element)) ∧ ∀ (otherMultiplication : Element → Element → Element), (∀ (parameterValue : Element), (otherMultiplication parameterValue model.1 = (fun left => left) parameterValue ∧ ∀ (element : Element), otherMultiplication parameterValue (model.2 element) = (fun left value => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 value left) parameterValue (otherMultiplication parameterValue element))) → otherMultiplication = multiplication)

Logical form (Lean):

```lean
theorem LandauMultiplicationWellDefined
    (model : PeanoSystem Element SetObject) :
    exists multiplication : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model
        Element
        Element
        (fun left => left)
        (fun left value => LandauAddition model value left)
        multiplication /\
      forall otherMultiplication : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model
          Element
          Element
          (fun left => left)
          (fun left value => LandauAddition model value left)
          otherMultiplication ->
        otherMultiplication = multiplication
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem LandauMultiplicationWellDefined
    (model : PeanoSystem Element SetObject) :
    exists multiplication : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model
        Element
        Element
        (fun left => left)
        (fun left value => LandauAddition model value left)
        multiplication /\
      forall otherMultiplication : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model
          Element
          Element
          (fun left => left)
          (fun left value => LandauAddition model value left)
          otherMultiplication ->
        otherMultiplication = multiplication := by
  sorry

/--
`LandauMultiplicationWithOne` TODO

Predicate logic:

  (∀ x ∈ Element), LandauMultiplication model x model.base = x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (left : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 left model.1 = left

Logical form (Lean):

```lean
theorem LandauMultiplicationWithOne
    (model : PeanoSystem Element SetObject)
    (left : Element) :
    LandauMultiplication model left model.base = left
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
theorem LandauMultiplicationWithOne
    (model : PeanoSystem Element SetObject)
    (left : Element) :
    LandauMultiplication model left model.base = left := by
  sorry

/--
`LandauMultiplicationSuccessorOnRight` TODO

Predicate logic:

  (∀ x y ∈ Element), LandauMultiplication model x (model.successor y) = LandauAddition model (LandauMultiplication model x y) x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (left right : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 left (model.2 right) = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 left right) left

Logical form (Lean):

```lean
theorem LandauMultiplicationSuccessorOnRight
    (model : PeanoSystem Element SetObject)
    (left right : Element) :
    LandauMultiplication model left (model.successor right) =
      LandauAddition model (LandauMultiplication model left right) left
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
theorem LandauMultiplicationSuccessorOnRight
    (model : PeanoSystem Element SetObject)
    (left right : Element) :
    LandauMultiplication model left (model.successor right) =
      LandauAddition model (LandauMultiplication model left right) left := by
  sorry

/--
`LandauMultiplicationDistributesOverAddition` TODO

Predicate logic:

  LRA.Operation.Laws.Distributive.RightDistributive (LandauMultiplication model) (LandauAddition model)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (left right third : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).val left right) third = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).val left third) ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).val right third)

Logical form (Lean):

```lean
theorem LandauMultiplicationDistributesOverAddition
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Distributive.RightDistributive
      (LandauMultiplication model)
      (LandauAddition model)
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
theorem LandauMultiplicationDistributesOverAddition
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Distributive.RightDistributive
      (LandauMultiplication model)
      (LandauAddition model) := by
  sorry

/--
`LandauLeftDistributivityOfMultiplicationOverAddition` TODO

Predicate logic:

  LRA.Operation.Laws.Distributive.LeftDistributive (LandauMultiplication model) (LandauAddition model)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (left right third : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 left ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).val right third) = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).val left right) ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).val left third)

Logical form (Lean):

```lean
theorem LandauLeftDistributivityOfMultiplicationOverAddition
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (LandauMultiplication model)
      (LandauAddition model)
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
theorem LandauLeftDistributivityOfMultiplicationOverAddition
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (LandauMultiplication model)
      (LandauAddition model) := by
  sorry

/--
`LandauMultiplicationDistributesOverAdditionBothSides` TODO

Predicate logic:

  LRA.Operation.Laws.Distributive.TwoSidedDistributive (LandauMultiplication model) (LandauAddition model)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), (∀ (left right third : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 left (Classical.choose ⋯ right third) = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 (Classical.choose ⋯ left right) (Classical.choose ⋯ left third) ∧ ∀ (left right third : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 (Classical.choose ⋯ left right) third = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 (Classical.choose ⋯ left third) (Classical.choose ⋯ right third))

Logical form (Lean):

```lean
theorem LandauMultiplicationDistributesOverAdditionBothSides
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Distributive.TwoSidedDistributive
      (LandauMultiplication model)
      (LandauAddition model)
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
theorem LandauMultiplicationDistributesOverAdditionBothSides
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Distributive.TwoSidedDistributive
      (LandauMultiplication model)
      (LandauAddition model) := by
  sorry

/--
`LandauMultiplicationIsAssociative` TODO

Predicate logic:

  LRA.Operation.Laws.Associative.Associative (LandauMultiplication model)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (first second third : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).val first second) third = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 first ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).val second third)

Logical form (Lean):

```lean
theorem LandauMultiplicationIsAssociative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Associative.Associative (LandauMultiplication model)
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
theorem LandauMultiplicationIsAssociative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Associative.Associative (LandauMultiplication model) := by
  sorry

/--
`LandauMultiplicationIsCommutative` TODO

Predicate logic:

  LRA.Operation.Laws.Commutative.Commutative (LandauMultiplication model)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (first second : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 first second = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 second first

Logical form (Lean):

```lean
theorem LandauMultiplicationIsCommutative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative (LandauMultiplication model)
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
theorem LandauMultiplicationIsCommutative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative (LandauMultiplication model) := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
