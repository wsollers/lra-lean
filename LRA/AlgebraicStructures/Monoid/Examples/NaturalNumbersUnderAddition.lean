import LRA.AlgebraicStructures.Monoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Monoid.Examples

/--
`NaturalNumbersUnderAddition` `(ℕ, +, 0)` — wrapped in a one-field structure since `Nat` already has its own native `Mul` (ordinary multiplication); here `*` has to mean addition on a distinct type, same reason as `Semigroup.Examples.NaturalsUnderAddition` (which this is the monoid completion of: same carrier and operation, but now including `0`, giving it the identity that subject's `PositiveIntegers` subtype deliberately excludes — see `Monoid.Failures. PositiveIntegersHaveNoIdentity`).

Predicate logic:

  structure NaturalNumbersUnderAddition where
    val : Nat

Predicate logic (unfolded):

  structure NaturalNumbersUnderAddition where
    val : Nat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure NaturalNumbersUnderAddition where
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
structure NaturalNumbersUnderAddition where
  val : Nat

instance : Mul NaturalNumbersUnderAddition := ⟨fun a b => ⟨a.val + b.val⟩⟩
instance : OfNat NaturalNumbersUnderAddition 1 := ⟨⟨0⟩⟩
instance : Nonempty NaturalNumbersUnderAddition := ⟨⟨0⟩⟩

instance :
    LRA.AlgebraicStructures.MonoidLaws NaturalNumbersUnderAddition where
  MulAssociative := by
    intro a b c
    sorry
  OneMul := by
    intro a
    sorry
  MulOne := by
    intro a
    sorry
end LRA.AlgebraicStructures.Monoid.Examples
