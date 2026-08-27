import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-- A meet-semilattice, algebraically: `(S, ∧)` where `∧` is associative,
commutative, and idempotent. Equivalent to the order-theoretic definition
(a poset where every pair has an infimum) — see `LRA.Order.Lattices.
MeetSemilattice.Definition` for that side; no bridge between the two exists yet
(future Interop work, out of scope for this reorg pass).

Takes `meet` as an explicit operation parameter rather than via `[Mul R]`/
`[Add R]` like every other subject in this tree — deliberately, for the same
reason as `JoinSemilatticeLaws`: `Lattice` (built on this and
`JoinSemilattice`) needs *both* `join` and `meet` to coexist as independent
operations on the *same* carrier at once, which a single instance-per-type
typeclass parameter cannot express (a type can't carry two competing `Mul R`
instances simultaneously). See `DECISIONS.md` D6. -/
def MeetSemilatticeLaws {Carrier : Type u}
    (meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LRA.Operation.Laws.Associative.Associative meet /\
    LRA.Operation.Laws.Commutative.Commutative meet /\
    LRA.Operation.Laws.Idempotent.Idempotent meet

end LRA.AlgebraicStructures
