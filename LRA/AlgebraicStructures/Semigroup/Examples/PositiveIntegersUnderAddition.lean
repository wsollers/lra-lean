import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.Semigroup.Examples

/-! Positive integers under addition — `(ℕ_{>0}, +)`. Associative (inherited from
`ℕ`'s own addition being associative) and closed (sum of two positive naturals is
positive), but has no identity: `0 ∉ ℕ_{>0}`. That missing identity is exactly why
this is a semigroup and not a monoid — it becomes Monoid's own `Failures/` example
once that item comes up.

Wrapped in a one-field structure, same reason as `Magma.Examples.IntegersUnderSubtraction`
— `Nat` already has its own native `Mul` (ordinary multiplication), so `*` here has to
mean addition on a distinct type, not `Nat` itself. -/

/--
`NaturalsUnderAddition` TODO

Predicate logic:

  structure NaturalsUnderAddition where
    val : Nat

Predicate logic (unfolded):

  structure NaturalsUnderAddition where
    val : Nat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure NaturalsUnderAddition where
  val : Nat
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
structure NaturalsUnderAddition where
  val : Nat

instance : Mul NaturalsUnderAddition := ⟨fun a b => ⟨a.val + b.val⟩⟩
instance : Nonempty NaturalsUnderAddition := ⟨⟨0⟩⟩

instance : LRA.AlgebraicStructures.MultiplicativeSemigroupLaws NaturalsUnderAddition where
  MulAssociative := fun a b c =>
    congrArg NaturalsUnderAddition.mk (Nat.add_assoc a.val b.val c.val)
/--
`PositiveIntegers` TODO

Predicate logic:

  ∀ (a : LRA.AlgebraicStructures.Semigroup.Examples.NaturalsUnderAddition), (Nat.succ 0).le a.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Nat.succ 0).le a.1

Logical form (Lean):

```lean
def PositiveIntegers : LRA.Set.LRA_Set NaturalsUnderAddition := {n | 0 < n.val}
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
def PositiveIntegers : LRA.Set.LRA_Set NaturalsUnderAddition := {n | 0 < n.val}

/--
`positiveIntegersClosedUnderAddition` TODO

Predicate logic:

  ∀ (a b : LRA.AlgebraicStructures.Semigroup.Examples.NaturalsUnderAddition), (a ∈ LRA.AlgebraicStructures.Semigroup.Examples.PositiveIntegers ∧ b ∈ LRA.AlgebraicStructures.Semigroup.Examples.PositiveIntegers) → instHMul.hMul a b ∈ LRA.AlgebraicStructures.Semigroup.Examples.PositiveIntegers

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (a ∈ LRA.AlgebraicStructures.Semigroup.Examples.PositiveIntegers ∧ b ∈ LRA.AlgebraicStructures.Semigroup.Examples.PositiveIntegers) → { hMul := fun a b => LRA.AlgebraicStructures.Semigroup.Examples.instMulNaturalsUnderAddition.mul a b }.hMul a b ∈ LRA.AlgebraicStructures.Semigroup.Examples.PositiveIntegers

Logical form (Lean):

```lean
theorem positiveIntegersClosedUnderAddition :
    ∀ a b, a ∈ PositiveIntegers → b ∈ PositiveIntegers → a * b ∈ PositiveIntegers
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem positiveIntegersClosedUnderAddition :
    ∀ a b, a ∈ PositiveIntegers → b ∈ PositiveIntegers → a * b ∈ PositiveIntegers := by
  sorry
noncomputable instance : Mul {n // n ∈ PositiveIntegers} :=
  Magma.Constructions.ClosedSubsetMul positiveIntegersClosedUnderAddition

noncomputable instance : Nonempty {n // n ∈ PositiveIntegers} :=
  ⟨⟨1⟩, Nat.one_pos⟩

noncomputable instance :
    LRA.AlgebraicStructures.MultiplicativeSemigroupLaws {n // n ∈ PositiveIntegers} :=
  Semigroup.Constructions.ClosedSubsetSemigroupLaws positiveIntegersClosedUnderAddition
end LRA.AlgebraicStructures.Semigroup.Examples
