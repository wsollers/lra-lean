import Mathlib.Data.Nat.GCD.Basic
import LRA.AlgebraicStructures.BoundedLattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.BoundedLattice.Examples

variable {n : Nat}

/--
`Divisors` The divisors of a fixed `n > 0`, ordered by divisibility — `(𝒟_n, lcm, gcd, 1, n)`. Bottom is `1` (divides everything, including every divisor of `n`), top is `n` itself (every divisor of `n` divides `n`, trivially). `lcm`/ `gcd` of two divisors of `n` stay divisors of `n` — `lcmStaysDivisor` is the one non-trivial closure fact (`gcdStaysDivisor` is immediate, `gcd a b ∣ a`).

Predicate logic:

  def Divisors (n : Nat) : Type := {d : Nat // d ∣ n}

Predicate logic (unfolded):

  def Divisors (n : Nat) : Type := {d : Nat // d ∣ n} (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Divisors (n : Nat) : Type := {d : Nat // d ∣ n}
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
def Divisors (n : Nat) : Type := {d : Nat // d ∣ n}

/--
`lcmStaysDivisor` TODO

Predicate logic:

  ∀ {n : Nat} (a b : LRA.AlgebraicStructures.BoundedLattice.Examples.Divisors n), Nat.instDvd.dvd (a.val.lcm b.val) n

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    n : Nat
    a b : Divisors n
  Prove
    Nat.instDvd.1 ({ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul a.1 b.1) (a.1.gcd b.1)) n

Logical form (Lean):

```lean
theorem lcmStaysDivisor (a b : Divisors n) : Nat.lcm a.1 b.1 ∣ n
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
theorem lcmStaysDivisor (a b : Divisors n) : Nat.lcm a.1 b.1 ∣ n := by
  sorry
/--
`gcdStaysDivisor` TODO

Predicate logic:

  ∀ {n : Nat} (a b : LRA.AlgebraicStructures.BoundedLattice.Examples.Divisors n), Nat.instDvd.dvd (a.val.gcd b.val) n

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    n : Nat
    a b : Divisors n
  Prove
    Nat.instDvd.1 (a.1.gcd b.1) n

Logical form (Lean):

```lean
theorem gcdStaysDivisor (a b : Divisors n) : Nat.gcd a.1 b.1 ∣ n
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
theorem gcdStaysDivisor (a b : Divisors n) : Nat.gcd a.1 b.1 ∣ n := by
  sorry
/--
`divisorJoin` TODO

Predicate logic:

  def divisorJoin (a b : Divisors n) : Divisors n := ⟨Nat.lcm a.1 b.1, lcmStaysDivisor a b⟩

Predicate logic (unfolded):

  def divisorJoin (a b : Divisors n) : Divisors n := ⟨Nat.lcm a.1 b.1, lcmStaysDivisor a b⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def divisorJoin (a b : Divisors n) : Divisors n := ⟨Nat.lcm a.1 b.1, lcmStaysDivisor a b⟩
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
def divisorJoin (a b : Divisors n) : Divisors n := ⟨Nat.lcm a.1 b.1, lcmStaysDivisor a b⟩
/--
`divisorMeet` TODO

Predicate logic:

  def divisorMeet (a b : Divisors n) : Divisors n := ⟨Nat.gcd a.1 b.1, gcdStaysDivisor a b⟩

Predicate logic (unfolded):

  def divisorMeet (a b : Divisors n) : Divisors n := ⟨Nat.gcd a.1 b.1, gcdStaysDivisor a b⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def divisorMeet (a b : Divisors n) : Divisors n := ⟨Nat.gcd a.1 b.1, gcdStaysDivisor a b⟩
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
def divisorMeet (a b : Divisors n) : Divisors n := ⟨Nat.gcd a.1 b.1, gcdStaysDivisor a b⟩

/--
`divisorLatticeIsBounded` TODO

Predicate logic:

  ∀ {n : Nat}, LRA.AlgebraicStructures.BoundedLatticeLaws LRA.AlgebraicStructures.BoundedLattice.Examples.divisorJoin LRA.AlgebraicStructures.BoundedLattice.Examples.divisorMeet ⟨1, ⋯⟩ ⟨n, ⋯⟩

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    n : Nat
  Prove
    ((((∀ (first second third : Subtype fun d => Nat.instDvd.1 d n), ⟨instHDiv.hDiv (instHMul.hMul (LRA.AlgebraicStructures.BoundedLattice.Examples.divisorJoin first second).val third.val) ((LRA.AlgebraicStructures.BoundedLattice.Examples.divisorJoin first second).val.gcd third.val), ⋯⟩ = ⟨instHDiv.hDiv (instHMul.hMul first.val (LRA.AlgebraicStructures.BoundedLattice.Examples.divisorJoin second third).val) (first.val.gcd (LRA.AlgebraicStructures.BoundedLattice.Examples.divisorJoin second third).val), ⋯⟩) ∧ ((∀ (first second : Subtype fun d => Nat.instDvd.1 d n), ⟨instHDiv.hDiv (instHMul.hMul first.val second.val) (first.val.gcd second.val), ⋯⟩ = ⟨instHDiv.hDiv (instHMul.hMul second.val first.val) (second.val.gcd first.val), ⋯⟩) ∧ (∀ (element : Subtype fun d => Nat.instDvd.1 d n), ⟨instHDiv.hDiv (instHMul.hMul element.val element.val) (element.val.gcd element.val), ⋯⟩ = element))) ∧ (((∀ (first second third : Subtype fun d => Nat.instDvd.1 d n), ⟨(LRA.AlgebraicStructures.BoundedLattice.Examples.divisorMeet first second).1.gcd third.1, ⋯⟩ = ⟨first.1.gcd (LRA.AlgebraicStructures.BoundedLattice.Examples.divisorMeet second third).1, ⋯⟩) ∧ ((∀ (first second : Subtype fun d => Nat.instDvd.1 d n), ⟨first.1.gcd second.1, ⋯⟩ = ⟨second.1.gcd first.1, ⋯⟩) ∧ (∀ (element : Subtype fun d => Nat.instDvd.1 d n), ⟨element.1.gcd element.1, ⋯⟩ = element))) ∧ ((∀ (left right : Subtype fun d => Nat.instDvd.1 d n), ⟨instHDiv.hDiv (instHMul.hMul left.val (LRA.AlgebraicStructures.BoundedLattice.Examples.divisorMeet left right).val) (left.val.gcd (LRA.AlgebraicStructures.BoundedLattice.Examples.divisorMeet left right).val), ⋯⟩ = left) ∧ (∀ (left right : Subtype fun d => Nat.instDvd.1 d n), ⟨left.1.gcd (LRA.AlgebraicStructures.BoundedLattice.Examples.divisorJoin left right).1, ⋯⟩ = left)))) ∧ (((∀ (element : Subtype fun d => Nat.instDvd.1 d n), ⟨{ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul ⟨1, ⋯⟩.1 element.1) (⟨1, ⋯⟩.1.gcd element.1), ⋯⟩ = element) ∧ (∀ (element : Subtype fun d => Nat.instDvd.1 d n), ⟨{ hDiv := fun a b => Nat.instDiv.div a b }.hDiv ({ hMul := fun a b => instMulNat.mul a b }.hMul element.1 ⟨1, ⋯⟩.1) (element.1.gcd ⟨1, ⋯⟩.1), ⋯⟩ = element)) ∧ ((∀ (element : Subtype fun d => Nat.instDvd.1 d n), ⟨⟨n, ⋯⟩.1.gcd element.1, ⋯⟩ = element) ∧ (∀ (element : Subtype fun d => Nat.instDvd.1 d n), ⟨element.1.gcd ⟨n, ⋯⟩.1, ⋯⟩ = element))))

Logical form (Lean):

```lean
theorem divisorLatticeIsBounded :
    LRA.AlgebraicStructures.BoundedLatticeLaws
      (divisorJoin (n := n)) (divisorMeet (n := n))
      (⟨1, one_dvd n⟩ : Divisors n) (⟨n, dvd_refl n⟩ : Divisors n)
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
theorem divisorLatticeIsBounded :
    LRA.AlgebraicStructures.BoundedLatticeLaws
      (divisorJoin (n := n)) (divisorMeet (n := n))
      (⟨1, one_dvd n⟩ : Divisors n) (⟨n, dvd_refl n⟩ : Divisors n) := by
  sorry
end LRA.AlgebraicStructures.BoundedLattice.Examples
