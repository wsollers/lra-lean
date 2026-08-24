import LRA.Operation.Definition

namespace LRA.Operation.Laws.Nilpotent

open LRA.Operation

universe u

/--
`OperationPower` TODO

Predicate logic:

  def OperationPower {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier) : Nat → Carrier
  | 0 => identity
  | Nat.succ exponent => operation (OperationPower operation identity element exponent) element

Predicate logic (unfolded):

  def OperationPower {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier) : Nat → Carrier
  | 0 => identity
  | Nat.succ exponent => operation (OperationPower operation identity element exponent) element (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OperationPower {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier) : Nat → Carrier
  | 0 => identity
  | Nat.succ exponent => operation (OperationPower operation identity element exponent) element
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
def OperationPower {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier) : Nat → Carrier
  | 0 => identity
  | Nat.succ exponent => operation (OperationPower operation identity element exponent) element

/--
`PositivePower` TODO

Predicate logic:

  def PositivePower {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier) : Nat → Carrier
  | 0 => element
  | Nat.succ exponent => operation (PositivePower operation element exponent) element

Predicate logic (unfolded):

  def PositivePower {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier) : Nat → Carrier
  | 0 => element
  | Nat.succ exponent => operation (PositivePower operation element exponent) element (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PositivePower {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier) : Nat → Carrier
  | 0 => element
  | Nat.succ exponent => operation (PositivePower operation element exponent) element
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
def PositivePower {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier) : Nat → Carrier
  | 0 => element
  | Nat.succ exponent => operation (PositivePower operation element exponent) element

/--
`NilpotentElement` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (zero element : Carrier), Exists fun positiveExponent => LRA.Operation.Laws.Nilpotent.PositivePower operation element positiveExponent = zero

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (zero element : Carrier), Exists fun positiveExponent => LRA.Operation.Laws.Nilpotent.PositivePower operation element positiveExponent = zero

Logical form (Lean):

```lean
def NilpotentElement {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (zero element : Carrier) : Prop :=
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

Related proof moves: use, rcases, unfold

-/
def NilpotentElement {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (zero element : Carrier) : Prop :=
  ∃ positiveExponent : Nat,
    PositivePower operation element positiveExponent = zero

end LRA.Operation.Laws.Nilpotent
