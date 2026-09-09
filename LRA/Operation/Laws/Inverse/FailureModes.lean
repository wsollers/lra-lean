import LRA.Operation.Laws.Inverse.Definition

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

universe u

/--
`FailsTwoSidedInverse` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity : Carrier) (inverse : LRA.Operation.UnaryEndoOperation Carrier), LRA.Operation.Laws.Inverse.TwoSidedInverse operation identity inverse → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (element : Carrier), operation (inverse element) element = identity) ∧ (∀ (element : Carrier), operation element (inverse element) = identity)) → False

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

  LRA.Operation.Laws.Inverse.FailsTwoSidedInverse LRA.Operation.Laws.Inverse.NaturalAdditionForInverseFailure 0 LRA.Operation.Laws.Inverse.ConstantZeroNaturalInverseCandidate

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (element : Nat), { hAdd := fun a b => instAddNat.add a b }.hAdd 0 element = 0) ∧ (∀ (element : Nat), { hAdd := fun a b => instAddNat.add a b }.hAdd element 0 = 0)) → False

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

  ¬ Exists fun inverse => LRA.Operation.Laws.Inverse.TwoSidedInverse LRA.Operation.Laws.Inverse.NaturalAdditionForInverseFailure 0 inverse

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun inverse => ((∀ (element : Nat), { hAdd := fun a b => instAddNat.add a b }.hAdd (inverse element) element = 0) ∧ (∀ (element : Nat), { hAdd := fun a b => instAddNat.add a b }.hAdd element (inverse element) = 0))) → False

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
