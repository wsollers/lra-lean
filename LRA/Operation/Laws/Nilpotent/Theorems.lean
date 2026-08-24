import LRA.Operation.Laws.Nilpotent.Definition

namespace LRA.Operation.Laws.Nilpotent

open LRA.Operation

universe u

/--
`NilpotentElement.apply` TODO

Predicate logic:

  ∃ positiveExponent ∈ Nat, PositivePower operation element positiveExponent = zero

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {zero element : Carrier}, (Exists fun positiveExponent => LRA.Operation.Laws.Nilpotent.PositivePower operation element positiveExponent = zero) → Exists fun positiveExponent => LRA.Operation.Laws.Nilpotent.PositivePower operation element positiveExponent = zero

Logical form (Lean):

```lean
theorem NilpotentElement.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {zero element : Carrier}
    (law : NilpotentElement operation zero element) :
    ∃ positiveExponent : Nat,
      PositivePower operation element positiveExponent = zero
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem NilpotentElement.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {zero element : Carrier}
    (law : NilpotentElement operation zero element) :
    ∃ positiveExponent : Nat,
      PositivePower operation element positiveExponent = zero := by
  sorry

/--
`PositivePower.first` TODO

Predicate logic:

  (∀ element ∈ Carrier), PositivePower operation element 0 = element

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (element : Carrier), LRA.Operation.Laws.Nilpotent.PositivePower operation element (instOfNatNat 0).1 = element

Logical form (Lean):

```lean
theorem PositivePower.first {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier) :
    PositivePower operation element 0 = element
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
theorem PositivePower.first {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier) :
    PositivePower operation element 0 = element := by
  sorry

/--
`PositivePower.succ` TODO

Predicate logic:

  (∀ element ∈ Carrier ∀ exponent ∈ Nat), PositivePower operation element (Nat.succ exponent) = operation (PositivePower operation element exponent) element

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (element : Carrier) (exponent : Nat), LRA.Operation.Laws.Nilpotent.PositivePower operation element exponent.succ = operation (LRA.Operation.Laws.Nilpotent.PositivePower operation element exponent) element

Logical form (Lean):

```lean
theorem PositivePower.succ {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier)
    (exponent : Nat) :
    PositivePower operation element (Nat.succ exponent) =
      operation (PositivePower operation element exponent) element
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
theorem PositivePower.succ {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier)
    (exponent : Nat) :
    PositivePower operation element (Nat.succ exponent) =
      operation (PositivePower operation element exponent) element := by
  sorry

/--
`OperationPower.one` TODO

Predicate logic:

  (∀ identity element ∈ Carrier), OperationPower operation identity element 1 = operation identity element

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (identity element : Carrier), LRA.Operation.Laws.Nilpotent.OperationPower operation identity element (instOfNatNat 1).1 = operation identity element

Logical form (Lean):

```lean
theorem OperationPower.one {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier) :
    OperationPower operation identity element 1 = operation identity element
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
theorem OperationPower.one {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier) :
    OperationPower operation identity element 1 = operation identity element := by
  sorry

/--
`OperationPower.succ` TODO

Predicate logic:

  (∀ identity element ∈ Carrier ∀ exponent ∈ Nat), OperationPower operation identity element (Nat.succ exponent) = operation (OperationPower operation identity element exponent) element

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (identity element : Carrier) (exponent : Nat), LRA.Operation.Laws.Nilpotent.OperationPower operation identity element exponent.succ = operation (LRA.Operation.Laws.Nilpotent.OperationPower operation identity element exponent) element

Logical form (Lean):

```lean
theorem OperationPower.succ {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier)
    (exponent : Nat) :
    OperationPower operation identity element (Nat.succ exponent) =
      operation (OperationPower operation identity element exponent) element
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
theorem OperationPower.succ {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier)
    (exponent : Nat) :
    OperationPower operation identity element (Nat.succ exponent) =
      operation (OperationPower operation identity element exponent) element := by
  sorry

end LRA.Operation.Laws.Nilpotent
