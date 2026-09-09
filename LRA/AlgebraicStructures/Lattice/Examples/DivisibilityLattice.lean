import Mathlib.Data.Nat.GCD.Basic
import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Lattice.Examples

/--
`divisibilityIsLattice` `(ℕ, lcm, gcd)` — the divisibility lattice: join is the least common multiple, meet is the greatest common divisor. Dual pair to `MeetSemilattice.Examples.GcdOnNaturals`, now paired with `lcm` to give the full lattice the user's spec describes for `(ℕ_{>0}, ∣)`. Stated on all of `ℕ` rather than the positive naturals, same reasoning as `GcdOnNaturals`: the lattice identities need no positivity side-condition to state (though `lcm`/ `gcd` at `0` are degenerate — `gcd 0 0 = 0`, `lcm 0 n = 0` — the algebraic laws still hold throughout `ℕ`).

Predicate logic:

  LRA.AlgebraicStructures.LatticeLaws Nat.lcm Nat.gcd

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (first second third : Nat), { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul ({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul first second) (first.gcd second)) third) (({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul first second) (first.gcd second)).gcd third) = { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul first ({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul second third) (second.gcd third))) (first.gcd ({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul second third) (second.gcd third)))) ∧ ((∀ (first second : Nat), { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul first second) (first.gcd second) = { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul second first) (second.gcd first)) ∧ (∀ (element : Nat), { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul element element) (element.gcd element) = element))) ∧ (((∀ (first second third : Nat), (first.gcd second).gcd third = first.gcd (second.gcd third)) ∧ ((∀ (first second : Nat), first.gcd second = second.gcd first) ∧ (∀ (element : Nat), element.gcd element = element))) ∧ ((∀ (left right : Nat), { hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul left (left.gcd right)) (left.gcd (left.gcd right)) = left) ∧ (∀ (left right : Nat), left.gcd ({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul left right) (left.gcd right)) = left))))

Logical form (Lean):

```lean
theorem divisibilityIsLattice :
    LRA.AlgebraicStructures.LatticeLaws Nat.lcm Nat.gcd
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
theorem divisibilityIsLattice :
    LRA.AlgebraicStructures.LatticeLaws Nat.lcm Nat.gcd := by
  sorry
end LRA.AlgebraicStructures.Lattice.Examples
