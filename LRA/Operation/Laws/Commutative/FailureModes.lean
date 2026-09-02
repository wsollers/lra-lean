import LRA.Operation.Laws.Commutative.Definition

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

universe u

/--
`FailsCommutative` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier), LRA.Operation.Laws.Commutative.Commutative operation → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier), (∀ (first second : Carrier), operation first second = operation second first) → False

Logical form (Lean):

```lean
def FailsCommutative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (Commutative operation)
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
def FailsCommutative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (Commutative operation)

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
`NaturalSubtractionFailsCommutative` TODO

Predicate logic:

  FailsCommutative NaturalSubtraction

Predicate logic (unfolded):

  (∀ (first second : Nat), instHSub.1 first second = instHSub.1 second first) → False

Logical form (Lean):

```lean
theorem NaturalSubtractionFailsCommutative :
    FailsCommutative NaturalSubtraction
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
theorem NaturalSubtractionFailsCommutative :
    FailsCommutative NaturalSubtraction := by
  sorry
end LRA.Operation.Laws.Commutative
