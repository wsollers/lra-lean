import LRA.AlgebraicStructures.JoinSemilattice.Interface.Laws.Definition
import LRA.AlgebraicStructures.MeetSemilattice.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-- A lattice, algebraically: `(L, ∨, ∧)` where `∨`/`∧` are each associative,
commutative, and idempotent (i.e. `join`/`meet` are each a semilattice on
their own), plus the two mutual absorption laws connecting them
(`x ∨ (x ∧ y) = x` and `x ∧ (x ∨ y) = x`) — exactly the four identities of the
user's algebraic definition. Equivalent to the order-theoretic definition (a
poset where every pair has both a join and a meet) — see `LRA.Order.Lattices.
Lattice.Definition` for that side, and `LRA.Order.Interop.AlgebraicLattice`
for the already-built bidirectional bridge between the two (built before this
reorg pass, in both directions: order→algebra via `OrderLatticeOperationsAreAlgebraic`,
algebra→order via `AlgebraicLatticeJoinOrderIsOrderLattice`/
`AlgebraicLatticeMeetOrderIsOrderLattice`).

Takes `join`/`meet` as explicit operation parameters rather than via `[Mul R]`/
`[Add R]`, same reasoning as `JoinSemilatticeLaws`/`MeetSemilatticeLaws`
themselves (see `DECISIONS.md` D6): a single carrier needs both operations to
coexist at once. -/
def LatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  JoinSemilatticeLaws join /\
    MeetSemilatticeLaws meet /\
    LRA.Operation.Laws.Absorption.MutualAbsorptionLaw join meet

end LRA.AlgebraicStructures
