import Mathlib.Algebra.Group.Even
import Mathlib.Tactic.Ring
import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.CommutativeSemigroup.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.CommutativeSemigroup.Examples

/-! Positive even naturals under multiplication — `(2ℕ_{>0}, ×)`. Distinct from
`Semigroup.Examples.EvenIntegersUnderMultiplication` (which used `Int`): here the
carrier is `Nat`, so `0 ∉ 2ℕ_{>0}` is what rules out an identity for the
*additive* structure, while `1` itself is excluded by the evenness condition,
same as on the integers. Wrapped in a one-field structure, same reason as
elsewhere in this tree — `Nat` already has its own native `Mul` (ordinary
multiplication), so a distinct carrier type keeps this `*` unambiguous. -/

/--
`NaturalsUnderMultiplication` TODO

Predicate logic:

  structure NaturalsUnderMultiplication where
    val : Nat

Predicate logic (unfolded):

  structure NaturalsUnderMultiplication where
    val : Nat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure NaturalsUnderMultiplication where
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
structure NaturalsUnderMultiplication where
  val : Nat

instance : Mul NaturalsUnderMultiplication := ⟨fun a b => ⟨a.val * b.val⟩⟩
instance : Nonempty NaturalsUnderMultiplication := ⟨⟨1⟩⟩

instance :
    LRA.AlgebraicStructures.CommutativeSemigroupLaws NaturalsUnderMultiplication where
  MulAssociative := by
    intro a b c
    sorry
  MulCommutative := by
    intro a b
    sorry
/--
`PositiveEvenNaturals` TODO

Predicate logic:

  ∀ (a : LRA.AlgebraicStructures.CommutativeSemigroup.Examples.NaturalsUnderMultiplication), (instLTNat.lt 0 a.val ∧ Even a.val)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (instLTNat.lt 0 a.1 ∧ Exists fun r => a.1 = { hAdd := fun a b => instAddNat.add a b }.hAdd r r)

Logical form (Lean):

```lean
def PositiveEvenNaturals : LRA.Set.LRA_Set NaturalsUnderMultiplication :=
  {n | 0 < n.val ∧ Even n.val}
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
def PositiveEvenNaturals : LRA.Set.LRA_Set NaturalsUnderMultiplication :=
  {n | 0 < n.val ∧ Even n.val}

/--
`positiveEvenNaturalsClosedUnderMultiplication` TODO

Predicate logic:

  ∀ (a b : LRA.AlgebraicStructures.CommutativeSemigroup.Examples.NaturalsUnderMultiplication), (a ∈ LRA.AlgebraicStructures.CommutativeSemigroup.Examples.PositiveEvenNaturals ∧ b ∈ LRA.AlgebraicStructures.CommutativeSemigroup.Examples.PositiveEvenNaturals) → instHMul.hMul a b ∈ LRA.AlgebraicStructures.CommutativeSemigroup.Examples.PositiveEvenNaturals

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (a ∈ LRA.AlgebraicStructures.CommutativeSemigroup.Examples.PositiveEvenNaturals ∧ b ∈ LRA.AlgebraicStructures.CommutativeSemigroup.Examples.PositiveEvenNaturals) → { hMul := fun a b => LRA.AlgebraicStructures.CommutativeSemigroup.Examples.instMulNaturalsUnderMultiplication.mul a b }.hMul a b ∈ LRA.AlgebraicStructures.CommutativeSemigroup.Examples.PositiveEvenNaturals

Logical form (Lean):

```lean
theorem positiveEvenNaturalsClosedUnderMultiplication :
    ∀ a b, a ∈ PositiveEvenNaturals → b ∈ PositiveEvenNaturals →
      a * b ∈ PositiveEvenNaturals
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
theorem positiveEvenNaturalsClosedUnderMultiplication :
    ∀ a b, a ∈ PositiveEvenNaturals → b ∈ PositiveEvenNaturals →
      a * b ∈ PositiveEvenNaturals := by
  sorry
noncomputable instance : Mul {n // n ∈ PositiveEvenNaturals} :=
  LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul
    positiveEvenNaturalsClosedUnderMultiplication

noncomputable instance : Nonempty {n // n ∈ PositiveEvenNaturals} :=
  ⟨⟨2⟩, Nat.zero_lt_two, 1, rfl⟩

noncomputable instance :
    LRA.AlgebraicStructures.CommutativeSemigroupLaws {n // n ∈ PositiveEvenNaturals} where
  MulAssociative := by
    intro a b c
    sorry
  MulCommutative := by
    intro a b
    sorry
end LRA.AlgebraicStructures.CommutativeSemigroup.Examples
