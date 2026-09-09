import Mathlib.Algebra.Group.Even
import Mathlib.Tactic.Ring
import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Semigroup.Examples

/-! Even integers under multiplication — `(2ℤ, ×)`. Closed (product of two evens is
even) and associative (inherited from `ℤ`'s own multiplication), but has no
multiplicative identity: `1 ∉ 2ℤ`. Same shape as the positive-integers example, this
time under `Int`'s ordinary `Mul` rather than a repurposed operation.
`MultiplicativeSemigroupLaws Int` comes for free from the Mathlib bridge instance in
`Constructions/Mathlib/Laws.lean` — `Int` is already a Mathlib `Semigroup`. -/

/--
`EvenIntegers` TODO

Predicate logic:

  ∀ (a : Int), Exists fun r => a = instHAdd.hAdd r r

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun r => a = { hAdd := fun a b => Int.instAdd.add a b }.hAdd r r

Logical form (Lean):

```lean
def EvenIntegers : LRA.Set.LRA_Set Int := {n | Even n}
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
def EvenIntegers : LRA.Set.LRA_Set Int := {n | Even n}

/--
`evenIntegersClosedUnderMultiplication` TODO

Predicate logic:

  ∀ (a b : Int), (a ∈ LRA.AlgebraicStructures.Semigroup.Examples.EvenIntegers ∧ b ∈ LRA.AlgebraicStructures.Semigroup.Examples.EvenIntegers) → instHMul.hMul a b ∈ LRA.AlgebraicStructures.Semigroup.Examples.EvenIntegers

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (a ∈ LRA.AlgebraicStructures.Semigroup.Examples.EvenIntegers ∧ b ∈ LRA.AlgebraicStructures.Semigroup.Examples.EvenIntegers) → { hMul := fun a b => Int.instMul.mul a b }.hMul a b ∈ LRA.AlgebraicStructures.Semigroup.Examples.EvenIntegers

Logical form (Lean):

```lean
theorem evenIntegersClosedUnderMultiplication :
    ∀ a b, a ∈ EvenIntegers → b ∈ EvenIntegers → a * b ∈ EvenIntegers
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
theorem evenIntegersClosedUnderMultiplication :
    ∀ a b, a ∈ EvenIntegers → b ∈ EvenIntegers → a * b ∈ EvenIntegers := by
  sorry
noncomputable instance : Mul {n // n ∈ EvenIntegers} :=
  Magma.Constructions.ClosedSubsetMul evenIntegersClosedUnderMultiplication

noncomputable instance : Nonempty {n // n ∈ EvenIntegers} :=
  ⟨0, ⟨0, by ring⟩⟩

noncomputable instance :
    LRA.AlgebraicStructures.MultiplicativeSemigroupLaws {n // n ∈ EvenIntegers} := by
  sorry
end LRA.AlgebraicStructures.Semigroup.Examples
