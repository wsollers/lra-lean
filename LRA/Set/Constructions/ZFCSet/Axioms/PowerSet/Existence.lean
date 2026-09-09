import LRA.Set.Constructions.ZFCSet.Axioms.PowerSet.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.PowerSet.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`PowerSetOfExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), Exists fun P => LRA.Set.Constructions.ZFCSet.Axioms.IsPowerSetOf A P

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    Exists fun P => ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 x y → LRA.Set.Constructions.instMembershipZFCSet.1 A y

Logical form (Lean):

```lean
theorem PowerSetOfExists (A : Set) :
    ∃ P : Set, IsPowerSetOf A P
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
theorem PowerSetOfExists (A : Set) :
    ∃ P : Set, IsPowerSetOf A P := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
