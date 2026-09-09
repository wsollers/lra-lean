import Mathlib.Order.Lattice
import LRA.AlgebraicStructures.DistributiveLattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`ofDistribLattice` Mathlib's `DistribLattice R` is exactly this: a `Lattice` where `⊔`/`⊓` distribute over each other (`le_sup_inf` and its dual). Safe as a plain theorem (not an `instance`), same reasoning as `Lattice`'s own bridge.

Predicate logic:

  ∀ {R : Type u} [inst : DistribLattice R], LRA.AlgebraicStructures.DistributiveLatticeLaws (fun x1 x2 => SemilatticeSup.toMax.max x1 x2) fun x1 x2 => SemilatticeInf.toMin.min x1 x2

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    ((((∀ (first second third : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) first second) third = (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) first ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) second third)) ∧ ((∀ (first second : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) first second = (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) second first) ∧ (∀ (element : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) element element = element))) ∧ (((∀ (first second third : R), (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) ((fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) first second) third = (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) first ((fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) second third)) ∧ ((∀ (first second : R), (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) first second = (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) second first) ∧ (∀ (element : R), (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) element element = element))) ∧ ((∀ (left right : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) left ((fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) left right) = left) ∧ (∀ (left right : R), (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) left ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) left right) = left)))) ∧ (((∀ (left right third : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) left ((fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) right third) = (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) left right) ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) left third)) ∧ (∀ (left right third : R), (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) ((fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) left right) third = (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) left third) ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) right third))) ∧ ((∀ (left right third : R), (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) left ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) right third) = (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) ((fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) left right) ((fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) left third)) ∧ (∀ (left right third : R), (fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) ((fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) left right) third = (fun x1 x2 => SemilatticeSup.toMax.1 x1 x2) ((fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) left third) ((fun x1 x2 => SemilatticeInf.toMin.1 x1 x2) right third)))))

Logical form (Lean):

```lean
theorem ofDistribLattice {R : Type u} [_root_.DistribLattice R] :
    LRA.AlgebraicStructures.DistributiveLatticeLaws
      (Carrier := R) (· ⊔ ·) (· ⊓ ·)
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
theorem ofDistribLattice {R : Type u} [_root_.DistribLattice R] :
    LRA.AlgebraicStructures.DistributiveLatticeLaws
      (Carrier := R) (· ⊔ ·) (· ⊓ ·) := by
  sorry
end LRA.AlgebraicStructures
