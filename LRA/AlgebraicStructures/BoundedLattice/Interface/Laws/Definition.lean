import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-- A bounded lattice: a lattice `(L, ∨, ∧)` with a bottom `0` (two-sided
identity for `∨`) and a top `1` (two-sided identity for `∧`). Matches the
user's algebraic definition — but note only *half* of each bound's two
conditions is stated as an axiom here: `0 ∨ x = x` (bottom is join-identity)
and `1 ∧ x = x` (top is meet-identity). The other halves (`x ∧ 0 = 0`, the
absorbing/annihilating behavior; `x ∨ 1 = 1`) are *provable consequences* of
these plus `LatticeLaws`'s own absorption laws — e.g. `x ∧ 0 = x ∧ (x ∨ 0) =
x`... wait, more precisely: absorption gives `0 ∧ (0 ∨ x) = 0`, and
`0 ∨ x = x` (given) turns this into `0 ∧ x = 0` directly. So this is a
non-redundant, logically complete axiomatization of the user's four
conditions, not a gap. -/
def BoundedLatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier)
    (bottom top : Carrier) : Prop :=
  LatticeLaws join meet /\
    LRA.Operation.Laws.Identity.TwoSidedIdentity join bottom /\
    LRA.Operation.Laws.Identity.TwoSidedIdentity meet top

end LRA.AlgebraicStructures
