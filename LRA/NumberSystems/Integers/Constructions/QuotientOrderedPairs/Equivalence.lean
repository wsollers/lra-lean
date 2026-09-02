
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Carrier

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/--
`equivalent` TODO

Predicate logic:

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), whole_data.addition first.positive_coordinate second.negative_coordinate = whole_data.addition second.positive_coordinate first.negative_coordinate

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), whole_data.4 first.1 second.2 = whole_data.4 second.1 first.2

Logical form (Lean):

```lean
def equivalent
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Prop :=
  whole_data.addition first.positive_coordinate second.negative_coordinate =
    whole_data.addition second.positive_coordinate first.negative_coordinate
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
def equivalent
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Prop :=
  whole_data.addition first.positive_coordinate second.negative_coordinate =
    whole_data.addition second.positive_coordinate first.negative_coordinate

/--
`equivalent_is_equivalence_relation` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), Equivalence (equivalent whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), Equivalence fun first second => whole_data.4 first.1 second.2 = whole_data.4 second.1 first.2

Logical form (Lean):

```lean
theorem equivalent_is_equivalence_relation
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Equivalence (equivalent whole_data)
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
theorem equivalent_is_equivalence_relation
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Equivalence (equivalent whole_data) := by
  sorry
/--
`representative_setoid` TODO

Predicate logic:

  def representative_setoid (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Setoid (Representative whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data

Predicate logic (unfolded):

  def representative_setoid (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Setoid (Representative whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_setoid (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Setoid (Representative whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data
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
def representative_setoid (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Setoid (Representative whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data

/--
`Carrier` TODO

Predicate logic:

  abbrev Carrier (whole_data : WholeNumberArithmeticForQuotientPairs) :=
  Quotient (representative_setoid whole_data)

Predicate logic (unfolded):

  abbrev Carrier (whole_data : WholeNumberArithmeticForQuotientPairs) :=
  Quotient (representative_setoid whole_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Carrier (whole_data : WholeNumberArithmeticForQuotientPairs) :=
  Quotient (representative_setoid whole_data)
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
abbrev Carrier (whole_data : WholeNumberArithmeticForQuotientPairs) :=
  Quotient (representative_setoid whole_data)

end LRA.NumberSystems.Integers.QuotientOrderedPairs
