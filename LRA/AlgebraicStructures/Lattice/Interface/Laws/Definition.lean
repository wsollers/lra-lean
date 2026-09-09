import LRA.AlgebraicStructures.JoinSemilattice.Interface.Laws.Definition
import LRA.AlgebraicStructures.MeetSemilattice.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`LatticeLaws` A lattice, algebraically: `(L, ∨, ∧)` where `∨`/`∧` are each associative, commutative, and idempotent (i.e. `join`/`meet` are each a semilattice on their own), plus the two mutual absorption laws connecting them (`x ∨ (x ∧ y) = x` and `x ∧ (x ∨ y) = x`) — exactly the four identities of the user's algebraic definition. Equivalent to the order-theoretic definition (a poset where every pair has both a join and a meet) — see `LRA.Order.Lattices. Lattice.Definition` for that side, and `LRA.Order.Interop.AlgebraicLattice` for the already-built bidirectional bridge between the two (built before this reorg pass, in both directions: order→algebra via `OrderLatticeOperationsAreAlgebraic`, algebra→order via `AlgebraicLatticeJoinOrderIsOrderLattice`/ `AlgebraicLatticeMeetOrderIsOrderLattice`).  Takes `join`/`meet` as explicit operation parameters rather than via `[Mul R]`/ `[Add R]`, same reasoning as `JoinSemilatticeLaws`/`MeetSemilatticeLaws` themselves (see `DECISIONS.md` D6): a single carrier needs both operations to coexist at once.

Predicate logic:

  ∀ {Carrier : Type u} (join meet : LRA.Operation.BinaryEndoOperation Carrier), (LRA.AlgebraicStructures.JoinSemilatticeLaws join ∧ (LRA.AlgebraicStructures.MeetSemilatticeLaws meet ∧ LRA.Operation.Laws.Absorption.MutualAbsorptionLaw join meet))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (first second third : Carrier), join (join first second) third = join first (join second third)) ∧ ((∀ (first second : Carrier), join first second = join second first) ∧ (∀ (element : Carrier), join element element = element))) ∧ (((∀ (first second third : Carrier), meet (meet first second) third = meet first (meet second third)) ∧ ((∀ (first second : Carrier), meet first second = meet second first) ∧ (∀ (element : Carrier), meet element element = element))) ∧ ((∀ (left right : Carrier), join left (meet left right) = left) ∧ (∀ (left right : Carrier), meet left (join left right) = left))))

Logical form (Lean):

```lean
def LatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  JoinSemilatticeLaws join /\
    MeetSemilatticeLaws meet /\
    LRA.Operation.Laws.Absorption.MutualAbsorptionLaw join meet
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def LatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  JoinSemilatticeLaws join /\
    MeetSemilatticeLaws meet /\
    LRA.Operation.Laws.Absorption.MutualAbsorptionLaw join meet

end LRA.AlgebraicStructures
