import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility

namespace LRA.Operation.Laws.QuotientCompatible

/--
`BinaryOperationIsProper` TODO

Predicate logic:

  structure BinaryOperationIsProper
    {Representative : Type} {Raw : Type}
    (invariant : Raw → Prop)
    (toRaw : Representative → Raw)
    (rawOperation : Representative → Representative → Raw)
    (setoid : Setoid Representative)
    (operation : Representative → Representative → Representative) : Prop where
  closed :
    ∀ first second : Representative, invariant (rawOperation first second)
  matches_raw :
    ∀ first second : Representative,
      toRaw (operation first second) = rawOperation first second
  respects :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects setoid operation

Predicate logic (unfolded):

  structure BinaryOperationIsProper
    {Representative : Type} {Raw : Type}
    (invariant : Raw → Prop)
    (toRaw : Representative → Raw)
    (rawOperation : Representative → Representative → Raw)
    (setoid : Setoid Representative)
    (operation : Representative → Representative → Representative) : Prop where
  closed :
    ∀ first second : Representative, invariant (rawOperation first second)
  matches_raw :
    ∀ first second : Representative,
      toRaw (operation first second) = rawOperation first second
  respects :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects setoid operation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure BinaryOperationIsProper
    {Representative : Type} {Raw : Type}
    (invariant : Raw → Prop)
    (toRaw : Representative → Raw)
    (rawOperation : Representative → Representative → Raw)
    (setoid : Setoid Representative)
    (operation : Representative → Representative → Representative) : Prop where
  closed :
    ∀ first second : Representative, invariant (rawOperation first second)
  matches_raw :
    ∀ first second : Representative,
      toRaw (operation first second) = rawOperation first second
  respects :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects setoid operation
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
structure BinaryOperationIsProper
    {Representative : Type} {Raw : Type}
    (invariant : Raw → Prop)
    (toRaw : Representative → Raw)
    (rawOperation : Representative → Representative → Raw)
    (setoid : Setoid Representative)
    (operation : Representative → Representative → Representative) : Prop where
  closed :
    ∀ first second : Representative, invariant (rawOperation first second)
  matches_raw :
    ∀ first second : Representative,
      toRaw (operation first second) = rawOperation first second
  respects :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects setoid operation

/--
`BinaryOperationIsProper.induced_operation_exists` TODO

Predicate logic:

  ∃ quotient_operation ∈ Quotient setoid → Quotient setoid → Quotient setoid, ∀ first second : Representative, quotient_operation (Quotient.mk setoid first) (Quotient.mk setoid second) = Quotient.mk setoid (operation first second)

Predicate logic (unfolded):

  ∀ {Representative Raw : Type} {invariant : Raw → Prop} {toRaw : Representative → Raw} {rawOperation : Representative → Representative → Raw} {setoid : Setoid Representative} {operation : Representative → Representative → Representative}, LRA.Operation.Laws.QuotientCompatible.BinaryOperationIsProper invariant toRaw rawOperation setoid operation → Exists fun quotient_operation => ∀ (first second : Representative), quotient_operation (Quot.mk setoid.1 first) (Quot.mk setoid.1 second) = Quot.mk setoid.1 (operation first second)

Logical form (Lean):

```lean
theorem BinaryOperationIsProper.induced_operation_exists
    {Representative : Type} {Raw : Type}
    {invariant : Raw → Prop} {toRaw : Representative → Raw}
    {rawOperation : Representative → Representative → Raw}
    {setoid : Setoid Representative}
    {operation : Representative → Representative → Representative}
    (proper :
      BinaryOperationIsProper invariant toRaw rawOperation setoid operation) :
    ∃ quotient_operation :
        Quotient setoid → Quotient setoid → Quotient setoid,
      ∀ first second : Representative,
        quotient_operation
            (Quotient.mk setoid first) (Quotient.mk setoid second) =
          Quotient.mk setoid (operation first second)
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
theorem BinaryOperationIsProper.induced_operation_exists
    {Representative : Type} {Raw : Type}
    {invariant : Raw → Prop} {toRaw : Representative → Raw}
    {rawOperation : Representative → Representative → Raw}
    {setoid : Setoid Representative}
    {operation : Representative → Representative → Representative}
    (proper :
      BinaryOperationIsProper invariant toRaw rawOperation setoid operation) :
    ∃ quotient_operation :
        Quotient setoid → Quotient setoid → Quotient setoid,
      ∀ first second : Representative,
        quotient_operation
            (Quotient.mk setoid first) (Quotient.mk setoid second) =
          Quotient.mk setoid (operation first second) :=
  sorry

/--
`BinaryOperationIsProper.induced_operation_unique` TODO

Predicate logic:

  (∀ first second : Representative, first_candidate (Quotient.mk setoid first) (Quotient.mk setoid second) = Quotient.mk setoid (operation first second) ∧ ∀ first second : Representative, second_candidate (Quotient.mk setoid first) (Quotient.mk setoid second) = Quotient.mk setoid (operation first second)) → first_candidate = second_candidate

Predicate logic (unfolded):

  ∀ {Representative Raw : Type} {invariant : Raw → Prop} {toRaw : Representative → Raw} {rawOperation : Representative → Representative → Raw} {setoid : Setoid Representative} {operation : Representative → Representative → Representative}, LRA.Operation.Laws.QuotientCompatible.BinaryOperationIsProper invariant toRaw rawOperation setoid operation → ∀ (first_candidate second_candidate : Quot setoid.1 → Quot setoid.1 → Quot setoid.1), (∀ (first second : Representative), first_candidate (Quot.mk setoid.1 first) (Quot.mk setoid.1 second) = Quot.mk setoid.1 (operation first second) ∧ ∀ (first second : Representative), second_candidate (Quot.mk setoid.1 first) (Quot.mk setoid.1 second) = Quot.mk setoid.1 (operation first second)) → first_candidate = second_candidate

Logical form (Lean):

```lean
theorem BinaryOperationIsProper.induced_operation_unique
    {Representative : Type} {Raw : Type}
    {invariant : Raw → Prop} {toRaw : Representative → Raw}
    {rawOperation : Representative → Representative → Raw}
    {setoid : Setoid Representative}
    {operation : Representative → Representative → Representative}
    (_proper :
      BinaryOperationIsProper invariant toRaw rawOperation setoid operation)
    (first_candidate second_candidate :
      Quotient setoid → Quotient setoid → Quotient setoid)
    (first_candidate_spec :
      ∀ first second : Representative,
        first_candidate
            (Quotient.mk setoid first) (Quotient.mk setoid second) =
          Quotient.mk setoid (operation first second))
    (second_candidate_spec :
      ∀ first second : Representative,
        second_candidate
            (Quotient.mk setoid first) (Quotient.mk setoid second) =
          Quotient.mk setoid (operation first second)) :
    first_candidate = second_candidate
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
theorem BinaryOperationIsProper.induced_operation_unique
    {Representative : Type} {Raw : Type}
    {invariant : Raw → Prop} {toRaw : Representative → Raw}
    {rawOperation : Representative → Representative → Raw}
    {setoid : Setoid Representative}
    {operation : Representative → Representative → Representative}
    (_proper :
      BinaryOperationIsProper invariant toRaw rawOperation setoid operation)
    (first_candidate second_candidate :
      Quotient setoid → Quotient setoid → Quotient setoid)
    (first_candidate_spec :
      ∀ first second : Representative,
        first_candidate
            (Quotient.mk setoid first) (Quotient.mk setoid second) =
          Quotient.mk setoid (operation first second))
    (second_candidate_spec :
      ∀ first second : Representative,
        second_candidate
            (Quotient.mk setoid first) (Quotient.mk setoid second) =
          Quotient.mk setoid (operation first second)) :
    first_candidate = second_candidate := by
  sorry

/--
`UnaryOperationIsProper` TODO

Predicate logic:

  structure UnaryOperationIsProper
    {Representative : Type} {Raw : Type}
    (invariant : Raw → Prop)
    (toRaw : Representative → Raw)
    (rawOperation : Representative → Raw)
    (setoid : Setoid Representative)
    (operation : Representative → Representative) : Prop where
  closed : ∀ value : Representative, invariant (rawOperation value)
  matches_raw :
    ∀ value : Representative, toRaw (operation value) = rawOperation value
  respects :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects setoid operation

Predicate logic (unfolded):

  structure UnaryOperationIsProper
    {Representative : Type} {Raw : Type}
    (invariant : Raw → Prop)
    (toRaw : Representative → Raw)
    (rawOperation : Representative → Raw)
    (setoid : Setoid Representative)
    (operation : Representative → Representative) : Prop where
  closed : ∀ value : Representative, invariant (rawOperation value)
  matches_raw :
    ∀ value : Representative, toRaw (operation value) = rawOperation value
  respects :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects setoid operation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure UnaryOperationIsProper
    {Representative : Type} {Raw : Type}
    (invariant : Raw → Prop)
    (toRaw : Representative → Raw)
    (rawOperation : Representative → Raw)
    (setoid : Setoid Representative)
    (operation : Representative → Representative) : Prop where
  closed : ∀ value : Representative, invariant (rawOperation value)
  matches_raw :
    ∀ value : Representative, toRaw (operation value) = rawOperation value
  respects :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects setoid operation
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
structure UnaryOperationIsProper
    {Representative : Type} {Raw : Type}
    (invariant : Raw → Prop)
    (toRaw : Representative → Raw)
    (rawOperation : Representative → Raw)
    (setoid : Setoid Representative)
    (operation : Representative → Representative) : Prop where
  closed : ∀ value : Representative, invariant (rawOperation value)
  matches_raw :
    ∀ value : Representative, toRaw (operation value) = rawOperation value
  respects :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects setoid operation

/--
`UnaryOperationIsProper.inducedOperation` TODO

Predicate logic:

  def UnaryOperationIsProper.inducedOperation
    {Representative : Type} {Raw : Type}
    {invariant : Raw → Prop} {toRaw : Representative → Raw}
    {rawOperation : Representative → Raw} {setoid : Setoid Representative}
    {operation : Representative → Representative}
    (proper : UnaryOperationIsProper invariant toRaw rawOperation setoid operation) :
    Quotient setoid → Quotient setoid :=
  Quotient.lift (fun value => Quotient.mk setoid (operation value))
    (fun first second related => Quotient.sound (proper.respects first second related))

Predicate logic (unfolded):

  def UnaryOperationIsProper.inducedOperation
    {Representative : Type} {Raw : Type}
    {invariant : Raw → Prop} {toRaw : Representative → Raw}
    {rawOperation : Representative → Raw} {setoid : Setoid Representative}
    {operation : Representative → Representative}
    (proper : UnaryOperationIsProper invariant toRaw rawOperation setoid operation) :
    Quotient setoid → Quotient setoid :=
  Quotient.lift (fun value => Quotient.mk setoid (operation value))
    (fun first second related => Quotient.sound (proper.respects first second related)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def UnaryOperationIsProper.inducedOperation
    {Representative : Type} {Raw : Type}
    {invariant : Raw → Prop} {toRaw : Representative → Raw}
    {rawOperation : Representative → Raw} {setoid : Setoid Representative}
    {operation : Representative → Representative}
    (proper : UnaryOperationIsProper invariant toRaw rawOperation setoid operation) :
    Quotient setoid → Quotient setoid :=
  Quotient.lift (fun value => Quotient.mk setoid (operation value))
    (fun first second related => Quotient.sound (proper.respects first second related))
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
def UnaryOperationIsProper.inducedOperation
    {Representative : Type} {Raw : Type}
    {invariant : Raw → Prop} {toRaw : Representative → Raw}
    {rawOperation : Representative → Raw} {setoid : Setoid Representative}
    {operation : Representative → Representative}
    (proper : UnaryOperationIsProper invariant toRaw rawOperation setoid operation) :
    Quotient setoid → Quotient setoid :=
  Quotient.lift (fun value => Quotient.mk setoid (operation value))
    (fun first second related => Quotient.sound (proper.respects first second related))

/--
`RelationIsProper` TODO

Predicate logic:

  structure RelationIsProper
    {Representative : Type}
    (setoid : Setoid Representative)
    (relation : Representative → Representative → Prop) : Prop where
  respects : LRA.UniversalAlgebra.Quotient.relation_respects setoid relation

Predicate logic (unfolded):

  structure RelationIsProper
    {Representative : Type}
    (setoid : Setoid Representative)
    (relation : Representative → Representative → Prop) : Prop where
  respects : LRA.UniversalAlgebra.Quotient.relation_respects setoid relation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RelationIsProper
    {Representative : Type}
    (setoid : Setoid Representative)
    (relation : Representative → Representative → Prop) : Prop where
  respects : LRA.UniversalAlgebra.Quotient.relation_respects setoid relation
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
structure RelationIsProper
    {Representative : Type}
    (setoid : Setoid Representative)
    (relation : Representative → Representative → Prop) : Prop where
  respects : LRA.UniversalAlgebra.Quotient.relation_respects setoid relation

/--
`RelationIsProper.induced_relation_exists` TODO

Predicate logic:

  ∃ quotient_relation ∈ Quotient setoid → Quotient setoid → Prop, ∀ first second : Representative, quotient_relation (Quotient.mk setoid first) (Quotient.mk setoid second) ↔ relation first second

Predicate logic (unfolded):

  ∀ {Representative : Type} {setoid : Setoid Representative} {relation : Representative → Representative → Prop}, LRA.Operation.Laws.QuotientCompatible.RelationIsProper setoid relation → Exists fun quotient_relation => ∀ (first second : Representative), quotient_relation (Quot.mk setoid.1 first) (Quot.mk setoid.1 second) ↔ relation first second

Logical form (Lean):

```lean
theorem RelationIsProper.induced_relation_exists
    {Representative : Type} {setoid : Setoid Representative}
    {relation : Representative → Representative → Prop}
    (proper : RelationIsProper setoid relation) :
    ∃ quotient_relation : Quotient setoid → Quotient setoid → Prop,
      ∀ first second : Representative,
        quotient_relation
            (Quotient.mk setoid first) (Quotient.mk setoid second) ↔
          relation first second
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
theorem RelationIsProper.induced_relation_exists
    {Representative : Type} {setoid : Setoid Representative}
    {relation : Representative → Representative → Prop}
    (proper : RelationIsProper setoid relation) :
    ∃ quotient_relation : Quotient setoid → Quotient setoid → Prop,
      ∀ first second : Representative,
        quotient_relation
            (Quotient.mk setoid first) (Quotient.mk setoid second) ↔
          relation first second :=
  sorry
