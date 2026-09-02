import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier
import LRA.Set.Constructions.TypeSet.Definition

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

open LRA.Set
open LRA.Set.Constructions

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

/--
`basic_decomposition` TODO

Predicate logic:

  ((value = zero natural_data) ∨ (∃ natural, value = naturalEmbedding natural_data natural)) ∧ ¬ ((value = zero natural_data) ∧ (∃ natural, value = naturalEmbedding natural_data natural)) ∧ (∀ first second, value = naturalEmbedding natural_data first → value = naturalEmbedding natural_data second → first = second)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (a : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (value : Option Element), (Or (value = Option.none)(Exists fun natural => value = Option.some natural) ∧ ((value = Option.none ∧ Exists fun natural => value = Option.some natural) → False ∧ ∀ (first second : Element), value = Option.some first → value = Option.some second → first = second))

Logical form (Lean):

```lean
theorem basic_decomposition (value : Carrier natural_data) :
    ((value = zero natural_data) ∨
      (∃ natural, value = naturalEmbedding natural_data natural)) ∧
    ¬ ((value = zero natural_data) ∧
      (∃ natural, value = naturalEmbedding natural_data natural)) ∧
    (∀ first second,
      value = naturalEmbedding natural_data first →
      value = naturalEmbedding natural_data second →
      first = second)
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
theorem basic_decomposition (value : Carrier natural_data) :
    ((value = zero natural_data) ∨
      (∃ natural, value = naturalEmbedding natural_data natural)) ∧
    ¬ ((value = zero natural_data) ∧
      (∃ natural, value = naturalEmbedding natural_data natural)) ∧
    (∀ first second,
      value = naturalEmbedding natural_data first →
      value = naturalEmbedding natural_data second →
      first = second) := by
  sorry
/--
`zero_is_not_successor` TODO

Predicate logic:

  successor natural_data value ≠ zero natural_data

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (value : Option Element), Option.rec ((fun _ => Option.some natural_data.model.1) Unit.unit) (fun val => (fun val => (fun value => Option.some (natural_data.model.2 value)) val) val) value = Option.none → False

Logical form (Lean):

```lean
theorem zero_is_not_successor (value : Carrier natural_data) :
    successor natural_data value ≠ zero natural_data
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
theorem zero_is_not_successor (value : Carrier natural_data) :
    successor natural_data value ≠ zero natural_data := by
  sorry
/--
`successor_is_injective` TODO

Predicate logic:

  ∀ first second, successor natural_data first = successor natural_data second → first = second

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (first second : Option Element), Option.rec ((fun _ => Option.some natural_data.model.1) Unit.unit) (fun val => (fun val => (fun value => Option.some (natural_data.model.2 value)) val) val) first = Option.rec ((fun _ => Option.some natural_data.model.1) Unit.unit) (fun val => (fun val => (fun value => Option.some (natural_data.model.2 value)) val) val) second → first = second

Logical form (Lean):

```lean
theorem successor_is_injective :
    ∀ first second,
      successor natural_data first = successor natural_data second → first = second
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
theorem successor_is_injective :
    ∀ first second,
      successor natural_data first = successor natural_data second → first = second := by
  sorry
/--
`induction_from_zero` TODO

Predicate logic:

  (Carrier natural_data → Prop ∧ ∀ value, predicate value → predicate (successor natural_data value)) → ∀ value, predicate value

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (predicate : Option Element → Prop), (predicate Option.none ∧ ∀ (value : Option Element), predicate value → predicate (Option.rec ((fun _ => Option.some natural_data.model.1) Unit.unit) (fun val => (fun val => (fun value => Option.some (natural_data.model.2 value)) val) val) value)) → ∀ (value : Option Element), predicate value

Logical form (Lean):

```lean
theorem induction_from_zero
    (predicate : Carrier natural_data → Prop)
    (zero_case : predicate (zero natural_data))
    (successor_case : ∀ value, predicate value → predicate (successor natural_data value)) :
    ∀ value, predicate value
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
theorem induction_from_zero
    (predicate : Carrier natural_data → Prop)
    (zero_case : predicate (zero natural_data))
    (successor_case : ∀ value, predicate value → predicate (successor natural_data value)) :
    ∀ value, predicate value := by
  sorry
/--
`strong_induction` TODO

Predicate logic:

  (Carrier natural_data → Prop ∧ ∀ value, (∀ smaller, strictOrder natural_data smaller value → predicate smaller) → predicate value) → ∀ value, predicate value

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (predicate : Option Element → Prop), (∀ (value : Option Element), (∀ (smaller : Option Element), Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) value) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) value) val) smaller → predicate smaller) → predicate value) → ∀ (value : Option Element), predicate value

Logical form (Lean):

```lean
theorem strong_induction
    (predicate : Carrier natural_data → Prop)
    (step :
      ∀ value,
        (∀ smaller, strictOrder natural_data smaller value → predicate smaller) →
        predicate value) :
    ∀ value, predicate value
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
theorem strong_induction
    (predicate : Carrier natural_data → Prop)
    (step :
      ∀ value,
        (∀ smaller, strictOrder natural_data smaller value → predicate smaller) →
        predicate value) :
    ∀ value, predicate value := by
  sorry
/--
`WholeNumbersPeanoSystem` TODO

Predicate logic:

  def WholeNumbersPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      (Carrier natural_data) (TypeSet (Carrier natural_data)) where
  base := zero natural_data
  successor := successor natural_data
  one_not_successor := zero_is_not_successor natural_data
  successor_injective := successor_is_injective natural_data
  induction := induction_from_zero natural_data

Predicate logic (unfolded):

  def WholeNumbersPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      (Carrier natural_data) (TypeSet (Carrier natural_data)) where
  base := zero natural_data
  successor := successor natural_data
  one_not_successor := zero_is_not_successor natural_data
  successor_injective := successor_is_injective natural_data
  induction := induction_from_zero natural_data (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def WholeNumbersPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      (Carrier natural_data) (TypeSet (Carrier natural_data)) where
  base := zero natural_data
  successor := successor natural_data
  one_not_successor := zero_is_not_successor natural_data
  successor_injective := successor_is_injective natural_data
  induction := induction_from_zero natural_data
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
def WholeNumbersPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      (Carrier natural_data) (TypeSet (Carrier natural_data)) where
  base := zero natural_data
  successor := successor natural_data
  one_not_successor := zero_is_not_successor natural_data
  successor_injective := successor_is_injective natural_data
  induction := induction_from_zero natural_data

end LRA.NumberSystems.WholeNumbers.Constructions.Landau
