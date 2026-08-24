
namespace LRA.UniversalAlgebra.Quotient

/--
`unary_operation_respects` TODO

Predicate logic:

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier) (first_representative second_representative : Carrier), setoid.r first_representative second_representative → setoid.r (operation first_representative) (operation second_representative)

Predicate logic (unfolded):

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier) (first_representative second_representative : Carrier), setoid.1 first_representative second_representative → setoid.1 (operation first_representative) (operation second_representative)

Logical form (Lean):

```lean
def unary_operation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier) : Prop :=
  ∀ first_representative second_representative : Carrier,
    setoid.r first_representative second_representative →
    setoid.r
      (operation first_representative)
      (operation second_representative)
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
def unary_operation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier) : Prop :=
  ∀ first_representative second_representative : Carrier,
    setoid.r first_representative second_representative →
    setoid.r
      (operation first_representative)
      (operation second_representative)

/--
`binary_operation_respects_left` TODO

Predicate logic:

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier) (first_representative first_replacement second_representative : Carrier), setoid.r first_representative first_replacement → setoid.r (operation first_representative second_representative) (operation first_replacement second_representative)

Predicate logic (unfolded):

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier) (first_representative first_replacement second_representative : Carrier), setoid.1 first_representative first_replacement → setoid.1 (operation first_representative second_representative) (operation first_replacement second_representative)

Logical form (Lean):

```lean
def binary_operation_respects_left
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative first_replacement second_representative : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_replacement second_representative)
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
def binary_operation_respects_left
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative first_replacement second_representative : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_replacement second_representative)

/--
`binary_operation_respects_right` TODO

Predicate logic:

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier) (first_representative second_representative second_replacement : Carrier), setoid.r second_representative second_replacement → setoid.r (operation first_representative second_representative) (operation first_representative second_replacement)

Predicate logic (unfolded):

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier) (first_representative second_representative second_replacement : Carrier), setoid.1 second_representative second_replacement → setoid.1 (operation first_representative second_representative) (operation first_representative second_replacement)

Logical form (Lean):

```lean
def binary_operation_respects_right
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative second_representative second_replacement : Carrier,
    setoid.r second_representative second_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_representative second_replacement)
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
def binary_operation_respects_right
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative second_representative second_replacement : Carrier,
    setoid.r second_representative second_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_representative second_replacement)

/--
`binary_operation_respects` TODO

Predicate logic:

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier) (first_representative first_replacement second_representative second_replacement : Carrier), (setoid.r first_representative first_replacement ∧ setoid.r second_representative second_replacement) → setoid.r (operation first_representative second_representative) (operation first_replacement second_replacement)

Predicate logic (unfolded):

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier) (first_representative first_replacement second_representative second_replacement : Carrier), (setoid.1 first_representative first_replacement ∧ setoid.1 second_representative second_replacement) → setoid.1 (operation first_representative second_representative) (operation first_replacement second_replacement)

Logical form (Lean):

```lean
def binary_operation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative first_replacement
    second_representative second_replacement : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r second_representative second_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_replacement second_replacement)
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
def binary_operation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative first_replacement
    second_representative second_replacement : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r second_representative second_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_replacement second_replacement)

/--
`binary_operation_respects_iff_left_and_right` TODO

Predicate logic:

  (Carrier → Carrier → Carrier) → binary_operation_respects setoid operation ↔ binary_operation_respects_left setoid operation ∧ binary_operation_respects_right setoid operation

Predicate logic (unfolded):

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier), ∀ (first_representative first_replacement second_representative second_replacement : Carrier), setoid.1 first_representative first_replacement → setoid.1 second_representative second_replacement → setoid.1 (operation first_representative second_representative) (operation first_replacement second_replacement) ↔ (∀ (first_representative first_replacement second_representative : Carrier), setoid.1 first_representative first_replacement → setoid.1 (operation first_representative second_representative) (operation first_replacement second_representative) ∧ ∀ (first_representative second_representative second_replacement : Carrier), setoid.1 second_representative second_replacement → setoid.1 (operation first_representative second_representative) (operation first_representative second_replacement))

Logical form (Lean):

```lean
theorem binary_operation_respects_iff_left_and_right
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) :
    binary_operation_respects setoid operation ↔
      binary_operation_respects_left setoid operation ∧
      binary_operation_respects_right setoid operation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem binary_operation_respects_iff_left_and_right
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) :
    binary_operation_respects setoid operation ↔
      binary_operation_respects_left setoid operation ∧
      binary_operation_respects_right setoid operation := by
  sorry

/--
`commutative_operation_respects_of_respects_left` TODO

Predicate logic:

  (Carrier → Carrier → Carrier ∧ ∀ first second : Carrier, operation first second = operation second first) → binary_operation_respects setoid operation

Predicate logic (unfolded):

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (operation : Carrier → Carrier → Carrier), (∀ (first second : Carrier), operation first second = operation second first ∧ ∀ (first_representative first_replacement second_representative : Carrier), setoid.1 first_representative first_replacement → setoid.1 (operation first_representative second_representative) (operation first_replacement second_representative)) → ∀ (first_representative first_replacement second_representative second_replacement : Carrier), (setoid.1 first_representative first_replacement ∧ setoid.1 second_representative second_replacement) → setoid.1 (operation first_representative second_representative) (operation first_replacement second_replacement)

Logical form (Lean):

```lean
theorem commutative_operation_respects_of_respects_left
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier)
    (operation_is_commutative :
      ∀ first second : Carrier,
        operation first second = operation second first)
    (operation_respects_left :
      binary_operation_respects_left setoid operation) :
    binary_operation_respects setoid operation
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
theorem commutative_operation_respects_of_respects_left
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier)
    (operation_is_commutative :
      ∀ first second : Carrier,
        operation first second = operation second first)
    (operation_respects_left :
      binary_operation_respects_left setoid operation) :
    binary_operation_respects setoid operation := by
  sorry

/--
`induced_binary_operation_exists` TODO

Predicate logic:

  (Carrier → Carrier → Carrier) → ∃ quotient_operation ∈ Quotient setoid → Quotient setoid → Quotient setoid, ∀ first_representative second_representative : Carrier, quotient_operation (Quotient.mk setoid first_representative) (Quotient.mk setoid second_representative) = Quotient.mk setoid (representative_operation first_representative second_representative)

Predicate logic (unfolded):

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (representative_operation : Carrier → Carrier → Carrier), (∀ (first_representative first_replacement second_representative second_replacement : Carrier), setoid.1 first_representative first_replacement → setoid.1 second_representative second_replacement → setoid.1 (representative_operation first_representative second_representative) (representative_operation first_replacement second_replacement)) → Exists fun quotient_operation => ∀ (first_representative second_representative : Carrier), quotient_operation (Quot.mk setoid.1 first_representative) (Quot.mk setoid.1 second_representative) = Quot.mk setoid.1 (representative_operation first_representative second_representative)

Logical form (Lean):

```lean
theorem induced_binary_operation_exists
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (representative_operation : Carrier → Carrier → Carrier)
    (representative_operation_respects :
      binary_operation_respects setoid representative_operation) :
    ∃ quotient_operation :
        Quotient setoid → Quotient setoid → Quotient setoid,
      ∀ first_representative second_representative : Carrier,
        quotient_operation
            (Quotient.mk setoid first_representative)
            (Quotient.mk setoid second_representative) =
          Quotient.mk setoid
            (representative_operation
              first_representative
              second_representative)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem induced_binary_operation_exists
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (representative_operation : Carrier → Carrier → Carrier)
    (representative_operation_respects :
      binary_operation_respects setoid representative_operation) :
    ∃ quotient_operation :
        Quotient setoid → Quotient setoid → Quotient setoid,
      ∀ first_representative second_representative : Carrier,
        quotient_operation
            (Quotient.mk setoid first_representative)
            (Quotient.mk setoid second_representative) =
          Quotient.mk setoid
            (representative_operation
              first_representative
              second_representative) := by
  sorry

/--
`predicate_respects` TODO

Predicate logic:

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (predicate : Carrier → Prop) (first_representative second_representative : Carrier), setoid.r first_representative second_representative → predicate first_representative ↔ predicate second_representative

Predicate logic (unfolded):

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (predicate : Carrier → Prop) (first_representative second_representative : Carrier), setoid.1 first_representative second_representative → predicate first_representative ↔ predicate second_representative

Logical form (Lean):

```lean
def predicate_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (predicate : Carrier → Prop) : Prop :=
  ∀ first_representative second_representative : Carrier,
    setoid.r first_representative second_representative →
    (predicate first_representative ↔ predicate second_representative)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def predicate_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (predicate : Carrier → Prop) : Prop :=
  ∀ first_representative second_representative : Carrier,
    setoid.r first_representative second_representative →
    (predicate first_representative ↔ predicate second_representative)

/--
`relation_respects` TODO

Predicate logic:

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (relation : Carrier → Carrier → Prop) (first_representative first_replacement second_representative second_replacement : Carrier), (setoid.r first_representative first_replacement ∧ setoid.r second_representative second_replacement) → relation first_representative second_representative ↔ relation first_replacement second_replacement

Predicate logic (unfolded):

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (relation : Carrier → Carrier → Prop) (first_representative first_replacement second_representative second_replacement : Carrier), (setoid.1 first_representative first_replacement ∧ setoid.1 second_representative second_replacement) → relation first_representative second_representative ↔ relation first_replacement second_replacement

Logical form (Lean):

```lean
def relation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ first_representative first_replacement
    second_representative second_replacement : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r second_representative second_replacement →
    (relation first_representative second_representative ↔
      relation first_replacement second_replacement)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def relation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ first_representative first_replacement
    second_representative second_replacement : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r second_representative second_replacement →
    (relation first_representative second_representative ↔
      relation first_replacement second_replacement)

/--
`compatible_predicate_has_constant_truth_on_classes` TODO

Predicate logic:

  (∀ first_representative second_representative ∈ Carrier), (Carrier → Prop) → predicate first_representative ↔ predicate second_representative

Predicate logic (unfolded):

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (predicate : Carrier → Prop), (∀ (first_representative second_representative : Carrier), setoid.1 first_representative second_representative → predicate first_representative ↔ predicate second_representative) → ∀ (first_representative second_representative : Carrier), setoid.1 first_representative second_representative → predicate first_representative ↔ predicate second_representative

Logical form (Lean):

```lean
theorem compatible_predicate_has_constant_truth_on_classes
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (predicate : Carrier → Prop)
    (predicate_is_compatible : predicate_respects setoid predicate)
    (first_representative second_representative : Carrier)
    (representatives_are_equivalent :
      setoid.r first_representative second_representative) :
    predicate first_representative ↔ predicate second_representative
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem compatible_predicate_has_constant_truth_on_classes
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (predicate : Carrier → Prop)
    (predicate_is_compatible : predicate_respects setoid predicate)
    (first_representative second_representative : Carrier)
    (representatives_are_equivalent :
      setoid.r first_representative second_representative) :
    predicate first_representative ↔ predicate second_representative := by
  sorry

/--
`induced_relation_exists` TODO

Predicate logic:

  (Carrier → Carrier → Prop) → ∃ quotient_relation ∈ Quotient setoid → Quotient setoid → Prop, ∀ first_representative second_representative : Carrier, quotient_relation (Quotient.mk setoid first_representative) (Quotient.mk setoid second_representative) ↔ representative_relation first_representative second_representative

Predicate logic (unfolded):

  ∀ {Carrier : Type} (setoid : Setoid Carrier) (representative_relation : Carrier → Carrier → Prop), (∀ (first_representative first_replacement second_representative second_replacement : Carrier), setoid.1 first_representative first_replacement → setoid.1 second_representative second_replacement → representative_relation first_representative second_representative ↔ representative_relation first_replacement second_replacement) → Exists fun quotient_relation => ∀ (first_representative second_representative : Carrier), quotient_relation (Quot.mk setoid.1 first_representative) (Quot.mk setoid.1 second_representative) ↔ representative_relation first_representative second_representative

Logical form (Lean):

```lean
theorem induced_relation_exists
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (representative_relation : Carrier → Carrier → Prop)
    (representative_relation_respects :
      relation_respects setoid representative_relation) :
    ∃ quotient_relation : Quotient setoid → Quotient setoid → Prop,
      ∀ first_representative second_representative : Carrier,
        quotient_relation
            (Quotient.mk setoid first_representative)
            (Quotient.mk setoid second_representative) ↔
          representative_relation
            first_representative
            second_representative
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem induced_relation_exists
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (representative_relation : Carrier → Carrier → Prop)
    (representative_relation_respects :
      relation_respects setoid representative_relation) :
    ∃ quotient_relation : Quotient setoid → Quotient setoid → Prop,
      ∀ first_representative second_representative : Carrier,
        quotient_relation
            (Quotient.mk setoid first_representative)
            (Quotient.mk setoid second_representative) ↔
          representative_relation
            first_representative
            second_representative := by
  sorry

end LRA.UniversalAlgebra.Quotient
