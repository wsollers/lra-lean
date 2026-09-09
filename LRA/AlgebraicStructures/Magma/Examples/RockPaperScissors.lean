namespace LRA.AlgebraicStructures.Magma.Examples

/-! Rock-Paper-Scissors — a finite magma built directly, no ambient type needed.

Commutative and idempotent, but genuinely not associative: `(P * R) * S = S` while
`P * (R * S) = P`. That non-associativity is the point — a magma is not secretly
always a semigroup. -/

/--
`RPS` TODO

Predicate logic:

  inductive RPS where
    | rock | paper | scissors
    deriving DecidableEq, Repr

Predicate logic (unfolded):

  inductive RPS where
    | rock | paper | scissors
    deriving DecidableEq, Repr (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive RPS where
  | rock | paper | scissors
  deriving DecidableEq, Repr
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
inductive RPS where
  | rock | paper | scissors
  deriving DecidableEq, Repr

/--
`RPS.beats` TODO

Predicate logic:

  def RPS.beats : RPS → RPS → RPS
    | .rock, .scissors => .rock | .scissors, .rock => .rock
    | .paper, .rock => .paper | .rock, .paper => .paper
    | .scissors, .paper => .scissors | .paper, .scissors => .scissors
    | .rock, .rock => .rock | .paper, .paper => .paper | .scissors, .scissors => .scissors

Predicate logic (unfolded):

  def RPS.beats : RPS → RPS → RPS
    | .rock, .scissors => .rock | .scissors, .rock => .rock
    | .paper, .rock => .paper | .rock, .paper => .paper
    | .scissors, .paper => .scissors | .paper, .scissors => .scissors
    | .rock, .rock => .rock | .paper, .paper => .paper | .scissors, .scissors => .scissors (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RPS.beats : RPS → RPS → RPS
  | .rock, .scissors => .rock | .scissors, .rock => .rock
  | .paper, .rock => .paper | .rock, .paper => .paper
  | .scissors, .paper => .scissors | .paper, .scissors => .scissors
  | .rock, .rock => .rock | .paper, .paper => .paper | .scissors, .scissors => .scissors
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RPS.beats : RPS → RPS → RPS
  | .rock, .scissors => .rock | .scissors, .rock => .rock
  | .paper, .rock => .paper | .rock, .paper => .paper
  | .scissors, .paper => .scissors | .paper, .scissors => .scissors
  | .rock, .rock => .rock | .paper, .paper => .paper | .scissors, .scissors => .scissors

instance : Mul RPS := ⟨RPS.beats⟩
instance : Nonempty RPS := ⟨.rock⟩

/--
`rpsNotAssociative` TODO

Predicate logic:

  ¬ ∀ (a b c : LRA.AlgebraicStructures.Magma.Examples.RPS), instHMul.hMul (instHMul.hMul a b) c = instHMul.hMul a (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (a b c : LRA.AlgebraicStructures.Magma.Examples.RPS), { hMul := fun a b => LRA.AlgebraicStructures.Magma.Examples.instMulRPS.mul a b }.hMul ({ hMul := fun a b => LRA.AlgebraicStructures.Magma.Examples.instMulRPS.mul a b }.hMul a b) c = { hMul := fun a b => LRA.AlgebraicStructures.Magma.Examples.instMulRPS.mul a b }.hMul a ({ hMul := fun a b => LRA.AlgebraicStructures.Magma.Examples.instMulRPS.mul a b }.hMul b c)) → False

Logical form (Lean):

```lean
theorem rpsNotAssociative :
    ¬ ∀ a b c : RPS, (a * b) * c = a * (b * c)
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
theorem rpsNotAssociative :
    ¬ ∀ a b c : RPS, (a * b) * c = a * (b * c) := by
  sorry
end LRA.AlgebraicStructures.Magma.Examples
