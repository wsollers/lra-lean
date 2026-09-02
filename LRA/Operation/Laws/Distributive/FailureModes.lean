import LRA.Operation.Laws.Distributive.Definition

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

universe u

/--
`FailsLeftDistributive` TODO

Predicate logic:

  ∀ {Carrier : Type u} (outer inner : LRA.Operation.BinaryEndoOperation Carrier), LRA.Operation.Laws.Distributive.LeftDistributive outer inner → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (outer inner : Carrier → Carrier → Carrier), (∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)) → False

Logical form (Lean):

```lean
def FailsLeftDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  Not (LeftDistributive outer inner)
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
def FailsLeftDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  Not (LeftDistributive outer inner)

/--
`FailsRightDistributive` TODO

Predicate logic:

  ∀ {Carrier : Type u} (outer inner : LRA.Operation.BinaryEndoOperation Carrier), LRA.Operation.Laws.Distributive.RightDistributive outer inner → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (outer inner : Carrier → Carrier → Carrier), (∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third)) → False

Logical form (Lean):

```lean
def FailsRightDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  Not (RightDistributive outer inner)
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
def FailsRightDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  Not (RightDistributive outer inner)

/--
`NaturalAdditionForDistributiveFailure` TODO

Predicate logic:

  def NaturalAdditionForDistributiveFailure : BinaryEndoOperation Nat :=
  fun left right => left + right

Predicate logic (unfolded):

  def NaturalAdditionForDistributiveFailure : BinaryEndoOperation Nat :=
  fun left right => left + right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalAdditionForDistributiveFailure : BinaryEndoOperation Nat :=
  fun left right => left + right
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
def NaturalAdditionForDistributiveFailure : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
`NaturalMultiplicationForDistributiveFailure` TODO

Predicate logic:

  def NaturalMultiplicationForDistributiveFailure : BinaryEndoOperation Nat :=
  fun left right => left * right

Predicate logic (unfolded):

  def NaturalMultiplicationForDistributiveFailure : BinaryEndoOperation Nat :=
  fun left right => left * right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalMultiplicationForDistributiveFailure : BinaryEndoOperation Nat :=
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
def NaturalMultiplicationForDistributiveFailure : BinaryEndoOperation Nat :=
  fun left right => left * right

/--
`NaturalAdditionFailsLeftDistributiveOverMultiplication` TODO

Predicate logic:

  FailsLeftDistributive NaturalAdditionForDistributiveFailure NaturalMultiplicationForDistributiveFailure

Predicate logic (unfolded):

  (∀ (left right third : Nat), instHAdd.1 left (instHMul.hMul right third) = instHMul.1 (instHAdd.hAdd left right) (instHAdd.hAdd left third)) → False

Logical form (Lean):

```lean
theorem NaturalAdditionFailsLeftDistributiveOverMultiplication :
    FailsLeftDistributive
      NaturalAdditionForDistributiveFailure
      NaturalMultiplicationForDistributiveFailure
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
theorem NaturalAdditionFailsLeftDistributiveOverMultiplication :
    FailsLeftDistributive
      NaturalAdditionForDistributiveFailure
      NaturalMultiplicationForDistributiveFailure := by
  sorry
/--
`NaturalAdditionFailsRightDistributiveOverMultiplication` TODO

Predicate logic:

  FailsRightDistributive NaturalAdditionForDistributiveFailure NaturalMultiplicationForDistributiveFailure

Predicate logic (unfolded):

  (∀ (left right third : Nat), instHAdd.1 (instHMul.hMul left right) third = instHMul.1 (instHAdd.hAdd left third) (instHAdd.hAdd right third)) → False

Logical form (Lean):

```lean
theorem NaturalAdditionFailsRightDistributiveOverMultiplication :
    FailsRightDistributive
      NaturalAdditionForDistributiveFailure
      NaturalMultiplicationForDistributiveFailure
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
theorem NaturalAdditionFailsRightDistributiveOverMultiplication :
    FailsRightDistributive
      NaturalAdditionForDistributiveFailure
      NaturalMultiplicationForDistributiveFailure := by
  sorry
end LRA.Operation.Laws.Distributive
