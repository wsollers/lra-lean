import LRA.Operation
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.WellFoundedness
import LRA.NumberSystems.PeanoSystem.Recursion.BinaryIterator

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.NumberSystems.PeanoSystem.Recursion

universe u v
variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`PresburgerAddition` TODO

Predicate logic:

  noncomputable def PresburgerAddition
      (model : PresburgerModel Element SetObject) :
      Element -> Element -> Element :=
    Classical.choose
      (ExistenceOfBinaryIteratorOperation
        model.toPeanoSystem
        Element
        Element
        (fun left => left)
        (fun _ value => model.successor value))

Predicate logic (unfolded):

  noncomputable def PresburgerAddition
      (model : PresburgerModel Element SetObject) :
      Element -> Element -> Element :=
    Classical.choose
      (ExistenceOfBinaryIteratorOperation
        model.toPeanoSystem
        Element
        Element
        (fun left => left)
        (fun _ value => model.successor value)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def PresburgerAddition
    (model : PresburgerModel Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
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
noncomputable def PresburgerAddition
    (model : PresburgerModel Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun _ value => model.successor value))

/--
`PresburgerAdditionClauses` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject), LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) (fun x value => model.successor value) (LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition model)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PresburgerModel Element SetObject
  Prove
    ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) fun x value => model.successor value) ⋯).1 parameterValue model.toPeanoSystem.1 = (fun left => left) parameterValue ∧ (∀ (element : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) fun x value => model.successor value) ⋯).1 parameterValue (model.toPeanoSystem.2 element) = (fun x value => model.2 value) parameterValue ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) fun x value => model.successor value) ⋯).1 parameterValue element)))

Logical form (Lean):

```lean
theorem PresburgerAdditionClauses
    (model : PresburgerModel Element SetObject) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun _ value => model.successor value)
      (PresburgerAddition model)
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
theorem PresburgerAdditionClauses
    (model : PresburgerModel Element SetObject) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun _ value => model.successor value)
      (PresburgerAddition model) := by
  sorry
/--
`PresburgerAdditionWellDefined` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject), Exists fun addition => (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) (fun x value => model.successor value) addition ∧ (∀ (otherAddition : Element → Element → Element), LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) (fun x value => model.successor value) otherAddition → otherAddition = addition))

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PresburgerModel Element SetObject
  Prove
    Exists fun addition => ((∀ (parameterValue : Element), (addition parameterValue model.toPeanoSystem.1 = (fun left => left) parameterValue ∧ (∀ (element : Element), addition parameterValue (model.toPeanoSystem.2 element) = (fun x value => model.2 value) parameterValue (addition parameterValue element)))) ∧ (∀ (otherAddition : Element → Element → Element), (∀ (parameterValue : Element), (otherAddition parameterValue model.toPeanoSystem.1 = (fun left => left) parameterValue ∧ (∀ (element : Element), otherAddition parameterValue (model.toPeanoSystem.2 element) = (fun x value => model.2 value) parameterValue (otherAddition parameterValue element)))) → otherAddition = addition))

Logical form (Lean):

```lean
theorem PresburgerAdditionWellDefined
    (model : PresburgerModel Element SetObject) :
    exists addition : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        Element
        Element
        (fun left => left)
        (fun _ value => model.successor value)
        addition /\
      forall otherAddition : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          Element
          Element
          (fun left => left)
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
theorem PresburgerAdditionWellDefined
    (model : PresburgerModel Element SetObject) :
    exists addition : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        Element
        Element
        (fun left => left)
        (fun _ value => model.successor value)
        addition /\
      forall otherAddition : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          Element
          Element
          (fun left => left)
          (fun _ value => model.successor value)
          otherAddition ->
        otherAddition = addition := by
  sorry
/--
`PresburgerAdditionWithZero` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject) (left : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition model left model.zero = left

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PresburgerModel Element SetObject
    left : Element
  Prove
    (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) fun x value => model.successor value) ⋯).1 left model.1 = left

Logical form (Lean):

```lean
theorem PresburgerAdditionWithZero
    (model : PresburgerModel Element SetObject)
    (left : Element) :
    PresburgerAddition model left model.zero = left
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
theorem PresburgerAdditionWithZero
    (model : PresburgerModel Element SetObject)
    (left : Element) :
    PresburgerAddition model left model.zero = left := by
  sorry
/--
`PresburgerAdditionSuccessorOnRight` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject) (left right : Element), LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition model left (model.successor right) = model.successor (LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition model left right)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PresburgerModel Element SetObject
    left right : Element
  Prove
    (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) fun x value => model.successor value) ⋯).1 left (model.2 right) = model.2 ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) fun x value => model.successor value) ⋯).1 left right)

Logical form (Lean):

```lean
theorem PresburgerAdditionSuccessorOnRight
    (model : PresburgerModel Element SetObject)
    (left right : Element) :
    PresburgerAddition model left (model.successor right) =
      model.successor (PresburgerAddition model left right)
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
theorem PresburgerAdditionSuccessorOnRight
    (model : PresburgerModel Element SetObject)
    (left right : Element) :
    PresburgerAddition model left (model.successor right) =
      model.successor (PresburgerAddition model left right) := by
  sorry
/--
`PresburgerAdditionIsAssociative` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject), LRA.Operation.Laws.Associative.Associative (LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition model)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PresburgerModel Element SetObject
  Prove
    (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) fun x value => model.successor value) ⋯).1 ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) fun x value => model.successor value) ⋯).val first second) third = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) fun x value => model.successor value) ⋯).1 first ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) fun x value => model.successor value) ⋯).val second third)

Logical form (Lean):

```lean
theorem PresburgerAdditionIsAssociative
    (model : PresburgerModel Element SetObject) :
    LRA.Operation.Laws.Associative.Associative
      (PresburgerAddition model)
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
theorem PresburgerAdditionIsAssociative
    (model : PresburgerModel Element SetObject) :
    LRA.Operation.Laws.Associative.Associative
      (PresburgerAddition model) := by
  sorry
/--
`PresburgerAdditionIsCommutative` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject), LRA.Operation.Laws.Commutative.Commutative (LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition model)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PresburgerModel Element SetObject
  Prove
    (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) fun x value => model.successor value) ⋯).1 first second = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model.toPeanoSystem Element Element (fun left => left) fun x value => model.successor value) ⋯).1 second first

Logical form (Lean):

```lean
theorem PresburgerAdditionIsCommutative
    (model : PresburgerModel Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative
      (PresburgerAddition model)
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
theorem PresburgerAdditionIsCommutative
    (model : PresburgerModel Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative
      (PresburgerAddition model) := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
