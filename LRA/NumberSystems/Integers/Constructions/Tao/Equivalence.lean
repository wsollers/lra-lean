
import LRA.NumberSystems.Integers.Constructions.Tao.Carrier

namespace LRA.NumberSystems.Integers.Tao

/--
`equivalent` TODO

Predicate logic:

  ∀ (whole_data : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences) (first second : LRA.NumberSystems.Integers.Tao.FormalDifference whole_data), whole_data.addition first.minuend second.subtrahend = whole_data.addition second.minuend first.subtrahend

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences) (first second : LRA.NumberSystems.Integers.Tao.FormalDifference whole_data), whole_data.4 first.1 second.2 = whole_data.4 second.1 first.2

Logical form (Lean):

```lean
def equivalent
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.addition first.minuend second.subtrahend =
    whole_data.addition second.minuend first.subtrahend
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
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.addition first.minuend second.subtrahend =
    whole_data.addition second.minuend first.subtrahend

/--
`equivalent_is_equivalence_relation` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForTaoFormalDifferences), Equivalence (equivalent whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences), Equivalence fun first second => whole_data.4 first.1 second.2 = whole_data.4 second.1 first.2

Logical form (Lean):

```lean
theorem equivalent_is_equivalence_relation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
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
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Equivalence (equivalent whole_data) := by
  sorry
/--
`setoid` TODO

Predicate logic:

  def setoid (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Setoid (FormalDifference whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data

Predicate logic (unfolded):

  def setoid (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Setoid (FormalDifference whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def setoid (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Setoid (FormalDifference whole_data) where
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
def setoid (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Setoid (FormalDifference whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data

/--
`Carrier` TODO

Predicate logic:

  abbrev Carrier (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :=
  Quotient (setoid whole_data)

Predicate logic (unfolded):

  abbrev Carrier (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :=
  Quotient (setoid whole_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Carrier (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :=
  Quotient (setoid whole_data)
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
abbrev Carrier (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :=
  Quotient (setoid whole_data)

end LRA.NumberSystems.Integers.Tao
