import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.AdditiveSemigroup.Examples

/-! Positive natural numbers under addition — `(ℕ_{>0}, +)`. Associative
(`Nat.add_assoc`, Lean core) and closed (sum of two positive naturals is
positive), but has no identity: `0 ∉ ℕ_{>0}`. Unlike the `Mul`-based examples
elsewhere in this tree, no wrapper structure is needed here — `Nat`'s native
`Add` already is the operation this subject is about. Proved directly against
core lemmas rather than through the Mathlib bridge, since neither `Nat` nor
`Int` need Mathlib to state associativity of their native `+`. -/

instance : LRA.AlgebraicStructures.AdditiveSemigroupLaws Nat := by
  sorry
/--
`PositiveNaturals` TODO

Predicate logic:

  ∀ (a : Nat), (Nat.succ 0).le a

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Nat.succ 0).le a

Logical form (Lean):

```lean
def PositiveNaturals : LRA.Set.LRA_Set Nat := {n | 0 < n}
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
def PositiveNaturals : LRA.Set.LRA_Set Nat := {n | 0 < n}

/--
`positiveNaturalsClosedUnderAddition` TODO

Predicate logic:

  ∀ (a b : Nat), (a ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveNaturals ∧ b ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveNaturals) → instHAdd.hAdd a b ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveNaturals

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (a ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveNaturals ∧ b ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveNaturals) → { hAdd := fun a b => instAddNat.add a b }.hAdd a b ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveNaturals

Logical form (Lean):

```lean
theorem positiveNaturalsClosedUnderAddition :
    ∀ a b, a ∈ PositiveNaturals → b ∈ PositiveNaturals → a + b ∈ PositiveNaturals
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
theorem positiveNaturalsClosedUnderAddition :
    ∀ a b, a ∈ PositiveNaturals → b ∈ PositiveNaturals → a + b ∈ PositiveNaturals := by
  sorry
noncomputable instance : Add {n // n ∈ PositiveNaturals} :=
  LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.ClosedSubsetAdd
    positiveNaturalsClosedUnderAddition

noncomputable instance : Nonempty {n // n ∈ PositiveNaturals} := by
  sorry

noncomputable instance :
    LRA.AlgebraicStructures.AdditiveSemigroupLaws {n // n ∈ PositiveNaturals} := by
  sorry
end LRA.AlgebraicStructures.AdditiveSemigroup.Examples
