import Mathlib.Algebra.Group.Even
import Mathlib.Tactic.Ring
import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.AdditiveSemigroup.Examples

/-! Even integers under addition — `(2ℤ, +)`. Closed (sum of two evens is even)
and associative (`Int.add_assoc`, Lean core). Unlike `Semigroup.Examples.
EvenIntegersUnderMultiplication`, `2ℤ` under `+` actually does have an identity
(`0`) and inverses, making it an abelian group — but that's out of scope here,
this item only needs the semigroup fact. -/

instance : LRA.AlgebraicStructures.AdditiveSemigroupLaws Int := by
  sorry
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
`evenIntegersClosedUnderAddition` TODO

Predicate logic:

  ∀ (a b : Int), (a ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.EvenIntegers ∧ b ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.EvenIntegers) → instHAdd.hAdd a b ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.EvenIntegers

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (a ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.EvenIntegers ∧ b ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.EvenIntegers) → { hAdd := fun a b => Int.instAdd.add a b }.hAdd a b ∈ LRA.AlgebraicStructures.AdditiveSemigroup.Examples.EvenIntegers

Logical form (Lean):

```lean
theorem evenIntegersClosedUnderAddition :
    ∀ a b, a ∈ EvenIntegers → b ∈ EvenIntegers → a + b ∈ EvenIntegers
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
theorem evenIntegersClosedUnderAddition :
    ∀ a b, a ∈ EvenIntegers → b ∈ EvenIntegers → a + b ∈ EvenIntegers := by
  sorry
noncomputable instance : Add {n // n ∈ EvenIntegers} :=
  LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.ClosedSubsetAdd
    evenIntegersClosedUnderAddition

noncomputable instance : Nonempty {n // n ∈ EvenIntegers} := by
  sorry

noncomputable instance :
    LRA.AlgebraicStructures.AdditiveSemigroupLaws {n // n ∈ EvenIntegers} := by
  sorry
end LRA.AlgebraicStructures.AdditiveSemigroup.Examples
