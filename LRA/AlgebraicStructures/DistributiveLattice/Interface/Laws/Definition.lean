import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-- A distributive lattice: a lattice `(L, ∨, ∧)` where each of `∨`/`∧`
distributes over the other. States both directions —
`TwoSidedDistributive join meet` (join distributes over meet: the dual
identity `x∨(y∧z)=(x∨y)∧(x∨z)`) and `TwoSidedDistributive meet join` (meet
distributes over join: the user's primary identity `x∧(y∨z)=(x∧y)∨(x∧z)`) —
even though the user's own spec notes these are *equivalent* given the
lattice axioms (asserting either implies the other), so only one is strictly
needed as an axiom. Kept both as explicit conjuncts anyway, matching this
tree's general style of stating two-sided properties directly rather than
hunting for a minimal axiom set (e.g. `TwoSidedIdentity`/`TwoSidedInverse`
elsewhere do the same under commutativity, where one side would also follow
from the other). Not a bug — a deliberate, harmless redundancy. -/
def DistributiveLatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LatticeLaws join meet /\
    LRA.Operation.Laws.Distributive.TwoSidedDistributive join meet /\
    LRA.Operation.Laws.Distributive.TwoSidedDistributive meet join

end LRA.AlgebraicStructures
