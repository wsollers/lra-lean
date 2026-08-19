-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Laws.lean
-- Transported constants, operations, and strict order on `Expansion`,
-- carried across the `binaryRealBijection` from the corresponding Cauchy
-- structure, and the proposition (plus theorem) that the bijection is an
-- ordered-field isomorphism.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadic_data : RationalDyadicApproximationData)

/-- Definition 4.1: transported constants and operations.

Mathematical statement (Lean): `noncomputable def zero : Expansion`.


Logical form:

```lean
noncomputable def zero : Expansion :=
  (binaryRealBijection dyadic_data).inverse dyadic_data.cauchy_zero
```
-/
noncomputable def zero : Expansion :=
  (binaryRealBijection dyadic_data).inverse dyadic_data.cauchy_zero

/--
**[Def — one]**

Mathematical statement (Lean): `noncomputable def one : Expansion`.


Logical form:

```lean
noncomputable def one : Expansion :=
  (binaryRealBijection dyadic_data).inverse dyadic_data.cauchy_one
```
-/
noncomputable def one : Expansion :=
  (binaryRealBijection dyadic_data).inverse dyadic_data.cauchy_one

/--
**[Def — addition]**

Mathematical statement (Lean): `noncomputable def addition (first second : Expansion) : Expansion`.


Logical form:

```lean
noncomputable def addition (first second : Expansion) : Expansion :=
  (binaryRealBijection dyadic_data).inverse
    (dyadic_data.cauchy_addition
      ((binaryRealBijection dyadic_data).forward first)
      ((binaryRealBijection dyadic_data).forward second))
```
-/
noncomputable def addition (first second : Expansion) : Expansion :=
  (binaryRealBijection dyadic_data).inverse
    (dyadic_data.cauchy_addition
      ((binaryRealBijection dyadic_data).forward first)
      ((binaryRealBijection dyadic_data).forward second))

/--
**[Def — negation]**

Mathematical statement (Lean): `noncomputable def negation (expansion : Expansion) : Expansion`.


Logical form:

```lean
noncomputable def negation (expansion : Expansion) : Expansion :=
  (binaryRealBijection dyadic_data).inverse
    (dyadic_data.cauchy_negation
      ((binaryRealBijection dyadic_data).forward expansion))
```
-/
noncomputable def negation (expansion : Expansion) : Expansion :=
  (binaryRealBijection dyadic_data).inverse
    (dyadic_data.cauchy_negation
      ((binaryRealBijection dyadic_data).forward expansion))

/--
**[Def — multiplication]**

Mathematical statement (Lean): `noncomputable def multiplication (first second : Expansion) : Expansion`.


Logical form:

```lean
noncomputable def multiplication (first second : Expansion) : Expansion :=
  (binaryRealBijection dyadic_data).inverse
    (dyadic_data.cauchy_multiplication
      ((binaryRealBijection dyadic_data).forward first)
      ((binaryRealBijection dyadic_data).forward second))
```
-/
noncomputable def multiplication (first second : Expansion) : Expansion :=
  (binaryRealBijection dyadic_data).inverse
    (dyadic_data.cauchy_multiplication
      ((binaryRealBijection dyadic_data).forward first)
      ((binaryRealBijection dyadic_data).forward second))

/--
**[Def — inverse]**

Mathematical statement (Lean): `noncomputable def inverse (expansion : Expansion) : Expansion`.


Logical form:

```lean
noncomputable def inverse (expansion : Expansion) : Expansion :=
  (binaryRealBijection dyadic_data).inverse
    (dyadic_data.cauchy_inverse
      ((binaryRealBijection dyadic_data).forward expansion))
```
-/
noncomputable def inverse (expansion : Expansion) : Expansion :=
  (binaryRealBijection dyadic_data).inverse
    (dyadic_data.cauchy_inverse
      ((binaryRealBijection dyadic_data).forward expansion))


/-- Definition 4.1: transported strict order.

Mathematical statement (Lean): `def strict_order (first second : Expansion) : Prop`.


Logical form:

```lean
def strict_order (first second : Expansion) : Prop :=
  dyadic_data.cauchy_strict_order
    ((binaryRealBijection dyadic_data).forward first)
    ((binaryRealBijection dyadic_data).forward second)
```
-/
def strict_order (first second : Expansion) : Prop :=
  dyadic_data.cauchy_strict_order
    ((binaryRealBijection dyadic_data).forward first)
    ((binaryRealBijection dyadic_data).forward second)


/-- Proposition expressing that V is an ordered-field isomorphism.

Mathematical statement (Lean): `def OrderedFieldIsomorphism : Prop`.


Logical form:

```lean
def OrderedFieldIsomorphism : Prop :=
  (binaryRealBijection dyadic_data).forward (zero dyadic_data) = dyadic_data.cauchy_zero ∧
  (binaryRealBijection dyadic_data).forward (one dyadic_data) = dyadic_data.cauchy_one ∧
  (∀ first second : Expansion,
    (binaryRealBijection dyadic_data).forward (addition dyadic_data first second) =
      dyadic_data.cauchy_addition
        ((binaryRealBijection dyadic_data).forward first)
        ((binaryRealBijection dyadic_data).forward second)) ∧
  (∀ expansion : Expansion,
    (binaryRealBijection dyadic_data).forward (negation dyadic_data expansion) =
      dyadic_data.cauchy_negation
        ((binaryRealBijection dyadic_data).forward expansion)) ∧
  (∀ first second : Expansion,
    (binaryRealBijection dyadic_data).forward (multiplication dyadic_data first second) =
      dyadic_data.cauchy_multiplication
        ((binaryRealBijection dyadic_data).forward first)
        ((binaryRealBijection dyadic_data).forward second)) ∧
  (∀ expansion : Expansion,
    (binaryRealBijection dyadic_data).forward (inverse dyadic_data expansion) =
      dyadic_data.cauchy_inverse
        ((binaryRealBijection dyadic_data).forward expansion)) ∧
  (∀ first second : Expansion,
    strict_order dyadic_data first second ↔
      dyadic_data.cauchy_strict_order
        ((binaryRealBijection dyadic_data).forward first)
        ((binaryRealBijection dyadic_data).forward second))
```
-/
def OrderedFieldIsomorphism : Prop :=
  (binaryRealBijection dyadic_data).forward (zero dyadic_data) = dyadic_data.cauchy_zero ∧
  (binaryRealBijection dyadic_data).forward (one dyadic_data) = dyadic_data.cauchy_one ∧
  (∀ first second : Expansion,
    (binaryRealBijection dyadic_data).forward (addition dyadic_data first second) =
      dyadic_data.cauchy_addition
        ((binaryRealBijection dyadic_data).forward first)
        ((binaryRealBijection dyadic_data).forward second)) ∧
  (∀ expansion : Expansion,
    (binaryRealBijection dyadic_data).forward (negation dyadic_data expansion) =
      dyadic_data.cauchy_negation
        ((binaryRealBijection dyadic_data).forward expansion)) ∧
  (∀ first second : Expansion,
    (binaryRealBijection dyadic_data).forward (multiplication dyadic_data first second) =
      dyadic_data.cauchy_multiplication
        ((binaryRealBijection dyadic_data).forward first)
        ((binaryRealBijection dyadic_data).forward second)) ∧
  (∀ expansion : Expansion,
    (binaryRealBijection dyadic_data).forward (inverse dyadic_data expansion) =
      dyadic_data.cauchy_inverse
        ((binaryRealBijection dyadic_data).forward expansion)) ∧
  (∀ first second : Expansion,
    strict_order dyadic_data first second ↔
      dyadic_data.cauchy_strict_order
        ((binaryRealBijection dyadic_data).forward first)
        ((binaryRealBijection dyadic_data).forward second))


/-- Theorem 4.2: V is an ordered-field isomorphism.

Mathematical statement (Lean): `theorem ordered_field_isomorphism : OrderedFieldIsomorphism dyadic_data`.

*Proof status:* proof pending


Logical form:

```lean
theorem ordered_field_isomorphism : OrderedFieldIsomorphism dyadic_data
```
-/
theorem ordered_field_isomorphism : OrderedFieldIsomorphism dyadic_data := by
  sorry

end LRA.NumberSystems.RealNumbers.Dyadic
