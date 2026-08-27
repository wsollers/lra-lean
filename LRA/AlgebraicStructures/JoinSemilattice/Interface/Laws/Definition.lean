import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-- A join-semilattice, algebraically: `(S, ∨)` where `∨` is associative,
commutative, and idempotent. Equivalent to the order-theoretic definition
(a poset where every pair has a supremum) — see `LRA.Order.Lattices.
JoinSemilattice.Definition` for that side; no bridge between the two exists yet
(future Interop work, out of scope for this reorg pass).

Takes `join` as an explicit operation parameter rather than via `[Mul R]`/
`[Add R]` like every other subject in this tree — deliberately: `Lattice`
(built on this and `MeetSemilattice`) needs *both* `join` and `meet` to coexist
as independent operations on the *same* carrier at once, which a single
instance-per-type typeclass parameter cannot express (a type can't carry two
competing `Mul R` instances simultaneously). See `DECISIONS.md` D6. -/
def JoinSemilatticeLaws {Carrier : Type u}
    (join : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LRA.Operation.Laws.Associative.Associative join /\
    LRA.Operation.Laws.Commutative.Commutative join /\
    LRA.Operation.Laws.Idempotent.Idempotent join

end LRA.AlgebraicStructures
