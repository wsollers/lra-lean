
import LRA.NumberSystems.Integers.Constructions.Mendelson.Carrier

namespace LRA.NumberSystems.Integers.Mendelson

/--
`equivalent` TODO

Predicate logic:

  ∀ (positive_data : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData) (first second : LRA.NumberSystems.Integers.Mendelson.PositivePair positive_data), positive_data.addition first.left second.right = positive_data.addition second.left first.right

Predicate logic (unfolded):

  ∀ (positive_data : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData) (first second : LRA.NumberSystems.Integers.Mendelson.PositivePair positive_data), positive_data.4 first.1 second.2 = positive_data.4 second.1 first.2

Logical form (Lean):

```lean
def equivalent
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : Prop :=
  positive_data.addition first.left second.right =
    positive_data.addition second.left first.right
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
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : Prop :=
  positive_data.addition first.left second.right =
    positive_data.addition second.left first.right

/--
`equivalent_is_equivalence_relation` TODO

Predicate logic:

  (∀ positive_data ∈ PositiveNaturalPairData), Equivalence (equivalent positive_data)

Predicate logic (unfolded):

  ∀ (positive_data : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData), Equivalence fun first second => positive_data.4 first.1 second.2 = positive_data.4 second.1 first.2

Logical form (Lean):

```lean
theorem equivalent_is_equivalence_relation
    (positive_data : PositiveNaturalPairData) :
    Equivalence (equivalent positive_data)
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
    (positive_data : PositiveNaturalPairData) :
    Equivalence (equivalent positive_data) := by
  sorry
/--
`setoid` TODO

Predicate logic:

  def setoid (positive_data : PositiveNaturalPairData) :
    Setoid (PositivePair positive_data) where
  r := equivalent positive_data
  iseqv := equivalent_is_equivalence_relation positive_data

Predicate logic (unfolded):

  def setoid (positive_data : PositiveNaturalPairData) :
    Setoid (PositivePair positive_data) where
  r := equivalent positive_data
  iseqv := equivalent_is_equivalence_relation positive_data (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def setoid (positive_data : PositiveNaturalPairData) :
    Setoid (PositivePair positive_data) where
  r := equivalent positive_data
  iseqv := equivalent_is_equivalence_relation positive_data
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
def setoid (positive_data : PositiveNaturalPairData) :
    Setoid (PositivePair positive_data) where
  r := equivalent positive_data
  iseqv := equivalent_is_equivalence_relation positive_data

/--
`Carrier` TODO

Predicate logic:

  abbrev Carrier (positive_data : PositiveNaturalPairData) :=
  Quotient (setoid positive_data)

Predicate logic (unfolded):

  abbrev Carrier (positive_data : PositiveNaturalPairData) :=
  Quotient (setoid positive_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Carrier (positive_data : PositiveNaturalPairData) :=
  Quotient (setoid positive_data)
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
abbrev Carrier (positive_data : PositiveNaturalPairData) :=
  Quotient (setoid positive_data)

end LRA.NumberSystems.Integers.Mendelson
