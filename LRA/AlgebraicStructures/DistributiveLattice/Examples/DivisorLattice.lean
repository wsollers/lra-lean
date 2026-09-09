import Mathlib.Data.Nat.GCD.Basic
import LRA.AlgebraicStructures.DistributiveLattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.DistributiveLattice.Examples

/--
`divisorLatticeIsDistributive` `(ℕ, lcm, gcd)` — the divisibility lattice is distributive: `lcm` distributes over `gcd` and vice versa. Direct, dual pair to `Lattice.Examples.DivisibilityLattice` and `MeetSemilattice.Examples. GcdOnNaturals`, now with the distributivity claim added on top of the plain lattice one.

Predicate logic:

  LRA.AlgebraicStructures.DistributiveLatticeLaws Nat.lcm Nat.gcd

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((((∀ (first second third : Nat), { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul (instHDiv.hDiv (instHMul.hMul first second) (first.gcd second)) third) ((instHDiv.hDiv (instHMul.hMul first second) (first.gcd second)).gcd third) = { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul first (instHDiv.hDiv (instHMul.hMul second third) (second.gcd third))) (first.gcd (instHDiv.hDiv (instHMul.hMul second third) (second.gcd third)))) ∧ ((∀ (first second : Nat), { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul first second) (first.gcd second) = { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul second first) (second.gcd first)) ∧ (∀ (element : Nat), { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul element element) (element.gcd element) = element))) ∧ (((∀ (first second third : Nat), (first.gcd second).gcd third = first.gcd (second.gcd third)) ∧ ((∀ (first second : Nat), first.gcd second = second.gcd first) ∧ (∀ (element : Nat), element.gcd element = element))) ∧ ((∀ (left right : Nat), { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul left (left.gcd right)) (left.gcd (left.gcd right)) = left) ∧ (∀ (left right : Nat), left.gcd ({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul left right) (left.gcd right)) = left)))) ∧ (((∀ (left right third : Nat), { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul left (right.gcd third)) (left.gcd (right.gcd third)) = ({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul left right) (left.gcd right)).gcd ({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul left third) (left.gcd third))) ∧ (∀ (left right third : Nat), { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul (left.gcd right) third) ((left.gcd right).gcd third) = ({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul left third) (left.gcd third)).gcd ({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul right third) (right.gcd third)))) ∧ ((∀ (left right third : Nat), left.gcd ({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul right third) (right.gcd third)) = { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul (left.gcd right) (left.gcd third)) ((left.gcd right).gcd (left.gcd third))) ∧ (∀ (left right third : Nat), ({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul left right) (left.gcd right)).gcd third = { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul (left.gcd third) (right.gcd third)) ((left.gcd third).gcd (right.gcd third))))))

Logical form (Lean):

```lean
theorem divisorLatticeIsDistributive :
    LRA.AlgebraicStructures.DistributiveLatticeLaws Nat.lcm Nat.gcd
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
theorem divisorLatticeIsDistributive :
    LRA.AlgebraicStructures.DistributiveLatticeLaws Nat.lcm Nat.gcd := by
  sorry
end LRA.AlgebraicStructures.DistributiveLattice.Examples
