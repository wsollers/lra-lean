import LRA.Set.Constructions.ZFCSet.Axioms.Replacement.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Replacement.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`ReplacementImageExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (relation : LRA.Set.Constructions.ZFCSet.Axioms.Set → LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop), LRA.Set.Constructions.ZFCSet.Axioms.IsFunctionalOn A relation → Exists fun B => LRA.Set.Constructions.ZFCSet.Axioms.IsReplacementImageOf A relation B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    relation : Set → Set → Prop
  Prove
    (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 A x → Exists fun y => (relation x y ∧ (∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), relation x other → other = y))) → Exists fun B => ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
theorem ReplacementImageExists
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ∃ B : Set, IsReplacementImageOf A relation B
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
theorem ReplacementImageExists
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ∃ B : Set, IsReplacementImageOf A relation B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
