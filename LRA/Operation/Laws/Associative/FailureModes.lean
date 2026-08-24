import LRA.Operation.Laws.Associative.Definition

namespace LRA.Operation.Laws.Associative

open LRA.Operation

universe u

/--
`FailsAssociative` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier), LRA.Operation.Laws.Associative.Associative operation → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier), (∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)) → False

Logical form (Lean):

```lean
def FailsAssociative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  ¬ Associative operation
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
def FailsAssociative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  ¬ Associative operation

/--
`NaturalSubtraction` TODO

Predicate logic:

  def NaturalSubtraction : BinaryEndoOperation Nat :=
  fun left right => left - right

Predicate logic (unfolded):

  def NaturalSubtraction : BinaryEndoOperation Nat :=
  fun left right => left - right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalSubtraction : BinaryEndoOperation Nat :=
  fun left right => left - right
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
def NaturalSubtraction : BinaryEndoOperation Nat :=
  fun left right => left - right

/--
`NaturalSubtractionFailsAssociative` TODO

Predicate logic:

  FailsAssociative NaturalSubtraction

Predicate logic (unfolded):

  (∀ (first second third : Nat), instHSub.1 (instHSub.hSub first second) third = instHSub.1 first (instHSub.hSub second third)) → False

Logical form (Lean):

```lean
theorem NaturalSubtractionFailsAssociative :
    FailsAssociative NaturalSubtraction
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
theorem NaturalSubtractionFailsAssociative :
    FailsAssociative NaturalSubtraction := by
  sorry

end LRA.Operation.Laws.Associative
