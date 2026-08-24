import LRA.Operation.Laws.Inverse.Definition

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

universe u

/--
`FailsTwoSidedInverse` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity : Carrier) (inverse : LRA.Operation.UnaryEndoOperation Carrier), LRA.Operation.Laws.Inverse.TwoSidedInverse operation identity inverse → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (identity : Carrier) (inverse : Carrier → Carrier), (∀ (element : Carrier), operation (inverse element) element = identity ∧ ∀ (element : Carrier), operation element (inverse element) = identity) → False

Logical form (Lean):

```lean
def FailsTwoSidedInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  Not (TwoSidedInverse operation identity inverse)
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
def FailsTwoSidedInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  Not (TwoSidedInverse operation identity inverse)

/--
`NaturalAdditionForInverseFailure` TODO

Predicate logic:

  def NaturalAdditionForInverseFailure : BinaryEndoOperation Nat :=
  fun left right => left + right

Predicate logic (unfolded):

  def NaturalAdditionForInverseFailure : BinaryEndoOperation Nat :=
  fun left right => left + right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalAdditionForInverseFailure : BinaryEndoOperation Nat :=
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
def NaturalAdditionForInverseFailure : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
`ConstantZeroNaturalInverseCandidate` TODO

Predicate logic:

  def ConstantZeroNaturalInverseCandidate : UnaryEndoOperation Nat :=
  fun _ => 0

Predicate logic (unfolded):

  def ConstantZeroNaturalInverseCandidate : UnaryEndoOperation Nat :=
  fun _ => 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ConstantZeroNaturalInverseCandidate : UnaryEndoOperation Nat :=
  fun _ => 0
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
def ConstantZeroNaturalInverseCandidate : UnaryEndoOperation Nat :=
  fun _ => 0

/--
`NaturalAdditionFailsConstantZeroInverse` TODO

Predicate logic:

  FailsTwoSidedInverse NaturalAdditionForInverseFailure 0 ConstantZeroNaturalInverseCandidate

Predicate logic (unfolded):

  (∀ (element : Nat), instHAdd.1 (LRA.Operation.Laws.Inverse.ConstantZeroNaturalInverseCandidate element) element = instOfNatNat 0.1 ∧ ∀ (element : Nat), instHAdd.1 element (LRA.Operation.Laws.Inverse.ConstantZeroNaturalInverseCandidate element) = instOfNatNat 0.1) → False

Logical form (Lean):

```lean
theorem NaturalAdditionFailsConstantZeroInverse :
    FailsTwoSidedInverse
      NaturalAdditionForInverseFailure
      0
      ConstantZeroNaturalInverseCandidate
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
theorem NaturalAdditionFailsConstantZeroInverse :
    FailsTwoSidedInverse
      NaturalAdditionForInverseFailure
      0
      ConstantZeroNaturalInverseCandidate := by
  sorry

/--
`NaturalAdditionHasNoTwoSidedInverseOperation` TODO

Predicate logic:

  Not ∃ inverse ∈ UnaryEndoOperation Nat, TwoSidedInverse NaturalAdditionForInverseFailure 0 inverse

Predicate logic (unfolded):

  (Exists fun inverse => (∀ (element : Nat), instHAdd.1 (inverse element) element = instOfNatNat 0.1 ∧ ∀ (element : Nat), instHAdd.1 element (inverse element) = instOfNatNat 0.1)) → False

Logical form (Lean):

```lean
theorem NaturalAdditionHasNoTwoSidedInverseOperation :
    Not
      (∃ inverse : UnaryEndoOperation Nat,
        TwoSidedInverse NaturalAdditionForInverseFailure 0 inverse)
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
theorem NaturalAdditionHasNoTwoSidedInverseOperation :
    Not
      (∃ inverse : UnaryEndoOperation Nat,
        TwoSidedInverse NaturalAdditionForInverseFailure 0 inverse) := by
  sorry

end LRA.Operation.Laws.Inverse
