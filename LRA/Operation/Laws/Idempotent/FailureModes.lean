import LRA.Operation.Laws.Idempotent.Definition

namespace LRA.Operation.Laws.Idempotent

open LRA.Operation

universe u

/--
`FailsIdempotent` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier), LRA.Operation.Laws.Idempotent.Idempotent operation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (element : Carrier), operation element element = element) → False

Logical form (Lean):

```lean
def FailsIdempotent {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (Idempotent operation)
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
def FailsIdempotent {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (Idempotent operation)

/--
`NaturalAddition` TODO

Predicate logic:

  def NaturalAddition : BinaryEndoOperation Nat :=
    fun left right => left + right

Predicate logic (unfolded):

  def NaturalAddition : BinaryEndoOperation Nat :=
    fun left right => left + right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalAddition : BinaryEndoOperation Nat :=
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
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
`NaturalAdditionFailsIdempotent` TODO

Predicate logic:

  LRA.Operation.Laws.Idempotent.FailsIdempotent LRA.Operation.Laws.Idempotent.NaturalAddition

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (element : Nat), { hAdd := fun a b => instAddNat.add a b }.hAdd element element = element) → False

Logical form (Lean):

```lean
theorem NaturalAdditionFailsIdempotent :
    FailsIdempotent NaturalAddition
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
theorem NaturalAdditionFailsIdempotent :
    FailsIdempotent NaturalAddition := by
  sorry
end LRA.Operation.Laws.Idempotent
