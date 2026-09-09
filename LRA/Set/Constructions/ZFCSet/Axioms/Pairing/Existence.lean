import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`PairSetExists` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Axioms.Set), Exists fun P => LRA.Set.Constructions.ZFCSet.Axioms.IsPairSet A B P

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : Set
  Prove
    Exists fun P => ∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 P w ↔ Or (w = A)(w = B)

Logical form (Lean):

```lean
theorem PairSetExists (A B : Set) :
    ∃ P : Set, IsPairSet A B P
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
theorem PairSetExists (A B : Set) :
    ∃ P : Set, IsPairSet A B P := by

  rcases Pairing A B with ⟨C, hypothesis⟩
  refine ⟨C, ?_⟩
  intro x
  constructor
  . -- -> mp
    intro hypo
    rw [hypothesis] at hypo
    exact hypo
  . -- <- mpr
    intro hypo
    rw [hypothesis]
    exact hypo






end LRA.Set.Constructions.ZFCSet.Axioms
