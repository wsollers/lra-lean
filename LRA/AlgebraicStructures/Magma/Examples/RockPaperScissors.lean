namespace LRA.AlgebraicStructures.Magma.Examples

/-! Rock-Paper-Scissors — a finite magma built directly, no ambient type needed.

Commutative and idempotent, but genuinely not associative: `(P * R) * S = S` while
`P * (R * S) = P`. That non-associativity is the point — a magma is not secretly
always a semigroup. -/

inductive RPS where
  | rock | paper | scissors
  deriving DecidableEq, Repr

def RPS.beats : RPS → RPS → RPS
  | .rock, .scissors => .rock | .scissors, .rock => .rock
  | .paper, .rock => .paper | .rock, .paper => .paper
  | .scissors, .paper => .scissors | .paper, .scissors => .scissors
  | .rock, .rock => .rock | .paper, .paper => .paper | .scissors, .scissors => .scissors

instance : Mul RPS := ⟨RPS.beats⟩
instance : Nonempty RPS := ⟨.rock⟩

theorem rpsNotAssociative :
    ¬ ∀ a b c : RPS, (a * b) * c = a * (b * c) := by
  intro h
  have key := h .paper .rock .scissors
  simp only [HMul.hMul, Mul.mul, RPS.beats] at key
  exact absurd key (by decide)

end LRA.AlgebraicStructures.Magma.Examples
