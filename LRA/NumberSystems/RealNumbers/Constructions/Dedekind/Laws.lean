-- LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Laws.lean
-- The algebraic and order-completeness law bundles: abelian-group,
-- multiplicative/distributive, field, translation-invariance,
-- positive-product, ordered-field, least-upper-bound, and
-- complete-ordered-field structure, each as a Prop plus its (pending)
-- proof that the cut construction satisfies it.

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Models

variable (rational_model : RationalModel)

/-- Proposition expressing the abelian-group laws.

Mathematical statement (Lean): `def AdditiveGroupStructure : Prop`.


Logical form:

```lean
def AdditiveGroupStructure : Prop :=
  (∀ first second third : Cut rational_model,
    addition rational_model (addition rational_model first second) third =
      addition rational_model first (addition rational_model second third)) ∧
  (∀ first second : Cut rational_model,
    addition rational_model first second = addition rational_model second first) ∧
  (∀ cut : Cut rational_model,
    addition rational_model (zero rational_model) cut = cut ∧
    addition rational_model cut (zero rational_model) = cut) ∧
  (∀ cut : Cut rational_model,
    addition rational_model cut (negation rational_model cut) = zero rational_model ∧
    addition rational_model (negation rational_model cut) cut = zero rational_model)
```
-/
def AdditiveGroupStructure : Prop :=
  (∀ first second third : Cut rational_model,
    addition rational_model (addition rational_model first second) third =
      addition rational_model first (addition rational_model second third)) ∧
  (∀ first second : Cut rational_model,
    addition rational_model first second = addition rational_model second first) ∧
  (∀ cut : Cut rational_model,
    addition rational_model (zero rational_model) cut = cut ∧
    addition rational_model cut (zero rational_model) = cut) ∧
  (∀ cut : Cut rational_model,
    addition rational_model cut (negation rational_model cut) = zero rational_model ∧
    addition rational_model (negation rational_model cut) cut = zero rational_model)


/-- Theorem 3.6: the cuts form an abelian group under addition.

Mathematical statement (Lean): `theorem additive_group_structure : AdditiveGroupStructure rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem additive_group_structure : AdditiveGroupStructure rational_model
```
-/
theorem additive_group_structure : AdditiveGroupStructure rational_model := by
  sorry


/-- Proposition expressing multiplicative and distributive laws.

Mathematical statement (Lean): `def MultiplicativeAndDistributiveLaws : Prop`.


Logical form:

```lean
def MultiplicativeAndDistributiveLaws : Prop :=
  (∀ first second third : Cut rational_model,
    multiplication rational_model (multiplication rational_model first second) third =
      multiplication rational_model first (multiplication rational_model second third)) ∧
  (∀ first second : Cut rational_model,
    multiplication rational_model first second = multiplication rational_model second first) ∧
  (∀ cut : Cut rational_model,
    multiplication rational_model (one rational_model) cut = cut ∧
    multiplication rational_model cut (one rational_model) = cut) ∧
  (∀ first second third : Cut rational_model,
    multiplication rational_model first (addition rational_model second third) =
      addition rational_model
        (multiplication rational_model first second)
        (multiplication rational_model first third))
```
-/
def MultiplicativeAndDistributiveLaws : Prop :=
  (∀ first second third : Cut rational_model,
    multiplication rational_model (multiplication rational_model first second) third =
      multiplication rational_model first (multiplication rational_model second third)) ∧
  (∀ first second : Cut rational_model,
    multiplication rational_model first second = multiplication rational_model second first) ∧
  (∀ cut : Cut rational_model,
    multiplication rational_model (one rational_model) cut = cut ∧
    multiplication rational_model cut (one rational_model) = cut) ∧
  (∀ first second third : Cut rational_model,
    multiplication rational_model first (addition rational_model second third) =
      addition rational_model
        (multiplication rational_model first second)
        (multiplication rational_model first third))


/-- Theorem 4.6: multiplicative and distributive laws.

Mathematical statement (Lean): `theorem multiplicative_and_distributive_laws : MultiplicativeAndDistributiveLaws rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem multiplicative_and_distributive_laws :
    MultiplicativeAndDistributiveLaws rational_model
```
-/
theorem multiplicative_and_distributive_laws :
    MultiplicativeAndDistributiveLaws rational_model := by
  sorry


/-- Proposition expressing field structure.

Mathematical statement (Lean): `def FieldStructure : Prop`.


Logical form:

```lean
def FieldStructure : Prop :=
  AdditiveGroupStructure rational_model ∧
  MultiplicativeAndDistributiveLaws rational_model ∧
  (∀ cut : Cut rational_model,
    cut ≠ zero rational_model →
    ∃ reciprocal, IsReciprocal rational_model cut reciprocal)
```
-/
def FieldStructure : Prop :=
  AdditiveGroupStructure rational_model ∧
  MultiplicativeAndDistributiveLaws rational_model ∧
  (∀ cut : Cut rational_model,
    cut ≠ zero rational_model →
    ∃ reciprocal, IsReciprocal rational_model cut reciprocal)


/-- Theorem 4.10: Dedekind cuts form a field.

Mathematical statement (Lean): `theorem field_structure : FieldStructure rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem field_structure : FieldStructure rational_model
```
-/
theorem field_structure : FieldStructure rational_model := by
  sorry


/-- Theorem 5.1: translation invariance of strict order.

Mathematical statement (Lean): `theorem translation_invariance (first second translation : Cut rational_model) (first_lt_second : strict_order rational_model first second) : strict_order rational_model (addition rational_model first translation) (addition rational_model second translation)`.

*Proof status:* proof pending


Logical form:

```lean
theorem translation_invariance
    (first second translation : Cut rational_model)
    (first_lt_second : strict_order rational_model first second) :
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation)
```
-/
theorem translation_invariance
    (first second translation : Cut rational_model)
    (first_lt_second : strict_order rational_model first second) :
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation) := by
  sorry


/-- Theorem 5.2: positive products are positive.

Mathematical statement (Lean): `theorem positive_products_are_positive (first second : Cut rational_model) (first_positive : IsPositive rational_model first) (second_positive : IsPositive rational_model second) : IsPositive rational_model (multiplication rational_model first second)`.

*Proof status:* proof pending


Logical form:

```lean
theorem positive_products_are_positive
    (first second : Cut rational_model)
    (first_positive : IsPositive rational_model first)
    (second_positive : IsPositive rational_model second) :
    IsPositive rational_model
      (multiplication rational_model first second)
```
-/
theorem positive_products_are_positive
    (first second : Cut rational_model)
    (first_positive : IsPositive rational_model first)
    (second_positive : IsPositive rational_model second) :
    IsPositive rational_model
      (multiplication rational_model first second) := by
  sorry


/-- Proposition expressing ordered-field structure.

Mathematical statement (Lean): `def OrderedFieldStructure : Prop`.


Logical form:

```lean
def OrderedFieldStructure : Prop :=
  FieldStructure rational_model ∧
  StrictTotalOrder rational_model ∧
  (∀ first second translation : Cut rational_model,
    strict_order rational_model first second →
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation)) ∧
  (∀ first second : Cut rational_model,
    IsPositive rational_model first →
    IsPositive rational_model second →
    IsPositive rational_model
      (multiplication rational_model first second))
```
-/
def OrderedFieldStructure : Prop :=
  FieldStructure rational_model ∧
  StrictTotalOrder rational_model ∧
  (∀ first second translation : Cut rational_model,
    strict_order rational_model first second →
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation)) ∧
  (∀ first second : Cut rational_model,
    IsPositive rational_model first →
    IsPositive rational_model second →
    IsPositive rational_model
      (multiplication rational_model first second))


/-- Theorem 5.3: Dedekind cuts form an ordered field.

Mathematical statement (Lean): `theorem ordered_field_structure : OrderedFieldStructure rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem ordered_field_structure : OrderedFieldStructure rational_model
```
-/
theorem ordered_field_structure : OrderedFieldStructure rational_model := by
  sorry


/-- Proposition expressing the least-upper-bound property.

Mathematical statement (Lean): `def LeastUpperBoundProperty : Prop`.


Logical form:

```lean
def LeastUpperBoundProperty : Prop :=
  ∀ family : Cut rational_model → Prop,
    (∃ cut, family cut) →
    (∃ upper,
      ∀ cut,
        family cut → nonstrict_order rational_model cut upper) →
    ∃ supremum,
      (∀ cut,
        family cut → nonstrict_order rational_model cut supremum) ∧
      (∀ upper,
        (∀ cut,
          family cut → nonstrict_order rational_model cut upper) →
        nonstrict_order rational_model supremum upper)
```
-/
def LeastUpperBoundProperty : Prop :=
  ∀ family : Cut rational_model → Prop,
    (∃ cut, family cut) →
    (∃ upper,
      ∀ cut,
        family cut → nonstrict_order rational_model cut upper) →
    ∃ supremum,
      (∀ cut,
        family cut → nonstrict_order rational_model cut supremum) ∧
      (∀ upper,
        (∀ cut,
          family cut → nonstrict_order rational_model cut upper) →
        nonstrict_order rational_model supremum upper)


/-- Corollary 6.3: least-upper-bound property.

Mathematical statement (Lean): `theorem least_upper_bound_property : LeastUpperBoundProperty rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem least_upper_bound_property : LeastUpperBoundProperty rational_model
```
-/
theorem least_upper_bound_property : LeastUpperBoundProperty rational_model := by
  sorry


/-- Proposition expressing complete ordered-field structure.

Mathematical statement (Lean): `def CompleteOrderedFieldStructure : Prop`.


Logical form:

```lean
def CompleteOrderedFieldStructure : Prop :=
  OrderedFieldStructure rational_model ∧ LeastUpperBoundProperty rational_model
```
-/
def CompleteOrderedFieldStructure : Prop :=
  OrderedFieldStructure rational_model ∧ LeastUpperBoundProperty rational_model


/-- Theorem 6.4: complete ordered-field structure.

Mathematical statement (Lean): `theorem complete_ordered_field_structure : CompleteOrderedFieldStructure rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem complete_ordered_field_structure :
    CompleteOrderedFieldStructure rational_model
```
-/
theorem complete_ordered_field_structure :
    CompleteOrderedFieldStructure rational_model := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
