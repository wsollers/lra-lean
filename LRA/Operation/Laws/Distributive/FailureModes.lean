import LRA.Operation.Laws.Distributive.Definition

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

universe u

/--
`FailsLeftDistributive` TODO

Predicate logic:

  ∀ {Carrier : Type u} (outer inner : LRA.Operation.BinaryEndoOperation Carrier), LRA.Operation.Laws.Distributive.LeftDistributive outer inner → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)) → False

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third)) → False

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

  LRA.Operation.Laws.Distributive.FailsLeftDistributive LRA.Operation.Laws.Distributive.NaturalAdditionForDistributiveFailure LRA.Operation.Laws.Distributive.NaturalMultiplicationForDistributiveFailure

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (left right third : Nat), { hAdd := fun a b => instAddNat.add a b }.hAdd left ({ hMul := fun a b => instMulNat.mul a b }.hMul right third) = { hMul := fun a b => instMulNat.mul a b }.hMul ({ hAdd := fun a b => instAddNat.add a b }.hAdd left right) ({ hAdd := fun a b => instAddNat.add a b }.hAdd left third)) → False

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

  LRA.Operation.Laws.Distributive.FailsRightDistributive LRA.Operation.Laws.Distributive.NaturalAdditionForDistributiveFailure LRA.Operation.Laws.Distributive.NaturalMultiplicationForDistributiveFailure

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (left right third : Nat), { hAdd := fun a b => instAddNat.add a b }.hAdd ({ hMul := fun a b => instMulNat.mul a b }.hMul left right) third = { hMul := fun a b => instMulNat.mul a b }.hMul ({ hAdd := fun a b => instAddNat.add a b }.hAdd left third) ({ hAdd := fun a b => instAddNat.add a b }.hAdd right third)) → False

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
