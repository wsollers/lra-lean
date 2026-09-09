import Mathlib.Order.Lattice
import LRA.AlgebraicStructures.JoinSemilattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`ofSemilatticeSup` Mathlib's own `SemilatticeSup` is exactly this: `⊔` is associative, commutative, and idempotent. Safe as a plain theorem (not an `instance`) about the explicit function `(· ⊔ ·)`, unlike the `Mul`-instance bridges elsewhere in this tree — there's no competing-instance risk here at all, since nothing is being registered as anyone's `Mul`/`Add`.

Predicate logic:

  ∀ {R : Type u} [inst : SemilatticeSup R], LRA.AlgebraicStructures.JoinSemilatticeLaws fun x1 x2 => SemilatticeSup.toMax.max x1 x2

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    ((∀ (first second third : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) first second) third = (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) first ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) second third)) ∧ ((∀ (first second : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) first second = (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) second first) ∧ (∀ (element : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) element element = element)))

Logical form (Lean):

```lean
theorem ofSemilatticeSup {R : Type u} [SemilatticeSup R] :
    JoinSemilatticeLaws (Carrier := R) (· ⊔ ·)
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
theorem ofSemilatticeSup {R : Type u} [SemilatticeSup R] :
    JoinSemilatticeLaws (Carrier := R) (· ⊔ ·) := by
  sorry
end LRA.AlgebraicStructures
