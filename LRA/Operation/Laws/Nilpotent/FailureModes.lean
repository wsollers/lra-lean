import LRA.Operation.Laws.Nilpotent.Definition

namespace LRA.Operation.Laws.Nilpotent

open LRA.Operation

universe u

/--
`FailsNilpotentElement` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (zero element : Carrier), LRA.Operation.Laws.Nilpotent.NilpotentElement operation zero element → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (zero element : Carrier), (Exists fun positiveExponent => LRA.Operation.Laws.Nilpotent.PositivePower operation element positiveExponent = zero) → False

Logical form (Lean):

```lean
def FailsNilpotentElement {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (zero element : Carrier) : Prop :=
  Not (NilpotentElement operation zero element)
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
def FailsNilpotentElement {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (zero element : Carrier) : Prop :=
  Not (NilpotentElement operation zero element)

/--
`NaturalMultiplicationForNilpotenceFailure` TODO

Predicate logic:

  def NaturalMultiplicationForNilpotenceFailure : BinaryEndoOperation Nat :=
  fun left right => left * right

Predicate logic (unfolded):

  def NaturalMultiplicationForNilpotenceFailure : BinaryEndoOperation Nat :=
  fun left right => left * right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalMultiplicationForNilpotenceFailure : BinaryEndoOperation Nat :=
  fun left right => left * right
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
def NaturalMultiplicationForNilpotenceFailure : BinaryEndoOperation Nat :=
  fun left right => left * right

/--
`NaturalOneFailsNilpotentUnderMultiplication` TODO

Predicate logic:

  FailsNilpotentElement NaturalMultiplicationForNilpotenceFailure 0 1

Predicate logic (unfolded):

  (Exists fun positiveExponent => LRA.Operation.Laws.Nilpotent.PositivePower LRA.Operation.Laws.Nilpotent.NaturalMultiplicationForNilpotenceFailure (instOfNatNat 1).1 positiveExponent = instOfNatNat 0.1) → False

Logical form (Lean):

```lean
theorem NaturalOneFailsNilpotentUnderMultiplication :
    FailsNilpotentElement NaturalMultiplicationForNilpotenceFailure 0 1
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
theorem NaturalOneFailsNilpotentUnderMultiplication :
    FailsNilpotentElement NaturalMultiplicationForNilpotenceFailure 0 1 := by
  sorry

end LRA.Operation.Laws.Nilpotent
