import Mathlib.Algebra.Group.Even
import Mathlib.Tactic.Ring
import LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveNaturalsUnderAddition

namespace LRA.AlgebraicStructures.AdditiveSemigroup.Examples

/-! Positive even naturals under addition — `(2ℕ_{>0}, +) = ({2, 4, 6, ...}, +)`.
Distinct from `EvenIntegersUnderAddition` (which used `Int`): here the carrier
is `Nat`, so `0` is excluded by positivity rather than being available as (and
then discarded as) the additive identity — same distinction already drawn for
`CommutativeSemigroup.Examples.PositiveEvenNaturalsUnderMultiplication`. Reuses
the `AdditiveSemigroupLaws Nat` instance from `PositiveNaturalsUnderAddition`. -/

/--
`PositiveEvenNaturals` TODO

Predicate logic:

  ∀ (a : Nat), (instLTNat.lt 0 a ∧ Even a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (instLTNat.lt 0 a ∧ Exists fun r => a = { hAdd := fun a b => instAddNat.add a b }.hAdd r r)

Logical form (Lean):

```lean
def PositiveEvenNaturals : LRA.Set.LRA_Set Nat := {n | 0 < n ∧ Even n}
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def PositiveEvenNaturals : LRA.Set.LRA_Set Nat := {n | 0 < n ∧ Even n}

/--
`positiveEvenNaturalsClosedUnderAddition` TODO

Predicate logic:

  ∀ (a b : Nat), (a ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveEvenNaturals ∧ b ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveEvenNaturals) → instHAdd.hAdd a b ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveEvenNaturals

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (a ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveEvenNaturals ∧ b ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveEvenNaturals) → { hAdd := fun a b => instAddNat.add a b }.hAdd a b ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveEvenNaturals

Logical form (Lean):

```lean
theorem positiveEvenNaturalsClosedUnderAddition :
    ∀ a b, a ∈ PositiveEvenNaturals → b ∈ PositiveEvenNaturals →
      a + b ∈ PositiveEvenNaturals
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
theorem positiveEvenNaturalsClosedUnderAddition :
    ∀ a b, a ∈ PositiveEvenNaturals → b ∈ PositiveEvenNaturals →
      a + b ∈ PositiveEvenNaturals := by
  sorry
noncomputable instance : Add {n // n ∈ PositiveEvenNaturals} :=
  LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.ClosedSubsetAdd
    positiveEvenNaturalsClosedUnderAddition

noncomputable instance : Nonempty {n // n ∈ PositiveEvenNaturals} := by
  sorry

noncomputable instance :
    LRA.AlgebraicStructures.AdditiveSemigroupLaws {n // n ∈ PositiveEvenNaturals} := by
  sorry
end LRA.AlgebraicStructures.AdditiveSemigroup.Examples
