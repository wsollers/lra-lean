
import LRA.NumberSystems.Integers.Constructions.Mendelson.WellFoundedness

namespace LRA.NumberSystems.Integers.Mendelson

/--
`representative_addition` TODO

Predicate logic:

  def representative_addition
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left := positive_data.addition first.left second.left
  right := positive_data.addition first.right second.right

Predicate logic (unfolded):

  def representative_addition
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left := positive_data.addition first.left second.left
  right := positive_data.addition first.right second.right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_addition
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left := positive_data.addition first.left second.left
  right := positive_data.addition first.right second.right
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
def representative_addition
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left := positive_data.addition first.left second.left
  right := positive_data.addition first.right second.right

/--
`representative_negation` TODO

Predicate logic:

  def representative_negation
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : PositivePair positive_data where
  left := value.right
  right := value.left

Predicate logic (unfolded):

  def representative_negation
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : PositivePair positive_data where
  left := value.right
  right := value.left (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_negation
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : PositivePair positive_data where
  left := value.right
  right := value.left
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
def representative_negation
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : PositivePair positive_data where
  left := value.right
  right := value.left

/--
`representative_multiplication` TODO

Predicate logic:

  def representative_multiplication
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left :=
    positive_data.addition
      (positive_data.multiplication first.left second.left)
      (positive_data.multiplication first.right second.right)
  right :=
    positive_data.addition
      (positive_data.multiplication first.left second.right)
      (positive_data.multiplication first.right second.left)

Predicate logic (unfolded):

  def representative_multiplication
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left :=
    positive_data.addition
      (positive_data.multiplication first.left second.left)
      (positive_data.multiplication first.right second.right)
  right :=
    positive_data.addition
      (positive_data.multiplication first.left second.right)
      (positive_data.multiplication first.right second.left) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_multiplication
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left :=
    positive_data.addition
      (positive_data.multiplication first.left second.left)
      (positive_data.multiplication first.right second.right)
  right :=
    positive_data.addition
      (positive_data.multiplication first.left second.right)
      (positive_data.multiplication first.right second.left)
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
def representative_multiplication
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left :=
    positive_data.addition
      (positive_data.multiplication first.left second.left)
      (positive_data.multiplication first.right second.right)
  right :=
    positive_data.addition
      (positive_data.multiplication first.left second.right)
      (positive_data.multiplication first.right second.left)

/--
`positive_class` TODO

Predicate logic:

  ∀ (positive_data : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData) (value : LRA.NumberSystems.Integers.Mendelson.PositivePair positive_data), (positive_data.nonstrict_order value.right value.left ∧ ¬ LRA.NumberSystems.Integers.Mendelson.equivalent positive_data value { left := positive_data.one, right := positive_data.one })

Predicate logic (unfolded):

  ∀ (positive_data : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData) (value : LRA.NumberSystems.Integers.Mendelson.PositivePair positive_data), (positive_data.6 value.2 value.1 ∧ positive_data.4 value.1 { left := positive_data.one, right := positive_data.one }.2 = positive_data.4 { left := positive_data.one, right := positive_data.one }.1 value.2 → False)

Logical form (Lean):

```lean
def positive_class
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : Prop :=
  positive_data.nonstrict_order value.right value.left ∧
    ¬ equivalent positive_data value
      { left := positive_data.one, right := positive_data.one }
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def positive_class
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : Prop :=
  positive_data.nonstrict_order value.right value.left ∧
    ¬ equivalent positive_data value
      { left := positive_data.one, right := positive_data.one }

/--
`representative_strict_order` TODO

Predicate logic:

  ∀ (positive_data : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData) (first second : LRA.NumberSystems.Integers.Mendelson.PositivePair positive_data), (positive_data.nonstrict_order { left := positive_data.addition second.left first.right, right := positive_data.addition first.left second.right }.right { left := positive_data.addition second.left first.right, right := positive_data.addition first.left second.right }.left ∧ ¬ LRA.NumberSystems.Integers.Mendelson.equivalent positive_data { left := positive_data.addition second.left first.right, right := positive_data.addition first.left second.right } { left := positive_data.one, right := positive_data.one })

Predicate logic (unfolded):

  ∀ (positive_data : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData) (first second : LRA.NumberSystems.Integers.Mendelson.PositivePair positive_data), (positive_data.6 { left := positive_data.addition second.left first.right, right := positive_data.addition first.left second.right }.2 { left := positive_data.addition second.left first.right, right := positive_data.addition first.left second.right }.1 ∧ positive_data.4 { left := positive_data.addition second.left first.right, right := positive_data.addition first.left second.right }.1 { left := positive_data.one, right := positive_data.one }.2 = positive_data.4 { left := positive_data.one, right := positive_data.one }.1 { left := positive_data.addition second.left first.right, right := positive_data.addition first.left second.right }.2 → False)

Logical form (Lean):

```lean
def representative_strict_order
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : Prop :=
  positive_class positive_data
    { left := positive_data.addition second.left first.right
      right := positive_data.addition first.left second.right }
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
def representative_strict_order
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : Prop :=
  positive_class positive_data
    { left := positive_data.addition second.left first.right
      right := positive_data.addition first.left second.right }

end LRA.NumberSystems.Integers.Mendelson
