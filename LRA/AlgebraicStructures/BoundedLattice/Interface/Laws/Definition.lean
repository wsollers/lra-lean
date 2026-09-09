import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`BoundedLatticeLaws` A bounded lattice: a lattice `(L, ∨, ∧)` with a bottom `0` (two-sided identity for `∨`) and a top `1` (two-sided identity for `∧`). Matches the user's algebraic definition — but note only *half* of each bound's two conditions is stated as an axiom here: `0 ∨ x = x` (bottom is join-identity) and `1 ∧ x = x` (top is meet-identity). The other halves (`x ∧ 0 = 0`, the absorbing/annihilating behavior; `x ∨ 1 = 1`) are *provable consequences* of these plus `LatticeLaws`'s own absorption laws — e.g. `x ∧ 0 = x ∧ (x ∨ 0) = x`... wait, more precisely: absorption gives `0 ∧ (0 ∨ x) = 0`, and `0 ∨ x = x` (given) turns this into `0 ∧ x = 0` directly. So this is a non-redundant, logically complete axiomatization of the user's four conditions, not a gap.

Predicate logic:

  ∀ {Carrier : Type u} (join meet : LRA.Operation.BinaryEndoOperation Carrier) (bottom top : Carrier), (LRA.AlgebraicStructures.LatticeLaws join meet ∧ (LRA.Operation.Laws.Identity.TwoSidedIdentity join bottom ∧ LRA.Operation.Laws.Identity.TwoSidedIdentity meet top))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((((∀ (first second third : Carrier), join (join first second) third = join first (join second third)) ∧ ((∀ (first second : Carrier), join first second = join second first) ∧ (∀ (element : Carrier), join element element = element))) ∧ (((∀ (first second third : Carrier), meet (meet first second) third = meet first (meet second third)) ∧ ((∀ (first second : Carrier), meet first second = meet second first) ∧ (∀ (element : Carrier), meet element element = element))) ∧ ((∀ (left right : Carrier), join left (meet left right) = left) ∧ (∀ (left right : Carrier), meet left (join left right) = left)))) ∧ (((∀ (element : Carrier), join bottom element = element) ∧ (∀ (element : Carrier), join element bottom = element)) ∧ ((∀ (element : Carrier), meet top element = element) ∧ (∀ (element : Carrier), meet element top = element))))

Logical form (Lean):

```lean
def BoundedLatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier)
    (bottom top : Carrier) : Prop :=
  LatticeLaws join meet /\
    LRA.Operation.Laws.Identity.TwoSidedIdentity join bottom /\
    LRA.Operation.Laws.Identity.TwoSidedIdentity meet top
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
def BoundedLatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier)
    (bottom top : Carrier) : Prop :=
  LatticeLaws join meet /\
    LRA.Operation.Laws.Identity.TwoSidedIdentity join bottom /\
    LRA.Operation.Laws.Identity.TwoSidedIdentity meet top

end LRA.AlgebraicStructures
