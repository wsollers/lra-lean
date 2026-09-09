import LRA.Set.Constructions.ZFCSet.Axioms.Union.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Union.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`UnionOverExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), Exists fun U => LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf A U

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    Exists fun U => ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipZFCSet.1 A B ∧ LRA.Set.Constructions.instMembershipZFCSet.1 B x)

Logical form (Lean):

```lean
theorem UnionOverExists (A : Set) :
    ∃ U : Set, IsUnionOf A U
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem UnionOverExists (A : Set) :
    ∃ U : Set, IsUnionOf A U := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
