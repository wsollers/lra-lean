import LRA.Operation
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.WellFoundedness
import LRA.NumberSystems.PeanoSystem.Recursion.BinaryIterator

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.NumberSystems.PeanoSystem
open LRA.NumberSystems.PeanoSystem.Recursion

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`LandauAddition` TODO

Predicate logic:

  noncomputable def LandauAddition
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value))

Predicate logic (unfolded):

  noncomputable def LandauAddition
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def LandauAddition
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value))
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
noncomputable def LandauAddition
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value))

/--
`LandauAdditionClauses` TODO

Predicate logic:

  BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) (fun _ value => model.successor value) (LandauAddition model)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (parameterValue : Element), ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 parameterValue model.1 = (fun left => model.2 left) parameterValue ∧ ∀ (element : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 parameterValue (model.2 element) = (fun x value => model.2 value) parameterValue ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 parameterValue element))

Logical form (Lean):

```lean
theorem LandauAdditionClauses
    (model : PeanoSystem Element SetObject) :
    BinaryIteratorOperationClauses
      model
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value)
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
theorem LandauAdditionClauses
    (model : PeanoSystem Element SetObject) :
    BinaryIteratorOperationClauses
      model
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value)
      (LandauAddition model) := by
  sorry
/--
`LandauAdditionWellDefined` TODO

Predicate logic:

  exists addition : Element -> Element -> Element, BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) (fun _ value => model.successor value) addition ∧ forall otherAddition : Element -> Element -> Element, BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) (fun _ value => model.successor value) otherAddition -> otherAddition = addition

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), Exists fun addition => (∀ (parameterValue : Element), (addition parameterValue model.1 = (fun left => model.2 left) parameterValue ∧ ∀ (element : Element), addition parameterValue (model.2 element) = (fun x value => model.2 value) parameterValue (addition parameterValue element)) ∧ ∀ (otherAddition : Element → Element → Element), (∀ (parameterValue : Element), (otherAddition parameterValue model.1 = (fun left => model.2 left) parameterValue ∧ ∀ (element : Element), otherAddition parameterValue (model.2 element) = (fun x value => model.2 value) parameterValue (otherAddition parameterValue element))) → otherAddition = addition)

Logical form (Lean):

```lean
theorem LandauAdditionWellDefined
    (model : PeanoSystem Element SetObject) :
    exists addition : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model
        Element
        Element
        (fun left => model.successor left)
        (fun _ value => model.successor value)
        addition /\
      forall otherAddition : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model
          Element
          Element
          (fun left => model.successor left)
          (fun _ value => model.successor value)
          otherAddition ->
        otherAddition = addition
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
theorem LandauAdditionWellDefined
    (model : PeanoSystem Element SetObject) :
    exists addition : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model
        Element
        Element
        (fun left => model.successor left)
        (fun _ value => model.successor value)
        addition /\
      forall otherAddition : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model
          Element
          Element
          (fun left => model.successor left)
          (fun _ value => model.successor value)
          otherAddition ->
        otherAddition = addition := by
  sorry
/--
`LandauAdditionWithOne` TODO

Predicate logic:

  (∀ x ∈ Element), LandauAddition model x model.base = model.successor x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (left : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 left model.1 = model.2 left

Logical form (Lean):

```lean
theorem LandauAdditionWithOne
    (model : PeanoSystem Element SetObject)
    (left : Element) :
    LandauAddition model left model.base = model.successor left
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
theorem LandauAdditionWithOne
    (model : PeanoSystem Element SetObject)
    (left : Element) :
    LandauAddition model left model.base = model.successor left := by
  sorry
/--
`LandauAdditionSuccessorOnRight` TODO

Predicate logic:

  (∀ x y ∈ Element), LandauAddition model x (model.successor y) = model.successor (LandauAddition model x y)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (left right : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 left (model.2 right) = model.2 ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 left right)

Logical form (Lean):

```lean
theorem LandauAdditionSuccessorOnRight
    (model : PeanoSystem Element SetObject)
    (left right : Element) :
    LandauAddition model left (model.successor right) =
      model.successor (LandauAddition model left right)
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
theorem LandauAdditionSuccessorOnRight
    (model : PeanoSystem Element SetObject)
    (left right : Element) :
    LandauAddition model left (model.successor right) =
      model.successor (LandauAddition model left right) := by
  sorry
/--
`LandauAdditionIsAssociative` TODO

Predicate logic:

  LRA.Operation.Laws.Associative.Associative (LandauAddition model)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (first second third : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).val first second) third = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 first ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).val second third)

Logical form (Lean):

```lean
theorem LandauAdditionIsAssociative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Associative.Associative (LandauAddition model)
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
theorem LandauAdditionIsAssociative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Associative.Associative (LandauAddition model) := by
  sorry
/--
`LandauAdditionIsCommutative` TODO

Predicate logic:

  LRA.Operation.Laws.Commutative.Commutative (LandauAddition model)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (first second : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 first second = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => model.successor left) fun x value => model.successor value) ⋯).1 second first

Logical form (Lean):

```lean
theorem LandauAdditionIsCommutative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative (LandauAddition model)
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
theorem LandauAdditionIsCommutative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative (LandauAddition model) := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
