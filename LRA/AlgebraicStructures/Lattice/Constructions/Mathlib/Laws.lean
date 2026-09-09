import Mathlib.Order.Lattice
import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`ofLattice` Mathlib's own `Lattice` is exactly this: `⊔`/`⊓` are each associative, commutative, and idempotent, plus the two absorption laws (`sup_inf_self`/`inf_sup_self`) connecting them. Safe as a plain theorem (not an `instance`) about the explicit functions `(· ⊔ ·)`/`(· ⊓ ·)`, same reasoning as `JoinSemilattice`/`MeetSemilattice`'s own bridges — no competing-instance risk since nothing here is registered as anyone's `Mul`/`Add`.

Predicate logic:

  ∀ {R : Type u} [inst : Lattice R], LRA.AlgebraicStructures.LatticeLaws (fun x1 x2 => SemilatticeSup.toMax.max x1 x2) fun x1 x2 => SemilatticeInf.toMin.min x1 x2

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    (((∀ (first second third : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) first second) third = (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) first ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) second third)) ∧ ((∀ (first second : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) first second = (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) second first) ∧ (∀ (element : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) element element = element))) ∧ (((∀ (first second third : R), (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) ((fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) first second) third = (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) first ((fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) second third)) ∧ ((∀ (first second : R), (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) first second = (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) second first) ∧ (∀ (element : R), (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) element element = element))) ∧ ((∀ (left right : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) left ((fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) left right) = left) ∧ (∀ (left right : R), (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) left ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) left right) = left))))

Logical form (Lean):

```lean
theorem ofLattice {R : Type u} [_root_.Lattice R] :
    LatticeLaws (Carrier := R) (· ⊔ ·) (· ⊓ ·)
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
theorem ofLattice {R : Type u} [_root_.Lattice R] :
    LatticeLaws (Carrier := R) (· ⊔ ·) (· ⊓ ·) := by
  sorry
end LRA.AlgebraicStructures
