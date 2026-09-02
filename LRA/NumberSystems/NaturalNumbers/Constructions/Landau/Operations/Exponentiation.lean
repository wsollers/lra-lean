import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Multiplication

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.NumberSystems.PeanoSystem
open LRA.NumberSystems.PeanoSystem.Recursion

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`LandauExponentiation` TODO

Predicate logic:

  noncomputable def LandauExponentiation
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun base => base)
      (fun base value => LandauMultiplication model value base))

Predicate logic (unfolded):

  noncomputable def LandauExponentiation
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun base => base)
      (fun base value => LandauMultiplication model value base)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def LandauExponentiation
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun base => base)
      (fun base value => LandauMultiplication model value base))
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
noncomputable def LandauExponentiation
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun base => base)
      (fun base value => LandauMultiplication model value base))

/--
`LandauExponentiationClauses` TODO

Predicate logic:

  BinaryIteratorOperationClauses model Element Element (fun base => base) (fun base value => LandauMultiplication model value base) (LandauExponentiation model)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (parameterValue : Element), ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun base => base) fun base value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model value base) ⋯).1 parameterValue model.1 = (fun base => base) parameterValue ∧ ∀ (element : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun base => base) fun base value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model value base) ⋯).1 parameterValue (model.2 element) = (fun base value => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 value base) parameterValue ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun base => base) fun base value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model value base) ⋯).1 parameterValue element))

Logical form (Lean):

```lean
theorem LandauExponentiationClauses
    (model : PeanoSystem Element SetObject) :
    BinaryIteratorOperationClauses
      model
      Element
      Element
      (fun base => base)
      (fun base value => LandauMultiplication model value base)
      (LandauExponentiation model)
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
theorem LandauExponentiationClauses
    (model : PeanoSystem Element SetObject) :
    BinaryIteratorOperationClauses
      model
      Element
      Element
      (fun base => base)
      (fun base value => LandauMultiplication model value base)
      (LandauExponentiation model) := by
  sorry
/--
`LandauExponentiationWellDefined` TODO

Predicate logic:

  exists exponentiation : Element -> Element -> Element, BinaryIteratorOperationClauses model Element Element (fun base => base) (fun base value => LandauMultiplication model value base) exponentiation ∧ forall otherExponentiation : Element -> Element -> Element, BinaryIteratorOperationClauses model Element Element (fun base => base) (fun base value => LandauMultiplication model value base) otherExponentiation -> otherExponentiation = exponentiation

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), Exists fun exponentiation => (∀ (parameterValue : Element), (exponentiation parameterValue model.1 = (fun base => base) parameterValue ∧ ∀ (element : Element), exponentiation parameterValue (model.2 element) = (fun base value => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 value base) parameterValue (exponentiation parameterValue element)) ∧ ∀ (otherExponentiation : Element → Element → Element), (∀ (parameterValue : Element), (otherExponentiation parameterValue model.1 = (fun base => base) parameterValue ∧ ∀ (element : Element), otherExponentiation parameterValue (model.2 element) = (fun base value => (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 value base) parameterValue (otherExponentiation parameterValue element))) → otherExponentiation = exponentiation)

Logical form (Lean):

```lean
theorem LandauExponentiationWellDefined
    (model : PeanoSystem Element SetObject) :
    exists exponentiation : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model
        Element
        Element
        (fun base => base)
        (fun base value => LandauMultiplication model value base)
        exponentiation /\
      forall otherExponentiation : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model
          Element
          Element
          (fun base => base)
          (fun base value => LandauMultiplication model value base)
          otherExponentiation ->
        otherExponentiation = exponentiation
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
theorem LandauExponentiationWellDefined
    (model : PeanoSystem Element SetObject) :
    exists exponentiation : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model
        Element
        Element
        (fun base => base)
        (fun base value => LandauMultiplication model value base)
        exponentiation /\
      forall otherExponentiation : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model
          Element
          Element
          (fun base => base)
          (fun base value => LandauMultiplication model value base)
          otherExponentiation ->
        otherExponentiation = exponentiation := by
  sorry
/--
`LandauExponentiationWithOne` TODO

Predicate logic:

  (∀ x ∈ Element), LandauExponentiation model x model.base = x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (base : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun base => base) fun base value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model value base) ⋯).1 base model.1 = base

Logical form (Lean):

```lean
theorem LandauExponentiationWithOne
    (model : PeanoSystem Element SetObject)
    (base : Element) :
    LandauExponentiation model base model.base = base
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
theorem LandauExponentiationWithOne
    (model : PeanoSystem Element SetObject)
    (base : Element) :
    LandauExponentiation model base model.base = base := by
  sorry
/--
`LandauExponentiationSuccessorOnRight` TODO

Predicate logic:

  (∀ x y ∈ Element), LandauExponentiation model x (model.successor y) = LandauMultiplication model (LandauExponentiation model x y) x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (base exponent : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun base => base) fun base value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model value base) ⋯).1 base (model.2 exponent) = (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition model value left) ⋯).1 ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses model Element Element (fun base => base) fun base value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication model value base) ⋯).1 base exponent) base

Logical form (Lean):

```lean
theorem LandauExponentiationSuccessorOnRight
    (model : PeanoSystem Element SetObject)
    (base exponent : Element) :
    LandauExponentiation model base (model.successor exponent) =
      LandauMultiplication model (LandauExponentiation model base exponent) base
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
theorem LandauExponentiationSuccessorOnRight
    (model : PeanoSystem Element SetObject)
    (base exponent : Element) :
    LandauExponentiation model base (model.successor exponent) =
      LandauMultiplication model (LandauExponentiation model base exponent) base := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
