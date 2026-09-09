import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`SeparatedSubsetExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (property : LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop), Exists fun B => LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A property B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    property : Set → Prop
  Prove
    Exists fun B => ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 B x ↔ (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ property x)

Logical form (Lean):

```lean
theorem SeparatedSubsetExists (A : Set) (property : Set → Prop) :
    ∃ B : Set, IsSeparatedSubset A property B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem SeparatedSubsetExists (A : Set) (property : Set → Prop) :
    ∃ B : Set, IsSeparatedSubset A property B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
